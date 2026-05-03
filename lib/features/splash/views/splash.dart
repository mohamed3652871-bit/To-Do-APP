import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:to_do_app/core/translation/translation_keys.dart';
import 'package:to_do_app/core/utils/shared_packages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/splash_cubit.dart';
import '../../home/views/home_page.dart';
import '../../auth/cubit/splash_state.dart';
import 'welcome_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..checkAppState(),
      child: const SplashViewBody(),
    );
  }
}

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashGoToWelcome) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LetsStart()),
          );
        } else if (state is SplashGoToHome) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }
      },
      child: Scaffold(
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
                const Spacer(),
                Text(
                  TranslationKeys.toDo.tr,
                  style: TextStyle(
                    color: AppColors.appGreen1,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}