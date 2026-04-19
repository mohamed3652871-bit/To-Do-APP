import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/cubit/splash_state.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/network/tasks_count_helper.dart';


class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkAppState() async {
    await Future.delayed(const Duration(seconds: 1));

    String? token = await CacheHelper.getValue(CacheKeys.accessToken);

    if (token == null) {
      emit(SplashGoToWelcome());
      return;
    }

    bool hasTasks = await AppFlowService.hasTasks();

    if (hasTasks) {
      emit(SplashGoToHome());
    } else {
      emit(SplashGoToHome()); // ممكن تغيرها بعدين لو في flow مختلف
    }
  }
}