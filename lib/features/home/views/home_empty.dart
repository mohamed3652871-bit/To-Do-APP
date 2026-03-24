import 'package:to_do_app/features/home/views/home_with_tasks.dart';
import 'package:to_do_app/core/widgets/custom_buttons_box.dart';

import '../../../core/utils/shared_packages.dart';

class HomeEmpty extends StatelessWidget {
  const HomeEmpty({super.key});

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
              margin: EdgeInsets.only(top: 20.h, left: 20.w),
              height: 60.h,
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
                          r'Hello!',
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
            ), //appbar
            SizedBox(height: 143.h),
            SizedBox(
              width: 375.w,
              height: 367.h,
              child: Column(
                children: [
                  SizedBox(
                    width: 182.w,
                    height: 60.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "There are no tasks yet, Press the button \nTo add New Task",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              fontWeight: FontWeight(300),
                              fontSize: 16.sp,
                              fontFamily: 'Lexend Deca',
                              letterSpacing: 0,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 39.h),
                  Container(
                    width: double.infinity,
                    height: 268.h,
                    padding: EdgeInsets.only(
                      left: 37.73.w,
                      top: 24.08.h,
                      right: 32.5.w,
                      bottom: 19.16.h,
                    ),
                    child: Image.asset(
                      'assets/images/home_image.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ), //image and text
            SizedBox(height: 147.h),
            Row(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 25.w),
                  child: Stack(

                    alignment: Alignment.center,
                    children: [
                      ElvButton(
                        onPressedFn: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
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
                ),
              ],
            ), //add task button
          ],
        ),
      ),
    );
  }
}
