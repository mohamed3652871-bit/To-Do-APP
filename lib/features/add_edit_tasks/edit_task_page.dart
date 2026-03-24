import 'package:to_do_app/core/widgets/custom_buttons_box.dart';

import '../../core/widgets/custom_text_form.dart';
import '/core/utils/shared_packages.dart';

class EditTaskPage extends StatelessWidget {

  const EditTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48.h,
        backgroundColor: appMainColor,
        leading: SizedBox(
          width: 21.w,
          height: 21.h,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 21.r,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        leadingWidth: 48.w,
        title: Text(
          "Edit Task",
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontFamily: "Lexend Deca",
          ),
        ),
        centerTitle: true,
        actions: [
          ElvButton(
            onPressedFn: () {
              print('Register Button');
            },
            buttonHeight: 28,
            buttonWidth: 80,
            buttonColor: Colors.red,
            shadowColor: Colors.transparent,
            font: 'Lexend Deca',
            offsetY: 0,
            blurRadius: 4,
            spreedR: 0,
            fontWeight: FontWeight.w300,
            fontSize: 19,
            borderRadius: 14,
            buttonChild: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10.w),
                Icon(Icons.delete_forever, color: Colors.white, size: 16.r),
                Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontFamily: "Lexend Deca",
                  ),
                ),
              ],
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 20.w),
      ),
      body: Container(

        color: appMainColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 24.w,right: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r),
                        image: DecorationImage(image: Image.asset(
                          image1,
                        ).image,fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(65),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          )
                        ],

                      ),
                    ),//Profile Image
                    Container(
                      padding: EdgeInsets.only(left:14.w,top: 12.h,bottom: 12.h ),
                      width: 251.w,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('In Progress',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w300,fontFamily: 'Lexend Deca',letterSpacing: 0,height: 1)),
                          SizedBox(height: 2.h,),
                          Text(r"Believe you can, and you're halfway there.",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w300,fontFamily: 'Lexend Deca',letterSpacing: 0,height: 1),maxLines: 2,overflow: TextOverflow.ellipsis,),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 29.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Color(0xffCDCDCD), width: 1.w),
                ),
                child: ElvButton(
                  onPressedFn: () {},
                  buttonHeight: 63,
                  buttonWidth: 331,
                  buttonColor: Colors.white,
                  shadowColor: Colors.transparent,
                  borderRadius: 15,
                  buttonChild: Container(
                    padding: EdgeInsets.only(left: 16.w,right: 14.w),
                    child: Row(
                      children: [
                        Container(
                          width: 28.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Color(0xffFFE4F2),),
                            child: Icon(Icons.house,size: 18.r,color: Color(0xffFF1C92),)),
                        Container(
                          padding: EdgeInsets.only(left: 12.w),
                          alignment: Alignment.centerLeft,
                          height: 18.h,
                          child: Text(
                            'Home',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff6E6A7C),
                              letterSpacing: 0,
                              height: 1,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down_outlined, size: 21.r),

                      ],
                    ),
                  ),
                ),
              ), //Group Button
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Color(0xffCDCDCD), width: 1.w),
                ),
                child: TextFormFiledBox(
                  boxWidth: 331,
                  boxHeight: 63,
                  hintText: 'Title',
                  hintFontSize: 14,
                  hintFontWeight: FontWeight.w300,
                  hintColor: Color(0xff6E6A7C),
                  hintBorderColor: Colors.transparent,
                  hintBorderWidth: 0,
                  borderRadius: 15,
                  boxColor: Colors.white,
                  padding: EdgeInsets.only(left: 16.w,bottom: 19.h,top: 20.h),

                ),
              ), //Title TextField
              SizedBox(height: 15.h),
              Container(
                width: 331.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Color(0xffCDCDCD), width: 1.w),
                ),
                constraints: BoxConstraints(minHeight: 63.h),
                child: Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 6,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Description",
                          hintStyle: TextStyle(
                            fontFamily: 'Lexend Deca',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff6E6A7C),
                            letterSpacing: 0,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),//Description TextField
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Color(0xffCDCDCD), width: 1.w),
                ),
                child: TextFormFiledBox(
                  boxWidth: 331,
                  boxHeight: 63,
                  hintText: 'End Time',
                  hintFontSize: 14,
                  hintFontWeight: FontWeight.w300,
                  hintColor: Color(0xff6E6A7C),
                  hintBorderColor: Colors.transparent,
                  hintBorderWidth: 0,
                  borderRadius: 15,
                  boxColor: Colors.white,
                  //boxStartIcon: Icons.calendar_month,
                  startIconColor: Color(0xff149954),
                  padding: EdgeInsets.only(left: 16.w,bottom: 19.h,top: 20.h),

                ),
              ), //Date TextField
              SizedBox(height: 20.h),
              ElvButton(
                onPressedFn: () {
                  print('Register Button');
                },
                buttonHeight: 48,
                buttonWidth: 331,
                buttonColor: Color(0xff149954),
                shadowColor: Color(0xff149954),
                text: 'Mark ad Done ',
                font: 'Lexend Deca',
                offsetY: 5,
                blurRadius: 4,
                spreedR: 0,
                fontWeight: FontWeight.w300,
                fontSize: 19,
                borderRadius: 14,
              ),
              SizedBox(height: 22.h),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff149954), width: 1.w),
                  borderRadius: BorderRadius.circular(15.r),),
                child: ElvButton(
                  onPressedFn: () {
                    print('Update Button');
                  },
                  buttonHeight: 48,
                  buttonWidth: 331,
                  buttonColor: Colors.white,
                  shadowColor: Color(0xff149954).withAlpha(100),
                  text: 'Update ',
                  font: 'Lexend Deca',
                  offsetY: 5,
                  blurRadius: 10,
                  spreedR: 0,
                  fontWeight: FontWeight.w300,
                  fontSize: 19,
                  borderRadius: 14,
                  fontColor: Color(0xff149954),
                ),
              ),//Update Button

            ],
          ),
        ),
      ),
    );
  }
}
