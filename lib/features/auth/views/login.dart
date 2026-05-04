import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/translation/translation_keys.dart';
import '../../home/views/home_page.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../../../core/widgets/validators.dart';
import '../data/repo/login_repo.dart';
import 'register.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/shared_packages.dart';
import '../../../../core/widgets/custom_buttons_box.dart';
import '../../../../core/widgets/custom_text_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;
  var formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepo(APIHelper())),
      child: BlocConsumer<LoginCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }

            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${TranslationKeys.loginSnackBarA.tr} ${state.user.username ?? "User"}',
                  ),
                  backgroundColor: AppColors.appGreen1,
                ),
              );

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false,
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.appWhite,
                elevation: 0,
                title: Text(TranslationKeys.login.tr,style: TextStyle(
                  color: AppColors.appBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
                centerTitle: true,
              ),
                body: Stack(
                    children: [
                      Form(
                        key: formKey,
                        child: Container(
                          color: AppColors.appWhite,
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 320.h,
                            child: Column(
                              children: [
                                ///email field
                                TextFormFiledBox(
                                  controller: _emailController,
                                  validator: validateEmail,
                                  boxColor: AppColors.appWhite,
                                  boxStartIcon: AppIcon(
                                      icon: AppIcons.personLogin),
                                  hintText: TranslationKeys.emailHint.tr,
                                  borderRadius: 15,
                                  hintFontSize: 14,
                                  boxWidth: 331,
                                  boxHeight: 63,
                                  hintFontWeight: FontWeight.w400,
                                  hintColor: AppColors.appTextColor2,
                                  hintBorderColor: AppColors.appBorderColor1,
                                  hintBorderWidth: 1,
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                    bottom: 10.h,
                                    top: 10.h,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                ///password field
                                TextFormFiledBox(
                                  controller: _passwordController,
                                  validator: validatePassword,
                                  boxColor: AppColors.appWhite,
                                  boxStartIcon: AppIcon(
                                      icon: AppIcons.passwordIcon),
                                  hintText: TranslationKeys.passwordHint.tr,
                                  hintFontSize: 14,
                                  borderRadius: 15,
                                  boxWidth: 331,
                                  boxHeight: 63,
                                  hintFontWeight: FontWeight.w400,
                                  hintColor: AppColors.appTextColor2,
                                  hintBorderColor: AppColors.appBorderColor1,
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
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                    bottom: 10.h,
                                    top: 10.h,
                                  ),
                                ),
                                SizedBox(height: 23.h),
                                ElvButton(
                                  onPressedFn: ()async {
                                    if (formKey.currentState?.validate() ==
                                        true) {
                                      await LoginCubit.get(context).loginFun(
                                        username: _emailController.text,
                                        password: _passwordController.text,

                                      );
                                    }
                                  },
                                  buttonHeight: 48,
                                  buttonWidth: 331,
                                  buttonColor: AppColors.appGreen1,
                                  shadowColor: AppColors.appGreen1,
                                  text: TranslationKeys.login.tr,
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
                                        TranslationKeys.loginPageHelp.tr,
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
                                                builder: (context) =>
                                                    RegisterPage(),
                                              ),
                                            );
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            minimumSize: Size(0, 0),
                                          ),
                                          child: Text(
                                            TranslationKeys.loginRegister.tr,
                                            style: TextStyle(
                                              color: AppColors.appGreen1,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900,
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
                      if (state is AuthLoading)
                        Container(
                          color: Colors.grey.withAlpha(100),
                            width: double.infinity,
                            height: double.infinity,
                            child:  Center(child: SizedBox(
                              width: 75.w,
                              height: 75.h,
                              child: CircularProgressIndicator(
                                color: AppColors.appGreen1,
                                strokeWidth: 10,
                              ),
                            ))),
                    ]
                )
            )
            ;
          }),
    );
  }


}
