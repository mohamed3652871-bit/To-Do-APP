import 'package:shared_preferences/shared_preferences.dart';
abstract class CacheKeys {
  static final String accessToken = 'access_token';
  static final String refreshToken = 'refresh_token';
  static final String username = 'username';
  static final String imagePath = 'image_path';

}

abstract class CacheHelper {
  static late SharedPreferences prefs;
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setValue(String key, dynamic value) async
  {
    if(value is bool){
      prefs.setBool(key, value);
    }
    else if(value is String){
      prefs.setString(key, value);
    }
    else if(value is int){
      prefs.setInt(key, value);
    }
    else if(value is double){
      prefs.setDouble(key, value);
    }
    else if(value is List<String>){
      prefs.setStringList(key, value);
    }
  }

  static getValue(String key){
    return prefs.get(key);
  }

  static Future removeValue(String key)async{
    prefs.remove(key);
  }
  static Future<bool> clearData() async {
    return await prefs.clear();
  }
}