import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/cubit/splash_state.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/network/tasks_count_helper.dart';
import '../../../core/utils/shared_packages.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(BuildContext context) => BlocProvider.of<SplashCubit>(context);

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
