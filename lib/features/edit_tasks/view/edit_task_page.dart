import 'package:to_do_app/core/widgets/custom_buttons_box.dart';
import '../../../core/widgets/custom_text_form.dart';
import '../../home/data/task_model.dart';
import '../../../core/network/api_helper.dart';
import '/core/utils/shared_packages.dart';

class EditTaskPage extends StatefulWidget {
  final TaskModel task;

  const EditTaskPage({super.key, required this.task});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController titleController;
  late TextEditingController descController;

  @override
  void initState() {
    super.initState();
    titleController =
        TextEditingController(text: widget.task.title ?? "");
    descController =
        TextEditingController(text: widget.task.description ?? "");
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

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
            onPressed: () => Navigator.pop(context),
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

        /// DELETE
        actions: [
          ElvButton(
            onPressedFn: () async {
              final result = await APIHelper.deleteTask(
                taskId: widget.task.id!,
              );

              result.fold(
                    (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  );
                },
                    (_) {
                  Navigator.pop(context, true); // 🔥 مهم
                },
              );
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
        color: AppColors.appPrimaryColor,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// HEADER
              Container(
                padding: EdgeInsets.only(left: 24.w, right: 20.w),
                child: Row(
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r),
                        image: DecorationImage(
                          image: Image.asset(AppAssets.userPhoto).image,
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(65),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 14.w,
                        top: 12.h,
                        bottom: 12.h,
                      ),
                      width: 251.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'In Progress',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Lexend Deca',
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            r"Believe you can, and you're halfway there.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 29.h),

              /// TITLE
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
                  hintColor: Color(0xff6E6A7C),
                  hintBorderColor: Colors.transparent,
                  hintBorderWidth: 0,
                  borderRadius: 15,
                  boxColor: Colors.white,
                  padding: EdgeInsets.only(left: 16.w, bottom: 19.h, top: 20.h),
                ),
              ),

              SizedBox(height: 15.h),

              /// DESCRIPTION
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
                        controller: descController,
                        minLines: 1,
                        maxLines: 6,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Description",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff149954), width: 1.w),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: ElvButton(
                  onPressedFn: () async {
                    final result = await APIHelper.updateTask(
                      taskId: widget.task.id!,
                      title: titleController.text,
                      description: descController.text,

                    );
                    print(titleController.text);
                    print(descController.text);

                    result.fold(
                          (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error)),
                        );
                      },
                          (_) {
                        Navigator.pop(context, true);
                      },
                    );
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
              ),

              SizedBox(height: 22.h),
            ],
          ),
        ),
      ),
    );
  }
}