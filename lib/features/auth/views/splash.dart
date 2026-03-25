import 'package:to_do_app/core/utils/shared_packages.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/network/tasks_count_helper.dart';
import '../../home/views/home_page.dart';
import 'lets_start.dart'; //

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    String? token = await CacheHelper.getValue(CacheKeys.accessToken);

    if (token == null) {
      navigateTo(const LetsStart());
      return;
    }

    // ✅ فيه توكن → افحص التاسكات
    bool hasTasks = await AppFlowService.hasTasks();

    if (!mounted) return;

    if (hasTasks) {
      navigateTo(const HomePage());
    } else {
      navigateTo(const HomePage());
    }
  }

  void navigateTo(Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.appPrimaryColor,
        alignment: Alignment.center,
        child: SizedBox(
          width: 334.w,
          height: 433.h,
          child: Column(
            children: [
              SizedBox(
                width: 334.w,
                height: 344.h,
                child: SvgPicture.asset(
                  AppAssets.splashLogo,
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              Text(
                'TODO',
                style: TextStyle(
                  color: AppColors.appGreen1,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Lexend Deca',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}