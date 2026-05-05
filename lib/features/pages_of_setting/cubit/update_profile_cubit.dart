import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/features/pages_of_setting/cubit/update_profile_state.dart';



import '../../../core/cache/cache_helper.dart';
import '../../../core/network/get_user_data.dart';
import '../../../core/utils/shared_packages.dart';
import '../data/repo/update_profile_repo.dart';

class ProfileUpdateCubit extends Cubit<ProfileUpdateState> {
  ProfileUpdateCubit() : super(ProfileUpdateInitial());

  static ProfileUpdateCubit get(BuildContext context) => BlocProvider.of(context);

  String? selectedImagePath;

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      emit(ProfileImagePicked());
    }
  }

  Future<void> updateUsername(String username) async {
    emit(ProfileUpdateLoading());

    final result = await UpdateProfileRepo.updateProfile(userName: username, imagePath: selectedImagePath);

    result.fold(
      (error) {
        emit(ProfileUpdateError(error));
      },
      (success) async {
        GetUserData.updateUserData();
        emit(ProfileUpdateSuccess(success));
      },
    );
  }


   Future<void> deleteUser() async {
    emit(ProfileDeleteLoading());

    final result = await UpdateProfileRepo.deleteAccount();
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
//TODO make picture update with change in all app