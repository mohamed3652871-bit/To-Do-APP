import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do_app/core/network/api_response.dart';

import '../../features/auth/data/login_response_model.dart';
import '../../features/auth/data/user_model.dart';
import '../../features/home/data/task_model.dart';
import '../cache/cache_helper.dart';
import '../cache/cache_keys.dart';
import 'end_points.dart';

abstract class APIHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseURL,
      connectTimeout: const Duration(seconds: 10),
    ),
  );

  static Future init() async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // print("--- Headers : ${options.headers.toString()}");
          // print("--- endpoint : ${options.path.toString()}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // print("--- Response : ${response.data.toString()}");
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          // print("--- Error : ${error.response?.data.toString()}");
          var errorResponse = error.response?.data as Map<String, dynamic>;
          try {
            if (errorResponse['message'].toString().contains(
              'Token has expired.',
            )) {
              var result = await _dio.post(
                EndPoints.refreshToken,
                options: Options(
                  headers: {
                    'Authorization':
                        'Bearer ${await CacheHelper.getValue(CacheKeys.refreshToken)}',
                  },
                ),
              );
              var accessData = result.data as Map<String, dynamic>;
              await CacheHelper.setValue(
                CacheKeys.accessToken,
                accessData['access_token'],
              );

              final options = error.requestOptions;
              if (options.data is FormData) {
                final oldFormData = options.data as FormData;

                final Map<String, dynamic> formMap = {};
                for (var entry in oldFormData.fields) {
                  formMap[entry.key] = entry.value;
                }

                for (var file in oldFormData.files) {
                  formMap[file.key] = file.value;
                }

                options.data = FormData.fromMap(formMap);
              }
              options.headers['Authorization'] =
                  'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken) ?? ''}';
              final response = await _dio.fetch(options);
              return handler.resolve(response);
            }
          } catch (e) {
            // TODO Handle error if needed
          }

          return handler.next(error);
        },
      ),
    );
  }

  static Future<ApiResponse> postRequest({
    required String endPoint,
    required Map<String, dynamic>? data,
    bool isFormData = false,
    bool isAuthorized = false,
  }) async
  {
    try {
      final response = await _dio.post(
        endPoint,
        data: data == null
            ? null
            : isFormData
            ? FormData.fromMap(data)
            : data,
        options: isAuthorized
            ? Options(
                headers: {
                  'Authorization':
                      'Bearer ${CacheHelper.getValue(CacheKeys.accessToken)}',
                },
              )
            : null,
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e);
    }
  }

  static Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool isAuthorized=false,
  }) async
  {
    try{
      final response = await _dio.get(
        endPoint,
        queryParameters:queryParameters,
        options:isAuthorized? Options(
          headers: {
            'Authorization':
            'Bearer ${CacheHelper.getValue(CacheKeys.accessToken)}',
          },
      ):null
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e);
    }
  }

  static Future<ApiResponse> putRequest({
    required String endPoint,
    required Map<String, dynamic>? queryParameters,
    bool isAuthorized=false,
  })async
  {
    try{
      final response=await _dio.put(
        endPoint,
        queryParameters:queryParameters,
        options:isAuthorized? Options(
          headers: {
            'Authorization':
            'Bearer ${CacheHelper.getValue(CacheKeys.accessToken)}'
          }
        ):null
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e);
    }
  }
  static Future<ApiResponse> deleteRequest({
    required String endPoint,
    required var data,
    bool isAuthorized=false,
    bool isFormData=false,
  })async
  {
    try{
      final response = await _dio.delete(
          endPoint,
          data: data == null
              ? null
              : isFormData
              ? FormData.fromMap(data)
              : data,
          options: isAuthorized
              ? Options(
              headers: {
                'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken) ?? ''}',
              }
          ):null
      );
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e);
    }

}




  static Future<Either<String, UserModel>> login({
    required String username,
    required String password,
  }) async
  {
    try {
      var loginResponse = await _dio.post(
        EndPoints.login,
        data: FormData.fromMap({'username': username, 'password': password}),
      );

      var loginResponseModel = LoginResponseModel.fromJson(
        loginResponse.data as Map<String, dynamic>,
      );

      final user = loginResponseModel.userModel;
      if (user == null) {
        return Left("User data is missing from server response");
      }

      await CacheHelper.setValue(
        CacheKeys.accessToken,
        loginResponseModel.accessToken ?? "",
      );
      await CacheHelper.setValue(CacheKeys.username, user.username ?? "User");
      await CacheHelper.setValue('name', user.username ?? "User");
      await CacheHelper.setValue(
        CacheKeys.refreshToken,
        loginResponseModel.refreshToken ?? "",
      );
      await CacheHelper.setValue(CacheKeys.userImage, user.userImagePath ?? "");

      return Right(user);
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data;
        if (errorResponse is Map<String, dynamic>) {
          return Left(errorResponse['message'] ?? 'Unknown error');
        }
        return Left('Server error: ${e.response?.statusCode}');
      } else {
        return Left('An Error occurred while saving data.');
      }
    }
  }

  static Future<Either<String, String>> register({
    required String username,
    required String password,
    String? imagePath,
  }) async
  {
    try {
      var response = await _dio.post(
        EndPoints.register,
        data: FormData.fromMap({
          'username': username,
          'password': password,
          if (imagePath != null)
            'image': await MultipartFile.fromFile(imagePath),
        }),
      );

      if (response.data['status'] == true) {
        return Right(response.data['message'] ?? 'Registered Successfully');
      } else {
        return Left(response.data['message'] ?? 'Registration Failed');
      }
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data;
        if (errorResponse is Map<String, dynamic>) {
          return Left(errorResponse['message'] ?? 'Unknown error');
        }
        return Left('Server error: ${e.response?.statusCode}');
      } else {
        return Left('An Error occurred.\nTry again later');
      }
    }
  }

  //Tasks
  static Future<Either<String, List<TaskModel>>> getTasks() async
  {
    try {
      var response = await _dio.get(
        EndPoints.getTasks,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}',
          },
        ),
      );
      var tasksResponse = response.data as Map<String, dynamic>;
      List<TaskModel> tasks = [];
      for (var taskJson in tasksResponse['tasks']) {
        tasks.add(TaskModel.fromJson(taskJson));
      }
      return Right(tasks);
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data;
        if (errorResponse is Map) {
          return Left(errorResponse['message'] ?? 'Unknown error');
        }
        return Left('Server error: ${e.response?.statusCode}');
      }
      return Left('An Error occurred.');
    }
  }

  static Future<Either<String, TaskModel>> addTask({
    required String title,
    required String description,
  }) async
  {
    try {
      var response = await _dio.post(
        EndPoints.newTask,
        data: FormData.fromMap({'title': title, 'description': description}),
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}',
          },
        ),
      );

      var taskData = response.data;
      var taskModel = TaskModel.fromJson(taskData as Map<String, dynamic>);

      return Right(taskModel);
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data;
        if (errorResponse is Map<String, dynamic>) {
          return Left(errorResponse['message'] ?? 'Failed to add task');
        }
        return Left('Server error: ${e.response?.statusCode}');
      } else {
        return Left('An Error occurred while adding the task.');
      }
    }
  }

  static Future<Either<String, String>> updateTask({
    required int taskId,
    required String title,
    required String description,
  }) async
  {
    try {
      var response = await _dio.put(
        '${EndPoints.updateTask}$taskId',
        data: FormData.fromMap({'title': title, 'description': description}),
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}',
          },
        ),
      );
      var data = response.data as Map<String, dynamic>;
      return right(data['message'] ?? 'Task updated successfully');
    } catch (e) {
      if (e is DioException) {
        var data = e.response?.data as Map<String, dynamic>;
        return left(data['message'] ?? 'Something went wrong');
      } else {
        return left('Something went wrong');
      }
    }
  }

  static Future<Either<String, String>> deleteTask({
    required int taskId,
  }) async
  {
    try {
      var response = await _dio.delete(
        '${EndPoints.updateTask}$taskId',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}',
          },
        ),
      );
      var data = response.data as Map<String, dynamic>;
      return right(data['message'] ?? 'Task updated successfully');
    } catch (e) {
      if (e is DioException) {
        var data = e.response?.data as Map<String, dynamic>;
        return left(data['message'] ?? 'Something went wrong');
      } else {
        return left('Something went wrong');
      }
    }
  }

  //Profile
  static Future<Either<String, UserModel>> getUserData() async
  {
    try {
      var response = await _dio.get(
        EndPoints.getUserData,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}',
          },
        ),
      );
      var userResponse = response.data as Map<String, dynamic>;
      UserModel user = UserModel.fromJson(userResponse['user']);
      return Right(user);
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data;
        if (errorResponse is Map) {
          return Left(errorResponse['message'] ?? 'Unknown error');
        }
        return Left('Server error: ${e.response?.statusCode}');
      }
      return Left('An Error occurred.');
    }
  }

  static Future<Either<String, String>> updateProfile({
    required String userName,
  }) async
  {
    try {
      var response = await _dio.put(
        EndPoints.updateUserName,
        data: FormData.fromMap({'username': userName.trim()}),
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}',
          },
        ),
      );

      var data = response.data as Map<String, dynamic>;
      return right(data['message'] ?? 'Name updated successfully');
    } catch (e) {
      if (e is DioException) {
        var data = e.response?.data as Map<String, dynamic>;
        return left(data['message'] ?? 'Something went wrong');
      } else {
        return left('Something went wrong');
      }
    }
  }

  static Future<Either<String, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String newPasswordConfirm,
  }) async
  {
    try {
      var response = await _dio.post(
        EndPoints.changePassword,
        data: FormData.fromMap({
          'current_password': currentPassword,
          'new_password': newPassword,
          'new_password_confirm': newPasswordConfirm,
        }),
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}',
          },
        ),
      );

      var data = response.data as Map<String, dynamic>;
      return right(data['message'] ?? 'Password updated successfully');
    } catch (e) {
      if (e is DioException) {
        if (e.response?.data is Map<String, dynamic>) {
          var data = e.response?.data as Map<String, dynamic>;
          return left(data['message'] ?? 'Something went wrong');
        }
        return left('Server error: ${e.response?.statusCode}');
      }

      return left('Something went wrong');
    }
  }

  static Future<Either<String, String>> deleteUserProfile() async {
    try {
      var response = await _dio.delete(
        EndPoints.deleteUser,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}',
          },
        ),
      );
      var data = response.data as Map<String, dynamic>;
      return right(data['message'] ?? 'User deleted successfully');
    } catch (e) {
      if (e is DioException) {
        var data = e.response?.data as Map<String, dynamic>;
        return left(data['message'] ?? 'Something went wrong');
      } else {
        return left('Something went wrong');
      }
    }
  }



}
