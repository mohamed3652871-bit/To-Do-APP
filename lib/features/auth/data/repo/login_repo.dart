import 'package:to_do_app/core/network/api_helper.dart';
import 'package:to_do_app/core/network/end_points.dart';

import '../../../../core/network/api_response.dart';

class LoginRepo {


static Future<ApiResponse> login(String email, String password) async {
  return await APIHelper.postRequest(
    endPoint: EndPoints.login,
    data: {EndPoints.emailKey: email, EndPoints.passWordKey: password},
    isAuthorized: false,
    isFormData: true
  );

}
}