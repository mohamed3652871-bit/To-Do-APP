import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/settings_page/cubit/update_profile_state.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/network/api_helper.dart';
import '../../../core/cache/cache_helper.dart';

class ProfileUpdateCubit extends Cubit<ProfileUpdateState> {
  ProfileUpdateCubit() : super(ProfileUpdateInitial());

  Future<void> updateUsername(String username) async {
    emit(ProfileUpdateLoading());

    final result = await APIHelper.updateProfile(
      userName: username,
    );

    result.fold(
          (error) {
        emit(ProfileUpdateError(error));
      },
          (success) async {
        await CacheHelper.setValue(CacheKeys.username, username);
        emit(ProfileUpdateSuccess(success));
      },
    );
  }

  Future<void> deleteUser() async {
    emit(ProfileDeleteLoading());

    final result = await APIHelper.deleteUserProfile();

    result.fold(
          (error) {
        emit(ProfileDeleteError(error));
      },
          (success) async {
        await CacheHelper.clearData();
        emit(ProfileDeleteSuccess(success));
      },
    );
  }
}