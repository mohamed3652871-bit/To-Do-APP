import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';
import 'package:to_do_app/core/cache/cache_keys.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/custom_buttons_box.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../../auth/views/login.dart';
import '../cubit/update_profile_cubit.dart';
import '../cubit/update_profile_state.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController _userNameController = TextEditingController();
  String? _selectedImagePath;


  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileUpdateCubit(),
      child: BlocConsumer<ProfileUpdateCubit, ProfileUpdateState>(
        listener: (context, state) {

          if (state is ProfileImagePicked) {
            setState(() {
              _selectedImagePath = context
                  .read<ProfileUpdateCubit>()
                  .selectedImagePath;

            });
          }
          if (state is ProfileUpdateSuccess) {
            setState(() {

            });
          }
        },
        builder: (context, state) {
          String? imagePath = CacheHelper.getValue(CacheKeys.userImage);

          return Scaffold(
            resizeToAvoidBottomInset: false,
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
                          BoxShadow(
                            color: AppColors.appBlack,
                            blurRadius: 4,
                            spreadRadius: 4,
                          ),
                        ],

                      ),
                      child: CircleAvatar(
                        backgroundColor: AppColors.appWhite,
                        foregroundImage: _selectedImagePath != null
                            ? FileImage(File(_selectedImagePath!))
                            : (imagePath != null && imagePath.isNotEmpty)
                            ? NetworkImage(imagePath)
                            : const AssetImage(AppAssets.userPhoto),
                        radius: 100.r,
                      )
                    ),
                    SizedBox(height: 23.h),
                    ElvButton(
                      onPressedFn: () {
                        ProfileUpdateCubit.get(context).pickImage();
                      },
                      buttonHeight: 25.h,
                      buttonColor: AppColors.appBlack,
                      shadowColor: AppColors.appGreen1,
                      fontSize: 10.sp,
                      buttonWidth: 100.w,
                      fontWeight: FontWeight.w400,
                      borderRadius: 15.r,
                      text: TranslationKeys.pickImage.tr,
                    ),
                    SizedBox(height: 23.h),
                    TextFormFiledBox(
                      controller: _userNameController,
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
                        context.read<ProfileUpdateCubit>().updateUsername(
                          _userNameController.text,


                        );
                      },

                      buttonHeight: 48,
                      buttonWidth: 240,
                      buttonColor: AppColors.appGreen1,
                      shadowColor: AppColors.appGreen1,
                      text: TranslationKeys.save.tr,
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
                              content: Text(TranslationKeys.areYouSure.tr),
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

                                    await ProfileUpdateCubit.get(
                                      context,
                                    ).deleteUser();
                                    if (state is ProfileDeleteSuccess) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const LoginPage(),
                                        ),
                                        (route) => true,
                                      );
                                      ScaffoldMessenger.of(
                                        parentContext,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } else if (state is ProfileDeleteError) {
                                      ScaffoldMessenger.of(
                                        parentContext,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                    }
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
                      buttonHeight: 30.h,
                      buttonColor: AppColors.appButtonRed,
                      shadowColor: AppColors.appButtonRed,
                      text: TranslationKeys.deleteUser.tr,
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
        },
      ),
    );
  }
}
