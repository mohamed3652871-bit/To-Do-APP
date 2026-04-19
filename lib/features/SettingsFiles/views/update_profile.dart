import '../../../core/network/api_helper.dart';
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
      body: Container(
        color: AppColors.appPrimaryColor,
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
                    image: AssetImage('assets/images/palestine_flag.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 23.h),
              TextFormFiledBox(
                controller: userNameController,
                boxColor: Colors.white,
                hintText: 'Username',
                borderRadius: 15,
                hintFontSize: 14,
                boxWidth: 331,
                boxHeight: 63,
                hintFontWeight: FontWeight.w400,
                hintColor: Color(0xff6E6A7C),
                hintBorderColor: Color(0xffCDCDCD),
                hintBorderWidth: 0,
                padding: EdgeInsets.only(left: 16.w, bottom: 19.h, top: 20.h),
              ),
              SizedBox(height: 23.h),
              ElvButton(
                onPressedFn: () async {
                  var result = await APIHelper.updateProfile(userName: userNameController.text);
                  result.fold(
                        (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                        (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(success),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  );
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
              SizedBox(height: 23.h),
              ElvButton(
                onPressedFn: () async {
                  final parentContext = context; // 🔥 مهم

                  await showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: Text("Confirm Delete"),
                        content: Text("Are you sure you want to delete your account?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(dialogContext);

                              var result = await APIHelper.deleteUserProfile();

                              if (!mounted) return;

                              result.fold(
                                    (error) {
                                  ScaffoldMessenger.of(parentContext).showSnackBar(
                                    SnackBar(
                                      content: Text(error),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                },
                                    (success) {
                                  Navigator.pushReplacement(
                                    parentContext,
                                    MaterialPageRoute(builder: (_) => LoginPage()),
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                buttonHeight: 48,
                buttonWidth: 331,
                buttonColor: Color(0xff149954),
                shadowColor: Color(0xff149954),
                text: 'DeleteUser ',
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
    );
  }
}
