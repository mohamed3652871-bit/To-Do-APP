
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/custom_buttons_box.dart';
import 'login.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: appMainColor,
        margin: EdgeInsets.only(
          top: 90.h,
          bottom: 75.h,
          left: 22.w,
          right: 22.w,
        ),
        child: Column(
          children: [
            SizedBox(
              width: 301.7.w,
              height: 342.8.h,
              child: SvgPicture.asset(
                AppAssets.letsStartLogo,
                fit: BoxFit.contain,
              ),
            ), //image box
            SizedBox(height: 60.14.h),
            SizedBox(
              width: 147.w,
              height: 60.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To',
                    style: TextStyle(
                      color: AppColors.appTextColor1,
                      fontSize: 24.sp,
                      fontWeight: FontWeight(400),
                      fontFamily: 'Lexend Deca',
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                  Text(
                    'Do It !',
                    style: TextStyle(
                      color: AppColors.appTextColor1,
                      fontSize: 24.sp,
                      fontWeight: FontWeight(400),
                      fontFamily: 'Lexend Deca',
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ), //welcome box
            SizedBox(height: 40.h),
            SizedBox(
              width: 314.w,
              height: 40.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ready to conquer your tasks? Let\'s',
                    style: TextStyle(
                      color: AppColors.appTextColor2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight(500),
                      fontFamily: 'Lexend Deca',
                      letterSpacing: 0,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Do It together.',
                    style: TextStyle(
                      color: AppColors.appTextColor2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight(500),
                      fontFamily: 'Lexend Deca',
                      letterSpacing: 0,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ), //Let's do it
            SizedBox(height: 56.h),
            ElvButton(
              buttonHeight: 48.01129913330078,
              buttonWidth: 331,
              text: r"Let’s Start",
              blurRadius: 10,
              offsetX: 0,
              offsetY: 5,
              fontSize: 16,
              buttonColor: AppColors.appGreen1,
              shadowColor: AppColors.appGreen1,
              borderRadius: 14,
              onPressedFn: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              font: 'Lexend Deca',
              spreedR: 0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

