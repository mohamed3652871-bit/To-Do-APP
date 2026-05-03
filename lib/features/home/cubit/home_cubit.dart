import 'package:bloc/bloc.dart';

import '../../../core/network/api_helper.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  Future<void> getTasks() async {
    emit(HomeLoading());

    final result = await APIHelper.getTasks();

    result.fold(
          (error) => emit(HomeError(error)),
          (tasks) => emit(HomeSuccess(tasks)),
    );
  }

  void refresh() {
    getTasks();
  }
}