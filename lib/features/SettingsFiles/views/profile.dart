
import '../../../core/utils/shared_packages.dart';

String userName="user name";
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top:19.h,bottom:44.h,left:  20.w,right: 24.w),
          color: appMainColor,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60.h,
                      constraints: BoxConstraints(
                          minWidth: 196.w
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height:60.h,
                            width:60.w,
                            child: CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              backgroundImage: Image.asset('assets/images/palestine_flag.PNG').image,),
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 11.h),
                              SizedBox(
                                  width: 32.w,
                                  height: 15.h,
                                  child: Text(r'Hello!',style: TextStyle(fontFamily: 'Lexend Deca',fontSize: 12.sp,fontWeight: FontWeight.w300,),)
                              ),
                              SizedBox(height: 4.h),
                              Container(
                                  height: 20.h,
                                  constraints: BoxConstraints(
                                      maxWidth: 200.w
                                  ),
                                  child: Text(
                                    userName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontFamily: 'Lexend Deca',fontSize: 16.sp,fontWeight: FontWeight.w300,letterSpacing: 0),)
                              ),


                            ],
                          )

                        ],
                      ),
                    ),//avatar and name
                    Spacer(),
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            print('add task');
                          },
                          icon: Icon(Icons.add_circle_outline,size: 24,)),
                    )//add task button
                  ],
                ),//header
                SizedBox(height: 37.h,),
                ButtonV2(
                  onPressedFn: () {print("profile");},
                  text: 'Profile',
                  fontFamily: 'Lexend Deca',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.black,
                  buttonColor: Colors.white,
                  buttonWidth: 331.w,
                  buttonHeight: 63.h,
                  borderRadius: 15.r,
                  buttonStartIcon: Icons.person_outline_outlined,
                  startIconSize: 24.r,
                  buttonEndIcon: Icons.arrow_forward_ios,
                  endIconSize: 21.r,
                ),
                SizedBox(height: 25,),
                ButtonV2(
                  onPressedFn: () {print("Change Password");},
                  text: 'Change Password',
                  fontFamily: 'Lexend Deca',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.black,
                  buttonColor: Colors.white,
                  buttonWidth: 331.w,
                  buttonHeight: 63.h,
                  borderRadius: 15.r,
                  buttonStartIcon: Icons.lock_outline_rounded,
                  startIconSize: 24.r,
                  buttonEndIcon: Icons.arrow_forward_ios,
                  endIconSize: 21.r,
                ),
                SizedBox(height: 25,),
                ButtonV2(
                  onPressedFn: () {print("Settings");},
                  text: 'Settings',
                  fontFamily: 'Lexend Deca',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.black,
                  buttonColor: Colors.white,
                  buttonWidth: 331.w,
                  buttonHeight: 63.h,
                  borderRadius: 15.r,
                  buttonStartIcon: Icons.settings_outlined,
                  startIconSize: 24.r,
                  buttonEndIcon: Icons.arrow_forward_ios,
                  endIconSize: 21.r,
                ),


              ]
          ),

        ));
  }
}


class ButtonV2 extends StatelessWidget {
  final VoidCallback onPressedFn;
  final String text;

  final String fontFamily;
  final FontWeight fontWeight;
  final Color textColor;
  final double fontSize;

  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius;

  final IconData? buttonStartIcon;
  final double? startIconSize;
  final Color? startIconColor;
  final IconData? buttonEndIcon;
  final double? endIconSize;
  final Color? endIconColor;

  final Color buttonColor;
  final Color shadowColor;
  final double spreedR;
  final double blurRadius;
  final double offsetX;
  final double offsetY;
/////////////////////////////////////
  const ButtonV2({
    super.key,
    required this.onPressedFn,

    this.buttonWidth = 10,
    this.buttonHeight = 10,
    this.borderRadius = 0,

    this.buttonColor = Colors.blue,
    this.shadowColor = Colors.blue,
    this.spreedR=0,
    this.blurRadius = 0,
    this.offsetX = 0,
    this.offsetY = 0,

    this.buttonStartIcon,
    this.startIconSize,
    this.startIconColor,


    required this.text,
    required this.fontFamily,
    required this.fontWeight,
    required this.textColor,
    this.fontSize = 1,

    this.buttonEndIcon,
    this.endIconSize,
    this.endIconColor,


  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth.w,
      height:buttonHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: Offset(offsetX, offsetY),
            blurRadius: blurRadius.r,
            spreadRadius: spreedR.r,
          ),
        ],
      ),


      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),

          ),
          onPressed: onPressedFn,
          child: Row(
            children: [
             if(buttonStartIcon!=null)
               Icon(buttonStartIcon, size: 24, color: Colors.black,),
              SizedBox(width: 16.w),
              Text(text,style: TextStyle(fontFamily: fontFamily,fontWeight: fontWeight,fontSize: fontSize.sp,color: textColor,letterSpacing: 0,height: 1),),
              Spacer(),
              if(buttonEndIcon!=null)
                Icon(buttonEndIcon, size: fontSize, color: Colors.black,),
            ]
          )
      ),


    );
  }
}
