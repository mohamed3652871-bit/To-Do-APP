import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/network/api_helper.dart';

import '../../../../core/network/end_points.dart';
import '../model/task_model.dart';

class HomeRepo {


  static Future<Either<String, List<TaskModel>>> getTasks() async {
    var response = await APIHelper.getRequest(
      endPoint: EndPoints.getTasks,
      isAuthorized: true,);
    if (response.status) {
     var tasks=response.data['tasks'];
     List<TaskModel> tasksList=[];

     tasks.forEach((task) {
       tasksList.add(TaskModel.fromJson(task));
     });
      return Right( tasksList);
    }else{
      return Left(response.message);
    }

  }
}