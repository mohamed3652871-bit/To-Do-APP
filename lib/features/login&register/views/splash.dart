

import '/core/utils/shared_packages.dart';
import 'lets_start.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LetsStart()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container (
        alignment: Alignment.center,
        color: AppColors.appPrimaryColor,
        child: SizedBox(
          width: 334.w,
          height: 433.h,
          child: Column(
            children: [
              SizedBox(
                width: 334.w,
                height: 344.h,
              child: SvgPicture.asset(AppAssets.splashLogo,fit: BoxFit.contain,),),
             Spacer(),
              Container(
                alignment: Alignment.center,
                width: 114.w,
                height: 45.h,
                child: Text('TODO',style: TextStyle(color: AppColors.appGreen1,fontSize: 36.sp ,fontWeight: FontWeight.w900,fontFamily:'Lexend Deca' ,height: 1.0,letterSpacing: 0),),
              )

            ],
          ),

        ),

      ),
    );
  }
}
