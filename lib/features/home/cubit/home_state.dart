import '../data/task_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<TaskModel> tasks;

  HomeSuccess(this.tasks);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}