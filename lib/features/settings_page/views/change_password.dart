import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/custom_buttons_box.dart';
import '../../../core/widgets/custom_text_form.dart';
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
            body: Container(
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
                        width: 375.w,
                        height: 298.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/palestine_flag.PNG',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(height: 23.h),

                      /// Old Password
                      TextFormFiledBox(
                        controller: oldPasswordController,
                        boxColor: Colors.white,
                        hintText: 'oldPassword',
                        borderRadius: 15,
                        hintFontSize: 14,
                        boxWidth: 331,
                        boxHeight: 63,
                        hintFontWeight: FontWeight.w400,
                        hintColor: Color(0xff6E6A7C),
                        hintBorderColor: Color(0xffCDCDCD),
                        hintBorderWidth: 0,
                        padding: EdgeInsets.only(
                          left: 16.w,
                          bottom: 19.h,
                          top: 20.h,
                        ),
                        obSecureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter old password';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      /// New Password
                      TextFormFiledBox(
                        controller: newPasswordController,
                        boxColor: Colors.white,
                        hintText: 'New Password',
                        borderRadius: 15,
                        hintFontSize: 14,
                        boxWidth: 331,
                        boxHeight: 63,
                        hintFontWeight: FontWeight.w400,
                        hintColor: Color(0xff6E6A7C),
                        hintBorderColor: Color(0xffCDCDCD),
                        hintBorderWidth: 0,
                        padding: EdgeInsets.only(
                          left: 16.w,
                          bottom: 19.h,
                          top: 20.h,
                        ),
                        obSecureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter new password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      /// Confirm Password
                      TextFormFiledBox(
                        controller: confirmPasswordController,
                        boxColor: Colors.white,
                        hintText: 'Confirm Password',
                        borderRadius: 15,
                        hintFontSize: 14,
                        boxWidth: 331,
                        boxHeight: 63,
                        hintFontWeight: FontWeight.w400,
                        hintColor: Color(0xff6E6A7C),
                        hintBorderColor: Color(0xffCDCDCD),
                        hintBorderWidth: 0,
                        padding: EdgeInsets.only(
                          left: 16.w,
                          bottom: 19.h,
                          top: 20.h,
                        ),
                        obSecureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm your password';
                          }
                          if (value != newPasswordController.text) {
                            return 'Passwords do not match';
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
                              buttonColor: Color(0xff149954),
                              shadowColor: Color(0xff149954),
                              text: 'Save ',
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
          );
        },
      ),
    );
  }
}
