
import 'package:to_do_app/features/SettingsFiles/views/settings.dart';
import 'package:to_do_app/features/SettingsFiles/views/update_profile.dart';

import '../../../core/cache/cache_helper.dart';
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/custom_buttons_box.dart';
import '../../auth/views/login.dart';
import 'change_password.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    String username = CacheHelper.getValue(CacheKeys.username) ?? 'Guest';
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top:19.h,bottom:44.h,left:  20.w,right: 24.w),
          color: AppColors.appPrimaryColor,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60.h,
                      constraints: BoxConstraints(
                          minWidth: 196.w
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height:60.h,
                            width:60.w,
                            child: CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              backgroundImage: Image.asset('assets/images/palestine_flag.PNG').image,),
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 11.h),
                              SizedBox(
                                  width: 32.w,
                                  height: 15.h,
                                  child: Text(r'Hello!',style: TextStyle(fontFamily: 'Lexend Deca',fontSize: 12.sp,fontWeight: FontWeight.w300,),)
                              ),
                              SizedBox(height: 4.h),
                              Container(
                                  height: 20.h,
                                  constraints: BoxConstraints(
                                      maxWidth: 200.w
                                  ),
                                  child: Text(
                                    username,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontFamily: 'Lexend Deca',fontSize: 16.sp,fontWeight: FontWeight.w300,letterSpacing: 0),)
                              ),


                            ],
                          )

                        ],
                      ),
                    ),//avatar and name

                  ],
                ),//header
                SizedBox(height: 37.h,),
                ButtonV2(
                  onPressedFn: () {Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => UpdateProfile()

                  ));},
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
                SizedBox(height: 25,),
                ButtonV2(
                  onPressedFn: () {Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()

                      ));},
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
                SizedBox(height: 25,),
                ButtonV2(
                  onPressedFn: () {Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => Settings()

                      ));},
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
                SizedBox(height: 25,),
                ButtonV2(
                  onPressedFn: () {
                    CacheHelper.removeValue(CacheKeys.accessToken);
                    CacheHelper.removeValue(CacheKeys.refreshToken);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
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


              ]
          ),

        ));
  }
}


