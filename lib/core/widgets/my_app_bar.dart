
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:to_do_app/core/translation/translation_keys.dart';

import '../../features/add_tasks/view/add_task.dart';
import '../../features/profile/views/profile.dart';
import '../cache/cache_keys.dart';
import '../utils/shared_packages.dart';
import '../cache/cache_helper.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    super.key,
    required this.username,
    required this.tasks,
    required this.onTaskAdded,
    this.imagePath,
    this.onTapFun,
  });
  final String username;
  final bool tasks;
  final VoidCallback onTaskAdded;
  final String? imagePath;
  final Function? onTapFun ;
  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  bool get tasks => widget.tasks;

  @override
  Widget build(BuildContext context) {
    String username = CacheHelper.getValue(CacheKeys.username) ?? 'Guest';

    return InkWell(
      onTap:widget.onTapFun==null? () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }:(){
        widget.onTapFun;
      },
      child: Container(
        padding: EdgeInsets.only(right:10.w,),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          color: AppColors.appPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.appGreen1,
              spreadRadius: 0,
              blurRadius: 3,
              blurStyle: BlurStyle.outer,

              offset: Offset(0, 4),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 57.h,
              width: 57.w,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(2.r),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.appBlack,
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  )
                ],
                color: AppColors.appBlack,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child:CircleAvatar(
                backgroundImage: (widget.imagePath != null &&
                    widget.imagePath!.startsWith('http'))
                    ? NetworkImage(widget.imagePath!)
                    : AssetImage(AppAssets.placeHolder)
              ),
            ),//avatar
            Expanded(
              child: Text(
                "${TranslationKeys.hello.tr}\n$username",
                maxLines: 2,

                overflow: TextOverflow.clip,
                style: TextStyle(
                  letterSpacing: 0,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),//hello and name
            if (widget.tasks)
              SizedBox(
                width: 50.w,
                height: 50.h,
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
                  icon: Icon(Icons.add_circle_outline, size: 24.r,color: AppColors.appGreen1),
                ),
              ),//add task
          ],
        ),
      ),
    );
  }
}
