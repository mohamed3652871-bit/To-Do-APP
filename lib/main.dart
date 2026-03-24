
import 'core/utils/shared_packages.dart';
import 'features/login&register/views/splash.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          home: SplashScreen(),
        );
      },
    );
  }
}
