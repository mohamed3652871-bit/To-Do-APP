import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/api_helper.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(ChangePasswordLoading());

    final result = await APIHelper.changePassword(
      currentPassword: oldPassword,
      newPassword: newPassword,
      newPasswordConfirm: confirmPassword,
    );

    result.fold(
          (error) => emit(ChangePasswordError(message: error)),
          (success) => emit(ChangePasswordSuccess(message: success)),
    );
  }
}