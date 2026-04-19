import 'package:intl/intl.dart';
import 'package:to_do_app/core/utils/app_icons.dart';
import 'package:to_do_app/core/widgets/custom_buttons_box.dart';

import '../../../core/network/api_helper.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../data/task_menu_model.dart';
import '/core/utils/shared_packages.dart';

class AddTask extends StatefulWidget {
  final VoidCallback onTaskAdded;
  const AddTask({super.key, required this.onTaskAdded});
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  DateTime? selectedDateTime;

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
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 21.r,
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        //back icon
        leadingWidth: 48.w,
        title: Text(
          "Add Task",
          style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontFamily: "Lexend Deca",
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.appPrimaryColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 46.h),
              Container(
                height: 207.h,
                width: 261.w,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: Image.asset(image1, fit: BoxFit.fill).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ), //Image Container
              SizedBox(height: 29.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Color(0xffCDCDCD), width: 1.w),
                ),
                child: TextFormFiledBox(
                  controller: titleController,
                  boxWidth: 331,
                  boxHeight: 63,
                  hintText: 'Title',
                  hintFontSize: 14,
                  hintFontWeight: FontWeight.w300,
                  hintColor: AppColors.appTextColor2,
                  hintBorderColor: Colors.transparent,
                  hintBorderWidth: 0,
                  borderRadius: 15,
                  boxColor: AppColors.appWhite,
                  padding: EdgeInsets.only(left: 16.w),
                ),
              ), //Title TextField
              SizedBox(height: 15.h),
              Container(
                width: 331.w,
                decoration: BoxDecoration(
                  color: AppColors.appWhite,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: AppColors.appBorderColor1,
                    width: 1.w,
                  ),
                ),
                constraints: BoxConstraints(minHeight: 63.h),
                child: Row(
                  children: [
                    SizedBox(width: 16.w),
                    Expanded(
                      child: TextFormField(
                        controller: descController,
                        minLines: 1,
                        maxLines: 6,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Description",
                          hintStyle: TextStyle(
                            fontFamily: 'Lexend Deca',
                            fontWeight: FontWeight.w300,
                            fontSize: 14.sp,
                            color: AppColors.appTextColor2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Description TextField


              SizedBox(height: 20.h),
              ElvButton(
                onPressedFn: () async {
                  if (titleController.text.isEmpty ||
                      descController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all fields")),
                    );
                    return;
                  }

                  String finalDescription = descController.text;
                  if (selectedDateTime != null) {
                    String formattedDate = DateFormat(
                      'dd MMMM, yyyy  hh:mm a',
                    ).format(selectedDateTime!);
                    finalDescription += "\n\nEnd Time: $formattedDate";
                  }

                  var result = await APIHelper.addTask(
                    title: titleController.text,
                    description: finalDescription,
                  );

                  result.fold(
                    (error) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(error)));
                    },
                    (task) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Task Added Successfully!")),
                      );
                      widget.onTaskAdded();
                      Navigator.pop(context);                    },
                  );
                },
                buttonHeight: 48,
                buttonWidth: 331,
                buttonColor: AppColors.appGreen1,
                shadowColor: AppColors.appGreen1,
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
      ),
    );
  }
}
