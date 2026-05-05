import 'package:to_do_app/core/cache/cache_helper.dart';
import 'package:to_do_app/core/network/api_helper.dart';
import 'package:to_do_app/core/network/api_response.dart';

import '../../features/auth/data/models/user_model.dart';
import '../cache/cache_keys.dart';
import 'end_points.dart';

class GetUserData {
  
  
  static Future<void> updateUserData() async {
  ApiResponse result =await APIHelper.getRequest(endPoint: EndPoints.getUserData,isAuthorized: true);
  if(result.status){
    UserModel userModel = UserModel.fromJson( result.data['user']) ;
    
    await CacheHelper.setValue(CacheKeys.userImage, userModel.userImagePath);
    await CacheHelper.setValue(CacheKeys.username, userModel.username);

  }

  
  } 
  
}