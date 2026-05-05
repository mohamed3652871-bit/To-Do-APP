import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/custom_buttons_box.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../../../core/widgets/validators.dart';
import '../cubit/change_password_cubit.dart';
import '../cubit/change_password_state.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangePasswordCubit(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is ChangePasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: AppColors.appPrimaryColor,
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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

                        /// Old Password
                        TextFormFiledBox(
                          controller: oldPasswordController,
                          boxColor: Colors.white,
                          hintText: TranslationKeys.oldPassword.tr,
                          borderRadius: 15,
                          hintFontSize: 14,
                          boxWidth: 331,
                          boxHeight: 63,
                          hintFontWeight: FontWeight.w400,
                          hintColor: Color(0xff6E6A7C),
                          hintBorderColor: Color(0xffCDCDCD),
                          hintBorderWidth: 0,
                          padding: EdgeInsets.all(5),
                          obSecureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return TranslationKeys.oldPassword.tr;
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 10.h),

                        /// New Password
                        TextFormFiledBox(
                          controller: newPasswordController,
                          boxColor: Colors.white,
                          hintText: TranslationKeys.newPassword.tr,
                          borderRadius: 15,
                          hintFontSize: 14,
                          boxWidth: 331,
                          boxHeight: 63,
                          hintFontWeight: FontWeight.w400,
                          hintColor: Color(0xff6E6A7C),
                          hintBorderColor: Color(0xffCDCDCD),
                          hintBorderWidth: 0,
                          padding: EdgeInsets.all(5),
                          obSecureText: true,
                          validator: validatePassword,
                        ),

                        SizedBox(height: 10.h),

                        /// Confirm Password
                        TextFormFiledBox(
                          controller: confirmPasswordController,
                          boxColor: Colors.white,
                          hintText: TranslationKeys.confirmPassword.tr,
                          borderRadius: 15,
                          hintFontSize: 14,
                          boxWidth: 331,
                          boxHeight: 63,
                          hintFontWeight: FontWeight.w400,
                          hintColor: Color(0xff6E6A7C),
                          hintBorderColor: Color(0xffCDCDCD),
                          hintBorderWidth: 0,
                          padding: EdgeInsets.all(5),
                          obSecureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return TranslationKeys.confirmPassword.tr;
                            }
                            if (value != newPasswordController.text) {
                              return TranslationKeys.passwordNotMatch.tr;
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 23.h),

                        /// Button
                        state is ChangePasswordLoading
                            ? const CircularProgressIndicator()
                            : ElvButton(
                                onPressedFn: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<ChangePasswordCubit>().changePassword(
                                      oldPassword: oldPasswordController.text,
                                      newPassword: newPasswordController.text,
                                      confirmPassword: confirmPasswordController.text,
                                    );
                                  }
                                },
                                buttonHeight: 48,
                                buttonWidth: 331,
                                buttonColor: AppColors.appGreen1,
                                shadowColor: AppColors.appGreen1,
                                text: TranslationKeys.confirm.tr,
                                font: 'Lexend Deca',
                                offsetY: 5,
                                blurRadius: 4,
                                spreedR: 0,
                                fontWeight: FontWeight.w300,
                                fontSize: 19,
                                borderRadius: 14,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
