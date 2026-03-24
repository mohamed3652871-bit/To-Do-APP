import 'package:to_do_app/core/widgets/custom_buttons_box.dart';

import '/core/widgets/project_icons.dart';
import '/core/utils/shared_packages.dart';

int personalTasks = 5;
int homeTasks = 3;
int workTasks = 1;
int? inProgress = 4;
int tasks = personalTasks + homeTasks + workTasks;
int taskProgress = (((inProgress ?? 0) / tasks) * 100).toInt();

String userName = "Mohamed Ahmed Mohamed";

class HomeWithScroll extends StatelessWidget {
  const HomeWithScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: appMainColor,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              child: Column(
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
                                backgroundImage: Image.asset(
                                  'assets/images/palestine_flag.PNG',
                                ).image,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 11.h),
                                SizedBox(
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
                            print('add task');
                          },
                          icon: Icon(Icons.add_circle_outline, size: 24),
                        ),
                      ), //add task button
                    ],
                  ), //header&appbar
                  SizedBox(height: 34.h),
                  Container(
                    width: 335.w,
                    height: 135.h,
                    padding: EdgeInsets.symmetric(
                      vertical: 18.h,
                      horizontal: 22.w,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff149954),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 140.w,
                              height: 36.h,
                              child: Text(
                                'Your today’s tasks almost done!',
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              height: 47.h,
                              child: Text(
                                '$taskProgress%',
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 121.w,
                              height: 36.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              child: Text(
                                'View Tasks',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ), //Tasks progress
                  SizedBox(height: 26.h),
                  Container(
                    padding: EdgeInsets.only(right: 21.w),
                    height: 18.h,
                    child: Row(
                      children: [
                        Text(
                          'In Progress',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: 'Lexend Deca',
                          ),
                        ),
                        SizedBox(width: 22.w),
                        Container(
                          constraints: BoxConstraints(minWidth: 22.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffCEEBDC),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            "$inProgress",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //main header
            SizedBox(height: 23.h),
            Container(
              height: 90.h,
              color: appMainColor,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TaskItem(
                    taskTitle: 'Work Task',
                    taskDescription: 'Add New Features',
                    taskColor: Colors.black,
                    titleColor: Colors.white,
                    descriptionColor: Colors.white,
                    taskIconWidget: WorkIcon(
                      iconBGColor: Colors.white,
                      iconColor: Colors.black,
                    ),
                  ),
                  TaskItem(
                    taskTitle: 'Personal Task',
                    taskDescription:
                        'Improve my English skills by trying to speak',
                    taskColor: Color(0xffCEEBDC),
                    titleColor: Color(0xff6E6A7C),
                    descriptionColor: Colors.black,
                    taskIconWidget: PersonalIcon(),
                  ),
                  TaskItem(
                    taskTitle: 'Home Task',
                    taskDescription:
                        'Add new feature for Do It app and commit it',
                    taskColor: Color(0xffFFE4F2),
                    titleColor: Color(0xff6E6A7C),
                    descriptionColor: Colors.black,
                    taskIconWidget: HomeIcon(),
                  ),
                ],
              ),
            ), //tasks list
            SizedBox(height: 26.h),
            Container(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                "Task Group",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'Lexend Deca',
                ),
              ),
            ),
            SizedBox(height: 23.h),
            Container(
              padding: EdgeInsets.only(bottom: 26.h, left: 20.w, right: 20.w),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElvButton(
                    onPressedFn: () {
                      print('home tasks');
                    },
                    buttonHeight: 63,
                    buttonWidth: 335,
                    buttonColor: Colors.white,
                    shadowColor: Colors.transparent,
                    borderRadius: 15,
                    buttonChild: Container(
                      padding: EdgeInsets.only(left: 16.w, right: 14.w),
                      child: Row(
                        children: [
                          Container(
                            width: 35.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Color(0xffCEEBDC),
                            ),
                            child: Icon(
                              Icons.person,
                              size: 20.r,
                              color: Color(0xff149954),
                            ),
                          ), //start icon
                          Container(
                            padding: EdgeInsets.only(left: 12.w),
                            alignment: Alignment.centerLeft,
                            height: 18.h,
                            child: Text(
                              'Personal Task',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                letterSpacing: 0,
                                height: 1,
                              ),
                            ),
                          ), //text
                          Spacer(),
                          Container(
                            height: 23.h,
                            constraints: BoxConstraints(minWidth: 22.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xffCEEBDC),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text(
                              "$personalTasks",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.green,
                              ),
                            ),
                          ), //end icon
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 17.h),
                  ElvButton(
                    onPressedFn: () {
                      print('Personal tasks');
                    },
                    buttonHeight: 63,
                    buttonWidth: 335,
                    buttonColor: Colors.white,
                    shadowColor: Colors.transparent,
                    borderRadius: 15,
                    buttonChild: Container(
                      padding: EdgeInsets.only(left: 16.w, right: 14.w),
                      child: Row(
                        children: [
                          Container(
                            width: 35.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Color(0xffFFE4F2),
                            ),
                            child: Icon(
                              Icons.house,
                              size: 20.r,
                              color: Color(0xffFF1C92),
                            ),
                          ), //start icon
                          Container(
                            padding: EdgeInsets.only(left: 12.w),
                            alignment: Alignment.centerLeft,
                            height: 18.h,
                            child: Text(
                              'Home Task',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                letterSpacing: 0,
                                height: 1,
                              ),
                            ),
                          ), //text
                          Spacer(),
                          Container(
                            height: 23.h,
                            constraints: BoxConstraints(minWidth: 22.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xffFFE4F2),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text(
                              "$homeTasks",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w800,
                                color: Color(0xffFF0084),
                              ),
                            ),
                          ), //end icon
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 17.h),
                  ElvButton(
                    onPressedFn: () {
                      print('work tasks');
                    },
                    buttonHeight: 63,
                    buttonWidth: 335,
                    buttonColor: Colors.white,
                    shadowColor: Colors.transparent,
                    borderRadius: 15,
                    buttonChild: Container(
                      padding: EdgeInsets.only(left: 16.w, right: 14.w),
                      child: Row(
                        children: [
                          Container(
                            width: 35.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.person,
                              size: 18.r,
                              color: Colors.white,
                            ),
                          ), //start icon
                          Container(
                            padding: EdgeInsets.only(left: 12.w),
                            alignment: Alignment.centerLeft,
                            height: 18.h,
                            child: Text(
                              'Work Task',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                letterSpacing: 0,
                                height: 1,
                              ),
                            ),
                          ), //text
                          Spacer(),
                          Container(
                            height: 23.h,
                            constraints: BoxConstraints(minWidth: 22.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Text(
                              "$workTasks",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ), //end icon
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 17.h),
                  Row(
                    children: [
                      Spacer(),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ElvButton(
                            onPressedFn: () {
                              print('add task');
                            },
                            spreedR: 0,
                            fontWeight: FontWeight.w300,
                            fontSize: 19,
                            borderRadius: 50,
                            buttonColor: Color(0xff149954),
                            text: "",
                            shadowColor: Color(0x40000000).withAlpha(75),
                            buttonWidth: 50,
                            buttonHeight: 50,
                            offsetY: 4,
                            blurRadius: 4,
                          ),

                          Icon(
                            Icons.note_add_outlined,
                            color: Colors.white,
                            size: 24,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ), //Group Button
          ],
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final Color taskColor;
  final String taskTitle;
  final Color titleColor;
  final String taskDescription;
  final Color descriptionColor;
  final Widget taskIconWidget;

  const TaskItem({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
    required this.taskColor,
    required this.titleColor,
    required this.descriptionColor,
    required this.taskIconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 234.w,
      height: 90.h,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.only(
        left: 16.w,
        right: 14.w,
        top: 13.h,
        bottom: 13.h,
      ),
      decoration: BoxDecoration(
        color: taskColor,
        borderRadius: BorderRadius.circular(20.r),
      ),

      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 15.h,
                  child: Text(
                    taskTitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: titleColor,
                      fontFamily: 'Lexend Deca',
                    ),
                  ),
                ),
                Spacer(),
                taskIconWidget,
              ],
            ),
            SizedBox(height: 9.h),
            Row(
              children: [
                Container(
                  width: 180.w,
                  constraints: BoxConstraints(maxHeight: 36.w),
                  child: Text(
                    taskDescription,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      letterSpacing: 0,
                      height: 1,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: descriptionColor,
                      fontFamily: 'Lexend Deca',
                    ),
                  ),
                ), //description
              ],
            ),
          ],
        ),
      ),
    );
  }
}
