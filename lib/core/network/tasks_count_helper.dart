import '../cache/cache_helper.dart';
import '../cache/cache_keys.dart';
import 'api_helper.dart';

class AppFlowService {
  static Future<bool> hasTasks() async {
    try {
      var result = await APIHelper.getTasks();

      return result.fold(
            (error) => false,
            (tasks) => tasks.isNotEmpty,
      );
    } catch (e) {
      return false;
    }
  }

  static Future<bool> hasValidToken() async {
    String? token = await CacheHelper.getValue(CacheKeys.accessToken);
    return token != null;
  }
}