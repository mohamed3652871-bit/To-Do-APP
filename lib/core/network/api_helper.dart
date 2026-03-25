import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../features/auth/data/login_response_model.dart';
import '../../features/auth/data/user_model.dart';
import '../../features/home/data/task_model.dart';
import '../cache/cache_helper.dart';
import '../cache/cache_keys.dart';
abstract class APIHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://ntitodo-production-779a.up.railway.app/api/',
      headers: {
        'Accept': 'application/json',
      },
    ),
  );

  static void init() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // تأكد إنك بتجيب التوكن وتستناه لو محتاج
        final token = CacheHelper.getValue(CacheKeys.accessToken);

        if (token != null && token.toString().isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
          print("Token Sent: Bearer $token"); // عشان تتأكد إنه مش null
        } else {
          print("Warning: Token is missing or empty!");
        }
        return handler.next(options);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401) {
          String? refreshToken = CacheHelper.getValue(CacheKeys.refreshToken);
          if (refreshToken != null && refreshToken.isNotEmpty) {
            try {
              var response = await Dio().post(
                'https://ntitodo-production-779a.up.railway.app/api/refresh_token',
                data: {'refresh_token': refreshToken},
              );

              if (response.statusCode == 200) {
                String newToken = response.data['access_token'] ?? response.data['token'];
                await CacheHelper.setValue(CacheKeys.accessToken, newToken);

                e.requestOptions.headers['Authorization'] = 'Bearer $newToken';
                final opts = Options(method: e.requestOptions.method, headers: e.requestOptions.headers);
                final retryResponse = await _dio.request(
                  e.requestOptions.path,
                  options: opts,
                  data: e.requestOptions.data,
                  queryParameters: e.requestOptions.queryParameters,
                );
                return handler.resolve(retryResponse);
              }
            } catch (err) {
              print("Refresh failed: $err");
              await CacheHelper.clearData();
            }
          }
        }
        return handler.next(e);
      },
    ));
  }
  static Future<Either<String, UserModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      var loginResponse = await _dio.post(
        'login',
        data: FormData.fromMap({'username': username, 'password': password}),
      );

      var loginResponseModel = LoginResponseModel.fromJson(
        loginResponse.data as Map<String, dynamic>,
      );

      final user = loginResponseModel.userModel;
      if (user == null) {
        return Left("User data is missing from server response");
      }

      await CacheHelper.setValue(CacheKeys.accessToken, loginResponseModel.accessToken ?? "");
      await CacheHelper.setValue(CacheKeys.username, user.username ?? "User");
      await CacheHelper.setValue('name', user.username ?? "User");
      await CacheHelper.setValue(CacheKeys.refreshToken, loginResponseModel.refreshToken ?? "");
      await CacheHelper.setValue(CacheKeys.imagePath, user.imagePath ?? "");
      await CacheHelper.setValue(CacheKeys.userId, user.id ?? 0);

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
  }) async {
    try {
      var response = await _dio.post(
        'register',
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

  static Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      var response = await _dio.get('my_tasks');
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
}