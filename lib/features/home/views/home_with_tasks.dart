import '/features/add_edit_tasks/add_task.dart';
import '/features/add_edit_tasks/edit_task_page.dart';
import '../../../core/utils/shared_packages.dart';

int tasks = 3;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 44.h,
                left: 20.w,
                right: 20.w,
              ),
              color: appMainColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60.h,
                        constraints: BoxConstraints(minWidth: 196.w),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 60.h,
                              width: 60.w,
                              child: CircleAvatar(
                                backgroundColor: Colors.blue,
                                backgroundImage: Image.asset(image1).image,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 11.h),
                                SizedBox(
                                  width: 32.w,
                                  height: 15.h,
                                  child: Text(
                                    r'Hello!',
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Container(
                                  height: 20.h,
                                  constraints: BoxConstraints(maxWidth: 200.w),
                                  child: Text(
                                    userName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ), //avatar and name
                      Spacer(),
                      SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTask(),
                              ),
                            );
                          },
                          icon: Icon(Icons.add_circle_outline, size: 24),
                        ),
                      ), //add task button
                    ],
                  ), //header
                  SizedBox(height: 54.h),
                  Container(
                    padding: EdgeInsets.only(right: 21.w),
                    width: 101.w,
                    height: 18.h,
                    child: Row(
                      children: [
                        Text('Tasks'),
                        Spacer(),
                        Container(
                          constraints: BoxConstraints(minWidth: 14.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffCEEBDC),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            "$tasks",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //tasks container
                  //Tasks place
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: appMainColor,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    TaskBox(
                      taskTitle: 'My First Task',
                      taskDescription:
                          'Improve my English skills by trying to speak',
                      creationDate: '10/3/2026',
                      creationTime: '02:30 PM',
                    ),
                    TaskBox(
                      taskTitle: 'My First Task',
                      taskDescription:
                          'Improve my English skills by trying to speak',
                      creationDate: '10/3/2026',
                      creationTime: '02:30 PM',
                    ),
                    TaskBox(
                      taskTitle: 'My First Task',
                      taskDescription:
                          'Improve my English skills by trying to speak',
                      creationDate: '10/3/2026',
                      creationTime: '02:30 PM',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskBox extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final String creationDate;
  final String creationTime;

  const TaskBox({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
    required this.creationDate,
    required this.creationTime,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditTaskPage()));
      },
      child: Container(
        width: 335.w,
        constraints: BoxConstraints(minHeight: 90.h),
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        padding: EdgeInsets.only(
          left: 12.w,
          right: 13.w,
          top: 13.h,
          bottom: 13.h,
        ),
        decoration: BoxDecoration(
          color: Color(0xffCEEBDC),
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(75),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff6E6A7C),
                      fontFamily: 'Lexend Deca',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  Text(
                    taskDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lexend Deca',
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp,
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 64.w),
            Container(
              height: 30.h,
              constraints: BoxConstraints(minWidth: 66.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    creationDate,
                    style: TextStyle(
                      color: Color(0xff6E6A7C),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lexend Deca",
                      height: 1,
                    ),
                  ),
                  Text(
                    creationTime,
                    style: TextStyle(
                      color: Color(0xff6E6A7C),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Lexend Deca",
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditTask {
}
