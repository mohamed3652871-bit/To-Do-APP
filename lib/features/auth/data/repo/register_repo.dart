import 'package:dio/dio.dart';
import 'package:to_do_app/core/network/api_helper.dart';
import 'package:to_do_app/core/network/api_response.dart';

import '../../../../core/network/end_points.dart';

class RegisterRepo {




  static Future<ApiResponse> register({
    required String email,
    required String password,
    required String passwordConfirm,
    String? imagePath,
  }) async {
    return await APIHelper.postRequest(
      endPoint: EndPoints.register,
      data: {
        EndPoints.emailKey: email,
        EndPoints.passWordKey: password,
        EndPoints.confPassWordKey: passwordConfirm,

        if (imagePath != null)
          EndPoints.imageKey: await MultipartFile.fromFile(imagePath),
      },

      isFormData: true,
    );
  }
}
