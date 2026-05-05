

import '../../features/edit_tasks/view/edit_task_page.dart';
import '../../features/home/data/model/task_model.dart';
import '../utils/shared_packages.dart';

class TaskBox extends StatelessWidget {
  final TaskModel task;
  final VoidCallback onUpdated;

  const TaskBox({
    super.key,
    required this.task,
    required this.onUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditTaskPage(task: task),
          ),
        );

        if (result == true) {
          onUpdated();
        }
      },
      child: Container(
        width: 335.w,
        constraints: BoxConstraints(minHeight: 90.h),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.only(
          left: 12.w,
          right: 13.w,
          top: 13.h,
          bottom: 13.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.taskBoxColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.appBlack.withAlpha(75),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// LEFT TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title ?? "No title",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.appTextColor2,
                      fontFamily: 'Lexend Deca',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    task.description ?? "No description",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.appBlack,
                      fontFamily: 'Lexend Deca',
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 64.w),

            /// TIME
            Container(
              constraints: BoxConstraints(
                maxWidth: 66.w,
                minHeight: 30.h,
                maxHeight: 50.h,
              ),
              alignment: Alignment.center,
              child: Text(
                task.createdAt ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.appTextColor2,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Lexend Deca",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}