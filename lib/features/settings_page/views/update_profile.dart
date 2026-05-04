import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';
import 'package:to_do_app/core/cache/cache_keys.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/custom_buttons_box.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../../auth/views/login.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.appPrimaryColor,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5),
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  boxShadow: [
                    BoxShadow(color: AppColors.appBlack,
                        blurRadius: 4,spreadRadius: 4),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(CacheHelper.getValue(CacheKeys.userImage)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 23.h),
              TextFormFiledBox(
                controller: userNameController,
                boxColor: Colors.white,
                hintText: TranslationKeys.email.tr,
                borderRadius: 15,
                hintFontSize: 17,
                boxWidth: 331,
                boxHeight: 63,
                hintFontWeight: FontWeight.w400,
                hintColor: AppColors.appTextColor1,
                hintBorderColor: AppColors.appBorderColor1,
                hintBorderWidth: 0,
                padding: EdgeInsets.all(10.w),
              ),
              SizedBox(height: 23.h),
              ElvButton(
                onPressedFn: () async {
                  var result = await APIHelper.updateProfile(
                    userName: userNameController.text,
                  );
                  result.fold(
                    (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                          backgroundColor: AppColors.appButtonRed,
                        ),
                      );
                    },
                    (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(success),
                          backgroundColor: AppColors.appGreen1,
                        ),
                      );
                    },
                  );
                },
        
                buttonHeight: 48,
                buttonWidth: 331,
                buttonColor: AppColors.appGreen1,
                shadowColor: AppColors.appGreen1,
                text:TranslationKeys.save.tr,
                offsetY: 5,
                blurRadius: 4,
                spreedR: 0,
                fontWeight: FontWeight.w300,
                fontSize: 19,
                borderRadius: 14,
              ),
              SizedBox(height: 23.h),
              ElvButton(
                onPressedFn: () async {
                  final parentContext = context;
        
                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: Text(TranslationKeys.confirmDelete.tr),
                        content: Text(
                          TranslationKeys.areYouSure.tr,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                            child: Text(TranslationKeys.cancel.tr),
                          ),
                          TextButton(
        
                            onPressed: () async {
                              Navigator.pop(dialogContext);
        
                              var result = await APIHelper.deleteUserProfile();
        
                              if (!mounted) return;
        
                              result.fold(
                                (error) {
                                  ScaffoldMessenger.of(
                                    parentContext,
                                  ).showSnackBar(
                                    SnackBar(
                                      content: Text(error),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                },
                                (success) {
                                  Navigator.of(
                                    context,
                                    rootNavigator: true,
                                  ).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (_) => LoginPage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                              );
                            },
                            child: Text(
                              TranslationKeys.delete.tr,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                buttonHeight: 48,
                buttonWidth: 240,
                buttonColor: AppColors.appButtonRed,
                shadowColor: AppColors.appButtonRed,
                text:  TranslationKeys.deleteUser.tr,
                font: 'Lexend Deca',
                offsetY: 5,
                blurRadius: 4,
                spreedR: 0,
                fontWeight: FontWeight.w300,
                fontSize: 19,
                borderRadius: 14,
              ),
              SizedBox(height: 41.h),
            ],
          ),
        ),
      ),
    );
  }
}
