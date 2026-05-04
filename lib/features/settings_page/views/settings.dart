import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:to_do_app/core/translation/translation_keys.dart';
import '../../../core/utils/shared_packages.dart';
import '../../splash/views/splash.dart';

Color enColor = Colors.white;
Color? tempColor;
Color arColor = Colors.black;
Color enButtonColor = Color(0xff149954);
Color arButtonColor = Color(0xffD9D9D9);

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  void changeLanguage() {
    if (Get.locale?.languageCode == 'en') {
      Get.updateLocale(const Locale('ar'));
    } else {
      Get.updateLocale(const Locale('en'));
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreen(),));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPrimaryColor,
        centerTitle: true,
        title: Text(TranslationKeys.settings.tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            ListTile(

              leading: Text(
                TranslationKeys.appLanguage.tr,
                style: TextStyle(fontSize: 30.sp),
              ),
              trailing: IconButton(onPressed: () { changeLanguage();}, icon: Icon(Icons.language,size: 30.r,),),
            ),
          ],
        ),
      ),
    );
  }
}
