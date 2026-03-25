import '../../home/views/home_page.dart';
import '../validators.dart';
import 'register.dart';
import '../../../../core/network/api_helper.dart';
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
  bool isLoading = false;
  var formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
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
      body: Form(
        key: formKey,
        child: Container(
          color: AppColors.appWhite,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
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
                      image: Image.asset(AppAssets.loginLogo).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 23.h),
                TextFormFiledBox(
                  controller: emailController,
                  validator: validateEmail,
                  boxColor: AppColors.appWhite,
                  boxStartIcon: AppIcon(icon: AppIcons.personLogin),
                  hintText: 'Username',
                  borderRadius: 15,
                  hintFontSize: 14,
                  boxWidth: 331,
                  boxHeight: 63,
                  hintFontWeight: FontWeight.w400,
                  hintColor: AppColors.appTextColor2,
                  hintBorderColor: AppColors.appBorderColor1,
                  hintBorderWidth: 1,
                  padding: EdgeInsets.only(left: 16.w, bottom: 10.h, top: 10.h),
                ),
                SizedBox(height: 10.h),
                TextFormFiledBox(
                  controller: passwordController,
                  validator: validatePassword,
                  boxColor: AppColors.appWhite,
                  boxStartIcon: AppIcon(icon: AppIcons.passwordIcon),
                  hintText: 'Password',
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
                  padding: EdgeInsets.only(left: 16.w, bottom: 10.h, top: 10.h),
                ),
                SizedBox(height: 23.h),
                ElvButton(
                  onPressedFn: login,
                  buttonHeight: 48,
                  buttonWidth: 331,
                  buttonColor: AppColors.appGreen1,
                  shadowColor: AppColors.appGreen1,
                  text: 'Login',
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
                        r"Don't Have An Account?",
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
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                          ),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: AppColors.appBlack,
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
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async {
    if (formKey.currentState?.validate() == true) {
      setState(() {
        isLoading = true;
      });

      var result = await APIHelper.login(
        username: emailController.text,
        password: passwordController.text,
      );

      result.fold(
            (String error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error, style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.red,
            ),
          );
        },
            (userModel) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login successfully\n Welcome ${userModel.username ?? "User"}',
                style: TextStyle(color: AppColors.appWhite),
              ),
              backgroundColor: AppColors.appGreen1,
            ),
          );

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),

                (route) => false,
          );
        },
      );

      setState(() {
        isLoading = false;
      });
    }
  }
}
