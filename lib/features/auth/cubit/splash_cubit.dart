import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/network/tasks_count_helper.dart';

part 'splash_state.dart';

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
      emit(SplashGoToHome());
    }
  }
}