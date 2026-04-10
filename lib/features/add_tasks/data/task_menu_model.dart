import '../../../core/utils/app_icons.dart';
import '../../../core/utils/shared_packages.dart';

 class TaskChoiceModel extends StatelessWidget {
  const TaskChoiceModel({super.key, required this.taskName, required this.taskIcon});
  final String taskName;
  final String taskIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        AppIcon(icon: taskIcon,size: 28.r,),
        SizedBox(width: 15.w),
        Text(taskName,style: TextStyle(fontSize: 14.sp,fontFamily: 'Lexend Deca',fontWeight: FontWeight.w300,color: AppColors.appTextColor1,),)


      ]
      ),
    );
  }
}
