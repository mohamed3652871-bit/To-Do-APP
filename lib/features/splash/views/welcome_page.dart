import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:to_do_app/core/translation/translation_keys.dart';
import 'package:to_do_app/features/splash/views/splash.dart';

import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/custom_buttons_box.dart';
import '../../auth/views/login.dart';

class LetsStart extends StatelessWidget {
  const LetsStart({super.key});


  @override
  Widget build(BuildContext context) {
    void changeLanguage() {
      if (Get.locale?.languageCode == 'en') {
        Get.updateLocale(const Locale('ar'));
      } else {
        Get.updateLocale(const Locale('en'));
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreen(),));
      }
    }
    return Scaffold(
      floatingActionButton: IconButton(onPressed: (){
        changeLanguage();
      }, icon: SizedBox(
        width: 80.w,
        child: Row(
          children: [
            Text(TranslationKeys.appLanguage.tr),
            SizedBox(width: 10.w,),
            Icon(Icons.language),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Container(
        width: double.infinity,
        color: AppColors.appPrimaryColor,
        padding: EdgeInsets.only(
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

              child: Text(
                TranslationKeys.welcome.tr,
                softWrap: true,
                textAlign: TextAlign.center,

                style: TextStyle(
                  color: AppColors.appTextColor1,
                  fontSize: 24.sp,
                  fontWeight: FontWeight(400),
                  fontFamily: 'Lexend Deca',
                  letterSpacing: 0,
                  height: 0,
                ),
              ),
            ), //welcome box
            Spacer(),
            SizedBox(
              width: 314.w,
              height: 40.h,
              child: Text(
               TranslationKeys.welcomeText.tr,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.appTextColor2,
                  fontSize: 16.sp,
                  fontWeight: FontWeight(500),
                  fontFamily: 'Lexend Deca',
                  letterSpacing: 0,
                  height: 1,
                ),
              ),
            ),
            SizedBox(height: 56.h),
            ElvButton(
              buttonHeight: 48.01129913330078,
              buttonWidth: 331,
              text: TranslationKeys.letsStart.tr,
              blurRadius: 10,
              offsetX: 0,
              offsetY: 5,
              fontSize: 19,
              buttonColor: AppColors.appGreen1,
              shadowColor: AppColors.appGreen1,
              borderRadius: 14,
              onPressedFn: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },

              spreedR: 0,
              fontWeight: FontWeight.w300,
            ),//Let's start button
          ],
        ),
      ),
    );
  }
}
