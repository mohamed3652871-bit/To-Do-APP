import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/my_app_bar.dart';
import '../../../core/widgets/custom_buttons_box.dart';
import '../../auth/views/login.dart';
import '../../settings_page/views/change_password.dart';
import '../../settings_page/views/settings.dart';
import '../../settings_page/views/update_profile.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit()..loadProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {

          String username = 'Guest';

          if (state is ProfileLoaded) {
            username = state.username;
          }

          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.appPrimaryColor,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 44.h,
                  left: 20.w,
                  right: 24.w,
                ),
                child: Column(
                  children: [

                    MyAppBar(
                      onTapFun: (){},
                      tasks: false,
                      username: username,
                      imagePath: CacheHelper.getValue(CacheKeys.userImage),
                      onTaskAdded: () {},
                    ),


                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            SizedBox(height: 20.h),

                            ButtonV2(
                              onPressedFn: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => UpdateProfile(),
                                  ),
                                );
                              },
                              text: 'Profile',
                              fontFamily: 'Lexend Deca',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              textColor: Colors.black,
                              buttonColor: Colors.white,
                              buttonWidth: 331.w,
                              buttonHeight: 63.h,
                              borderRadius: 15.r,
                              buttonStartIcon: Icons.person_outline_outlined,
                              startIconSize: 24.r,
                              buttonEndIcon: Icons.arrow_forward_ios,
                              endIconSize: 21.r,
                            ),

                            SizedBox(height: 25),

                            ButtonV2(
                              onPressedFn: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChangePassword(),
                                  ),
                                );
                              },
                              text: 'Change Password',
                              fontFamily: 'Lexend Deca',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              textColor: Colors.black,
                              buttonColor: Colors.white,
                              buttonWidth: 331.w,
                              buttonHeight: 63.h,
                              borderRadius: 15.r,
                              buttonStartIcon: Icons.lock_outline_rounded,
                              startIconSize: 24.r,
                              buttonEndIcon: Icons.arrow_forward_ios,
                              endIconSize: 21.r,
                            ),

                            SizedBox(height: 25),

                            ButtonV2(
                              onPressedFn: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Settings(),
                                  ),
                                );
                              },
                              text: 'Settings',
                              fontFamily: 'Lexend Deca',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              textColor: Colors.black,
                              buttonColor: Colors.white,
                              buttonWidth: 331.w,
                              buttonHeight: 63.h,
                              borderRadius: 15.r,
                              buttonStartIcon: Icons.settings_outlined,
                              startIconSize: 24.r,
                              buttonEndIcon: Icons.arrow_forward_ios,
                              endIconSize: 21.r,
                            ),

                            SizedBox(height: 25),

                            ButtonV2(
                              onPressedFn: () {
                                CacheHelper.removeValue(CacheKeys.accessToken);
                                CacheHelper.removeValue(CacheKeys.refreshToken);

                                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (_) => LoginPage()),
                                      (route) => false,
                                );
                              },
                              text: 'Logout',
                              fontFamily: 'Lexend Deca',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              textColor: Colors.white,
                              buttonColor: Colors.red,
                              buttonWidth: 331.w,
                              buttonHeight: 63.h,
                              borderRadius: 15.r,
                              buttonEndIcon: Icons.logout_outlined,
                              endIconColor: Colors.white,
                              endIconSize: 24.r,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}