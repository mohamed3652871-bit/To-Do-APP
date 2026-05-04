import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/cubit/register_state.dart';
import '../../../../core/network/api_helper.dart';
import 'package:image_picker/image_picker.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  String? selectedImagePath;


  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (pickedFile != null) {
      selectedImagePath= pickedFile.path;
      emit(RegisterImagePicked());
    }
  }

  Future<void> register({
    required String username,
    required String password,
     String? imagePath,
  }) async
  {
    emit(RegisterLoading());

    final result = await APIHelper.register(
      username: username,
      password: password,
      imagePath: imagePath,
    );


    result.fold(
          (error) => emit(RegisterError(error)),
          (success) => emit(RegisterSuccess()),
    );
  }
}