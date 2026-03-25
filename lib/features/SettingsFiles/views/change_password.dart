
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/custom_buttons_box.dart';
import '../../../core/widgets/custom_text_form.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.appPrimaryColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child:
          Column(
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
                        image:Image.asset('assets/images/palestine_flag.PNG',).image,
                        fit: BoxFit.cover,
                      )
                  ),

                ),
                SizedBox(height: 23.h),
                TextFormFiledBox(
                  boxColor: Colors.white,
                  hintText: 'Username',
                  borderRadius: 15,
                  hintFontSize: 14 ,
                  boxWidth: 331,
                  boxHeight:63 ,
                  hintFontWeight:FontWeight.w400 ,
                  hintColor: Color(0xff6E6A7C) ,
                  hintBorderColor: Color(0xffCDCDCD) ,
                  hintBorderWidth: 0 ,
                  padding: EdgeInsets.only(left: 16.w,bottom: 19.h,top: 20.h),


                ),
                SizedBox(height: 10.h,),
                TextFormFiledBox(
                  boxColor: Colors.white,
                  hintText: 'New Password',
                  borderRadius: 15,
                  hintFontSize: 14 ,
                  boxWidth: 331,
                  boxHeight:63 ,
                  hintFontWeight:FontWeight.w400 ,
                  hintColor: Color(0xff6E6A7C) ,
                  hintBorderColor: Color(0xffCDCDCD) ,
                  hintBorderWidth: 0 ,
                  padding: EdgeInsets.only(left: 16.w,bottom: 19.h,top: 20.h),


                ),
                SizedBox(height: 10.h,),
                TextFormFiledBox(
                  boxColor: Colors.white,
                  hintText: 'Confirm Password',
                  borderRadius: 15,
                  hintFontSize: 14 ,
                  boxWidth: 331,
                  boxHeight:63 ,
                  hintFontWeight:FontWeight.w400 ,
                  hintColor: Color(0xff6E6A7C) ,
                  hintBorderColor: Color(0xffCDCDCD) ,
                  hintBorderWidth: 0 ,
                  padding: EdgeInsets.only(left: 16.w,bottom: 19.h,top: 20.h),


                ),
                SizedBox(height: 23.h,),
                ElvButton(
                  onPressedFn: () {print('Register Button');},
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






              ]
          ),
        ),
      ),
    );

  }
}

