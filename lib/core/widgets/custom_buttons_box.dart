import '../utils/shared_packages.dart';

class ElvButton extends StatelessWidget {
  final Widget? buttonChild;
  final VoidCallback onPressedFn;

  final String text;
  final String font;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final MainAxisAlignment mainAxisAlign;

  final Color buttonColor;
  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius;


  final Color shadowColor;
  final double blurRadius;
  final double spreedR;
  final double offsetX;
  final double offsetY;

  const ElvButton({
    super.key,
    required this.onPressedFn,
    this.text = "Button",
    this.buttonChild,
    this.font = "Lexend Deca",
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w100,
    this.fontColor = Colors.white,
    this.mainAxisAlign = MainAxisAlignment.center,
    this.buttonWidth = 150.0,
    this.buttonHeight = 50.0,
    this.buttonColor = Colors.blue,
    this.borderRadius = 8.0,
    this.shadowColor = Colors.transparent,
    this.blurRadius = 0,
    this.spreedR = 0,
    this.offsetX = 0,
    this.offsetY = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth.w,
      height: buttonHeight.h,
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
          padding: EdgeInsets.zero,
          backgroundColor: buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        onPressed: onPressedFn,
        child:
            buttonChild ??
            Row(
              mainAxisAlignment: mainAxisAlign,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: fontColor,
                    fontSize: fontSize.sp,
                    fontWeight: fontWeight,
                    fontFamily: font,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ),
              ],
            ),
      ),
    );
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
    this.startIconColor=Colors.black,


    required this.text,
    required this.fontFamily,
    required this.fontWeight,
    required this.textColor,
    this.fontSize = 1,

    this.buttonEndIcon,
    this.endIconSize,
    this.endIconColor=Colors.black,


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
                  Icon(buttonStartIcon, size: startIconSize, color: startIconColor,),
                SizedBox(width: 16.w),
                Text(text,style: TextStyle(fontFamily: fontFamily,fontWeight: fontWeight,fontSize: fontSize.sp,color: textColor,letterSpacing: 0,height: 1),),
                Spacer(),
                if(buttonEndIcon!=null)
                  Icon(buttonEndIcon, size: endIconSize, color: endIconColor,),
              ]
          )
      ),


    );
  }
}


