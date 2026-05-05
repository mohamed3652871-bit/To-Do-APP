import 'package:bloc/bloc.dart';
import 'package:to_do_app/features/home/data/repo/home_repo.dart';
import '../data/model/task_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<TaskModel> tasks = [];


  Future<void> getTasks() async {
    emit(HomeLoading());


    final result= await HomeRepo.getTasks();
    result.fold(
      (l) => emit(HomeError(l)),
      (right) {

        emit(HomeSuccess());
        tasks=right;

      },
    );

  }

  void refresh() {
    getTasks();
  }
}