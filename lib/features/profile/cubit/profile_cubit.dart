import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/utils/shared_packages.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadProfile() {
    emit(ProfileLoading());

    try {
      final username =
          CacheHelper.getValue(CacheKeys.username) ?? "Guest";

      final image =
      CacheHelper.getValue(CacheKeys.imagePath);

      emit(ProfileLoaded(
        username: username,
        imagePath: image,
      ));
    } catch (e) {
      emit(ProfileError("Failed to load profile"));
    }
  }

  void logout() {
    CacheHelper.removeValue(CacheKeys.accessToken);
    CacheHelper.removeValue(CacheKeys.refreshToken);

    emit(ProfileInitial());
  }
}