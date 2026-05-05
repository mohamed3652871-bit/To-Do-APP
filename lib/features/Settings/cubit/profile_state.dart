abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String username;
  final String? imagePath;

  ProfileLoaded({
    required this.username,
    this.imagePath,
  });
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}