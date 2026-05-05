import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/cubit/register_state.dart';
import 'package:image_picker/image_picker.dart';

import '../data/repo/register_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);



  String? selectedImagePath;

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (pickedFile != null) {
      selectedImagePath = pickedFile.path;
      emit(RegisterImagePicked());
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String passwordConfirm,
    String? imagePath,
  }) async {
    var response = await RegisterRepo.register(
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
      imagePath: imagePath,
    );

    if (response.status) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterError(response.message));
    }
  }
}
