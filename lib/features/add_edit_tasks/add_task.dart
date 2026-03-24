import 'package:to_do_app/features/home/views/home_with_tasks.dart';
import 'package:to_do_app/core/widgets/custom_buttons_box.dart';

import '../../core/widgets/custom_text_form.dart';
import '/core/utils/shared_packages.dart';
class AddTask extends StatelessWidget {

  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48.h,
        backgroundColor: AppColors.appPrimaryColor,
        leading: SizedBox(
          width: 21.w,
          height: 21.h,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {print("Back button pressed");},
            iconSize: 21.r,
            icon: Icon(Icons.arrow_back_ios,),
          ),
        ),//back icon
        leadingWidth: 48.w,
        title:Text("Add Task",style: TextStyle(fontSize: 19.sp,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: "Lexend Deca"),) ,
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.appPrimaryColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(height: 46.h,),
              Container(
                height: 207.h,width: 261.w,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.r),
                   image: DecorationImage(image:Image.asset(image1,fit: BoxFit.fill,).image,fit: BoxFit.cover)
                ),
              ),//Image Container
              SizedBox(height: 29.h,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Color(0xffCDCDCD),width: 1.w),
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
              ),//Title TextField
              SizedBox(height: 15.h,),
              Container(
                  width: 331.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Color(0xffCDCDCD),width: 1.w),
                  ),
                  constraints: BoxConstraints(
                      minHeight: 63.h,
                  ),
                child: Row(
                  children: [
                    SizedBox(width: 16.w,),
                    Expanded(
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 6,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        hintText: "Description",
                        hintStyle: TextStyle(fontFamily: 'Lexend Deca',fontSize: 14.sp,color: Color(0xff6E6A7C))
                        )
                      ),
                    ),

                  ]
                ),
                  ),//Description TextField
              SizedBox(height: 15.h,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Color(0xffCDCDCD),width: 1.w),
                ),
                child: ElvButton(onPressedFn: (){},
                  buttonHeight: 63,
                  buttonWidth: 331,
                  buttonColor: Colors.white,
                  shadowColor: Colors.transparent,
                  borderRadius: 15,
                  buttonChild: Row(
                    children: [
                      SizedBox(width: 16.w,),
                      SizedBox(
                        height: 18.h,
                        child: Text('Group',
                          style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff6E6A7C),
                              letterSpacing: 0,
                              height: 1
                          ),

                        ),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_down_outlined,size: 21.r),
                      SizedBox(width: 21.w,)
                    ],),


                ),
              ),//Group Button
              SizedBox(height: 15.h,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Color(0xffCDCDCD),width: 1.w),
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
                 // boxStartIcon: Icons.calendar_month,
                  startIconColor: Color(0xff149954),
                  padding: EdgeInsets.only(left: 16.w,bottom: 19.h,top: 20.h),


                ),
              ),//Date TextField
              SizedBox(height: 20.h,),
              ElvButton(
                onPressedFn: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(

                )));},
                buttonHeight: 48,
                buttonWidth: 331,
                buttonColor: Color(0xff149954),
                shadowColor: Color(0xff149954),
                text: 'Add Task ',
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
    )




    );
  }
}
