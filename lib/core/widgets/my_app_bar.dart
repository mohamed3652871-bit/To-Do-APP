import '../../features/SettingsFiles/views/profile.dart';
import '../../features/add_tasks/view/add_task.dart';
import '../utils/shared_packages.dart';
import '../cache/cache_helper.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key, required this.tasks, required this.onTaskAdded});

  final bool tasks;
  final VoidCallback onTaskAdded;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  bool get tasks => widget.tasks;

  @override
  Widget build(BuildContext context) {
    String username = CacheHelper.getValue(CacheKeys.username) ?? 'Guest';

    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: 20.w),
        height: 60.h,
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
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
                              height: 15.h,
                              child: Text(
                                'Hello!',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            SizedBox(
                              height: 20.h,
                              child: Text(
                                username,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 0,
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (widget.tasks)
                    Expanded(
                      child: Row(
                        children: [
                          Spacer(),
                          SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddTask(
                                      onTaskAdded: widget.onTaskAdded,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.add_circle_outline, size: 24),
                            ),
                          ),
                          InkWell(
                            child: SizedBox(width: 20.w),
                            onTap: () {},
                          ),
                        ],
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
