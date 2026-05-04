import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../data/models/login_response_model.dart';
import '../data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit(this.repo) : super(AuthInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  final LoginRepo repo;

  Future<void> loginFun({
    required String username,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await repo.login(username, password);

    if (result.status) {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        result.data,
      );
      await CacheHelper.setValue(
        CacheKeys.accessToken,
        loginResponseModel.accessToken,
      );
      await CacheHelper.setValue(
        CacheKeys.refreshToken,
        loginResponseModel.refreshToken,
      );
      emit(AuthSuccess(loginResponseModel.userModel));
    } else {
      emit(AuthError(result.message));
    }
  }
}
