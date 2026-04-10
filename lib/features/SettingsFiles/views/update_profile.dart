
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/custom_text_form.dart';
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
                padding: EdgeInsets.only(
                  left: 16.w,
                  bottom: 19.h,
                  top: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}