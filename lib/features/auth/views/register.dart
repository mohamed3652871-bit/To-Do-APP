import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/shared_packages.dart';
import 'package:to_do_app/core/utils/app_icons.dart';
import 'package:to_do_app/core/widgets/custom_buttons_box.dart';
import 'package:to_do_app/core/widgets/custom_text_form.dart';

import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';
import '../data/validators.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisible = true;
  bool passwordConfirmVisible = true;
  var formKey = GlobalKey<FormState>();
  String? selectedImagePath;

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }

              if (state is RegisterSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Account Created!")),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );

              }
              if (state is RegisterImagePicked) {
                setState(() {
                  selectedImagePath = state.imagePath;
                });
              }

            },
            builder: (context, state) {
              return Scaffold(
                body: Stack(
                  children: [Scaffold(
                body: Container(
                color: Colors.white12,
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
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
                              image: selectedImagePath != null
                                  ? DecorationImage(
                                image: FileImage(File(selectedImagePath!)),
                                fit: BoxFit.cover,
                              )
                                  : DecorationImage(
                                image: AssetImage(image1),
                                fit: BoxFit.cover,
                              ),                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: ElvButton(
                                    buttonWidth: 113.w,
                                    buttonHeight: 23.h,
                                    buttonColor: Colors.grey,
                                    onPressedFn: () {
                                      context.read<RegisterCubit>().pickImage();
                                    },
                                    font: 'Lexend Deca',
                                    text: 'Pick Image',
                                    spreedR: 0,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    borderRadius: 10,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                          SizedBox(height: 23.h),
                          TextFormFiledBox(
                            controller: _userController,
                            validator: validateEmail,
                            boxColor: Colors.white,
                            boxStartIcon: AppIcon(icon: AppIcons.personLogin),
                            hintText: 'Username',
                            borderRadius: 15,
                            hintFontSize: 14,
                            boxWidth: 331,
                            boxHeight: 63,
                            hintFontWeight: FontWeight.w400,
                            hintColor: Color(0xff6E6A7C),
                            hintBorderColor: Color(0xffCDCDCD),
                            hintBorderWidth: 1,
                            padding: EdgeInsets.only(left: 16.w,
                                bottom: 10.h,
                                top: 10.h),
                          ),
                          SizedBox(height: 10.h),
                          TextFormFiledBox(
                            controller: _passController,
                            validator: validatePassword,
                            boxColor: Colors.white,
                            boxStartIcon: AppIcon(icon: AppIcons.passwordIcon),
                            hintText: 'Password',
                            hintFontSize: 14,
                            borderRadius: 15,
                            boxWidth: 331,
                            boxHeight: 63,
                            hintFontWeight: FontWeight.w400,
                            hintColor: Color(0xff6E6A7C),
                            hintBorderColor: Color(0xffCDCDCD),
                            hintBorderWidth: 1,
                            boxEndIcon: InkWell(
                              child: AppIcon(
                                icon: passwordVisible
                                    ? AppIcons.lockClosed
                                    : AppIcons.lockOpened,
                              ),
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),

                            obSecureText: passwordVisible,
                            padding: EdgeInsets.only(left: 16.w,
                                bottom: 10.h,
                                top: 10.h),
                          ),
                          SizedBox(height: 10.h),
                          TextFormFiledBox(
                            controller: _confirmPassController,
                            validator: validatePassword,
                            boxColor: Colors.white,
                            boxStartIcon: AppIcon(icon: AppIcons.passwordIcon),
                            hintText: 'Confirm Password',
                            hintFontSize: 14,
                            borderRadius: 15,
                            boxWidth: 331,
                            boxHeight: 63,
                            hintFontWeight: FontWeight.w400,
                            hintColor: Color(0xff6E6A7C),
                            hintBorderColor: Color(0xffCDCDCD),
                            hintBorderWidth: 1,
                            boxEndIcon: InkWell(
                              child: AppIcon(
                                icon: passwordConfirmVisible
                                    ? AppIcons.lockClosed
                                    : AppIcons.lockOpened,
                              ),
                              onTap: () {
                                setState(() {
                                  passwordConfirmVisible =
                                  !passwordConfirmVisible;
                                });
                              },
                            ),
                            obSecureText: passwordConfirmVisible,
                            padding: EdgeInsets.only(left: 16.w,
                                bottom: 10.h,
                                top: 10.h),
                          ),
                          SizedBox(height: 23.h),
                          ElvButton(
                            onPressedFn: () {
                              if (formKey.currentState!.validate()) {

                                if (_passController.text != _confirmPassController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Passwords don't match!")),
                                  );
                                  return;
                                }

                                if (selectedImagePath == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Please pick an image")),
                                  );
                                  return;
                                }

                                context.read<RegisterCubit>().register(
                                  username: _userController.text,
                                  password: _passController.text,
                                  imagePath: selectedImagePath!,
                                );
                              }
                            },                            buttonHeight: 48,
                            buttonWidth: 331,
                            buttonColor: Color(0xff149954),
                            shadowColor: Color(0xff149954),
                            text: 'Register',
                            font: 'Lexend Deca',
                            offsetY: 5,
                            blurRadius: 4,
                            spreedR: 0,
                            fontWeight: FontWeight.w300,
                            fontSize: 19,
                            borderRadius: 14,
                          ),
                          SizedBox(height: 41.h),
                          Container(
                            alignment: Alignment.center,
                            width: 228.w,
                            height: 18.h,
                            child: Row(
                              children: [
                                Text(
                                  "Already Have An Account?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 18.h,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size(0, 0),
                                    ),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
                    if (state is RegisterLoading)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              );
            },
        ));
            }
            }

