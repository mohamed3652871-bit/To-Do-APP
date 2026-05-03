import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/cache/cache_helper.dart';
import 'core/network/api_helper.dart';
import 'core/translation/translation_helper.dart';
import 'core/utils/shared_packages.dart';
import 'features/splash/views/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  APIHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) {
        return  GetMaterialApp(
          translations: TranslationHelper(),

           locale: Locale('ar'),
          theme: ThemeData(
            fontFamily: 'Lexend Deca',
            scaffoldBackgroundColor: AppColors.appPrimaryColor
          ),
          debugShowCheckedModeBanner: false,
            home: SplashScreen(),
        );
      },
    );
  }
}