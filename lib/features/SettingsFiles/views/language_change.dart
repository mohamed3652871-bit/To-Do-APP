import '../../../core/utils/shared_packages.dart';

Color enColor=Colors.white;
Color? tempColor;
Color arColor=Colors.black;
Color enButtonColor=Color(0xff149954);
Color arButtonColor=Color(0xffD9D9D9);


class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.appPrimaryColor,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 26.h,left: 20.w,right: 22.w),
        child: SingleChildScrollView(
          child:
          Column(
              children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                  IconButton(onPressed: () {
                    print("Back button pressed");
                  }, icon: Icon(Icons.arrow_back_ios),iconSize: 21.r,),
                   SizedBox(width: 110.w,),
                   Text("Settings",style: TextStyle(fontSize: 19.sp,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: "Lexend Deca"),),
                 ],
               ),
                SizedBox(height: 67.h,),
                Row(
                  children: [
                    Text('Language',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: "Lexend Deca"),),
                    Spacer(),

                    SizedBox(
                      width: 102.w,
                      height: 36.h,
                      child:ElevatedButton(
                        onPressed: (){
                          tempColor = arColor;
                          arColor = enColor;
                          enColor= tempColor!;
                          tempColor=arButtonColor;
                          arButtonColor=enButtonColor;
                          enButtonColor=tempColor!;
                          
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                        ),
                        child: Row(
                          children: [
                            //ArButton
                            Container(
                              width: 51.w,
                              height: 36.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: arButtonColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r),bottomLeft: Radius.circular(5.r))
                              ),
                              child: Text("AR",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w300,color: arColor,fontFamily: "Lexend Deca")),

                            ),
                            //EnButton
                            Container(
                              width: 51.w,
                              height: 36.h,
                              alignment: Alignment.center,

                              decoration: BoxDecoration(
                                  color: enButtonColor,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.r),bottomRight: Radius.circular(5.r))
                              ),
                              child: Text("EN",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w300,color: enColor,fontFamily: "Lexend Deca")),





                            ),

                          ],
                        ),
                      )

                    ),


                  ],
                )






              ]
          ),
        ),
      ),
    );

  }
}
/*
Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //ArButton
                            Container(
                              width: 51.w,
                              height: 36.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r),bottomLeft: Radius.circular(5.r))
                              ),
                              child: Text("AR",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: "Lexend Deca")),

                            ),
                            //EnButton
                            Container(
                              width: 51.w,
                              height: 36.h,
                              alignment: Alignment.center,

                              decoration: BoxDecoration(
                                  color: Color(0xff149954),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.r),bottomRight: Radius.circular(5.r))
                              ),
                              child: Text("EN",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w300,color: Colors.black,fontFamily: "Lexend Deca")),





                            ),

                          ],
                        )
*/

