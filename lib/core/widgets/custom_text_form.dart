import '../utils/shared_packages.dart';
class TextFormFiledBox extends StatelessWidget {
  final double boxWidth;
  final double boxHeight;
  final Color boxColor;
  final double borderRadius;
  final Widget? boxStartIcon;
  final Widget? boxEndIcon;
  final Color hintBorderColor;
  final double hintBorderWidth;
  final String hintText;
  final Color hintColor;
  final double hintFontSize;
  final FontWeight hintFontWeight;
  final bool obSecureText;
  final String obscureChar;
  final Color startIconColor;
  final Color endIconColor;
  final EdgeInsets padding;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const TextFormFiledBox({
    super.key,
    this.boxStartIcon,
    required this.hintText,
    required this.hintFontSize,
    required this.boxWidth,
    required this.boxHeight,
    required this.hintFontWeight,
    required this.hintColor,
    required this.hintBorderColor,
    required this.hintBorderWidth,
    this.boxEndIcon,
    this.obSecureText = false,
    required this.borderRadius,
    required this.boxColor,
    this.obscureChar = "*",
    this.startIconColor = Colors.black,
    this.endIconColor = Colors.black,
    required this.padding, this.validator, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth.w,
      height: boxHeight.h,
      alignment: Alignment.center,
      //        padding: EdgeInsets.only(left: 16.w,bottom: 19.h,top: 20.h),
      padding: padding,
      decoration: BoxDecoration(
        color: boxColor,
        border: Border.all(color: hintBorderColor, width: hintBorderWidth.w),
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: Container(
        padding: EdgeInsets.only(right: 16.w),
        child: Row(
          children: [
            if (boxStartIcon != null)
              Container(
                width: 24.w,
                height: 24.h,
                alignment: Alignment.center,
                child: boxStartIcon!,
              ),
            if (boxStartIcon != null) SizedBox(width: 16.w),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: TextFormField(
                  controller: controller,
                  validator: validator ,
                  maxLines: 1,
                  obscureText: obSecureText,
                  obscuringCharacter: obscureChar,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: InputBorder.none,
                    hintText: (hintText),
                    hintStyle: TextStyle(
                      height: 2.h,
                      fontFamily: 'Lexend Deca',
                      color: hintColor,
                      fontWeight: hintFontWeight,
                      fontSize: hintFontSize.sp,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: hintFontSize.sp,
                    height: 1.h,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            if (boxEndIcon != null)
              Container(
                width: 24.w,
                height: 24.h,
                alignment: Alignment.center,
                child: boxEndIcon!,
              ),

          ],
        ),
      ),
    );
  }
}
