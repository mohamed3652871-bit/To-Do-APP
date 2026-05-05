abstract class ProfileUpdateState {}

class ProfileUpdateInitial extends ProfileUpdateState {}

class ProfileUpdateLoading extends ProfileUpdateState {}

class ProfileUpdateSuccess extends ProfileUpdateState {
  final String message;
  ProfileUpdateSuccess(this.message);
}

class ProfileUpdateError extends ProfileUpdateState {
  final String message;
  ProfileUpdateError(this.message);
}

class ProfileDeleteLoading extends ProfileUpdateState {}
class ProfileImagePicked extends ProfileUpdateState {}

class ProfileDeleteSuccess extends ProfileUpdateState {
  final String message;
  ProfileDeleteSuccess(this.message);
}

class ProfileDeleteError extends ProfileUpdateState {
  final String message;
  ProfileDeleteError(this.message);
}