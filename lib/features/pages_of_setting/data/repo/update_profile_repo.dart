import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/network/api_response.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/end_points.dart';

class UpdateProfileRepo {
  static Future<Either<String, String>> deleteAccount() async {
    ApiResponse result = await APIHelper.deleteRequest(
      endPoint: EndPoints.deleteUser,
      data: null,
      isAuthorized: true,
    );
    if (result.status) {
      return Right(result.message);
    } else {
      return Left(result.message);
    }
  }

  static Future<Either<String, String>> updateProfile({
    String? imagePath,
    required String userName,
  }) async {
    ApiResponse result = await APIHelper.putRequest(
      endPoint: EndPoints.updateUserName,
        isAuthorized: true,
        isFormData: true,
        data: {
          EndPoints.emailKey: userName,

          if (imagePath != null)
            EndPoints.imageKey: await MultipartFile.fromFile(imagePath),
        },
    );
    if (result.status) {
      return Right(result.message);
    } else {
      return Left(result.message);
    }
  }
}
