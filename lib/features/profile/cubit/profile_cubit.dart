import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadProfile() {
    emit(ProfileLoading());

    try {
      final username = CacheHelper.getValue(CacheKeys.username) ?? "Guest";

      final image = CacheHelper.getValue(CacheKeys.userImage);

      emit(ProfileLoaded(username: username, imagePath: image));
    } catch (e) {
      emit(ProfileError("Failed to load profile"));
    }
  }

  void logout() async {
    await CacheHelper.clearData().then((value) {
      emit(ProfileInitial());
    });
  }
}
