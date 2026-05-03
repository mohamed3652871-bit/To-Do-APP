import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_helper.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import 'login_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async
  {
    emit(AuthLoading());

    final result = await APIHelper.login(
      username: username,
      password: password,
    );

    result.fold(
          (error) {
        emit(AuthError(error));
      },
          (userModel) async {
        await CacheHelper.setValue(CacheKeys.username, userModel.username);

        if (userModel.userImagePath != null) {
          await CacheHelper.setValue(CacheKeys.userImage, userModel.userImagePath);
        }

        emit(AuthSuccess(userModel));
      },
    );
  }
}