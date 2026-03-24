import '/core/widgets/project_icons.dart';
import '/core/utils/shared_packages.dart';

int resultCount = 4;

class HomePageWithSearch extends StatelessWidget {
  const HomePageWithSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: appMainColor,

        leading: IconButton(
          onPressed: () {
            print('back');
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Tasks',
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            fontSize: 19.sp,
            fontWeight: FontWeight.w300,
            color: Color(0xff24252C),
            letterSpacing: 0,
            height: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
            color: appMainColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 331.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 14.h,
                        bottom: 13.h,
                        left: 17.w,
                        right: 1.w,
                      ),
                      border: InputBorder.none,
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        fontFamily: 'Lexend Deca',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w200,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          print('Search button');
                        },
                        icon: Icon(Icons.search, size: 25.r),
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28.h),
                Container(
                  margin: EdgeInsets.only(bottom: 27.w),
                  width: 101.w,
                  height: 15.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Results',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          height: 1,
                          letterSpacing: 0,
                        ),
                      ),
                      Spacer(),
                      Container(
                        constraints: BoxConstraints(minWidth: 14.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffCEEBDC),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          "$resultCount",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ), //tasks container
              ],
            ),
          ), //search
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 19.w, left: 22.w),
              color: appMainColor,
              // color: Colors.blueGrey,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      VerticalTaskBox(
                        taskStatue: 'In Progress',
                        taskDescription:
                            'Go to supermarket to buy some milk & eggs',
                        taskStatueWidget: InProgressBar(),
                        taskIconWidget: WorkIcon(),
                        taskImage: image1,
                      ),
                      VerticalTaskBox(
                        taskStatue: 'In Progress',
                        taskDescription:
                            'Go to supermarket to buy some milk & eggs',
                        taskStatueWidget: InProgressBar(),
                        taskIconWidget: WorkIcon(),
                        taskImage: image1,
                      ),
                      VerticalTaskBox(
                        taskStatue: 'In Progress',
                        taskDescription:
                            'Go to supermarket to buy some milk & eggs',
                        taskStatueWidget: InProgressBar(),
                        taskIconWidget: WorkIcon(),
                        taskImage: image1,
                      ),
                      VerticalTaskBox(
                        taskStatue: 'In Progress',
                        taskDescription:
                            'Go to supermarket to buy some milk & eggs',
                        taskStatueWidget: InProgressBar(),
                        taskIconWidget: WorkIcon(),
                        taskImage: image1,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      print('Filter Button');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 50.w,
                      margin: EdgeInsets.only(bottom: 20.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/filterIcon.png'),
                        ),
                        color: Color(0xff149954),
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.r,
                            spreadRadius: 0,
                            color: Color(0x75000000),
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), //sliding tasks
        ],
      ),
    );
  }
}

class VerticalTaskBox extends StatelessWidget {
  final String taskStatue;
  final String taskDescription;
  final Widget taskIconWidget;
  final Widget taskStatueWidget;
  final String taskImage;

  const VerticalTaskBox({
    super.key,
    required this.taskStatue,
    required this.taskDescription,
    required this.taskIconWidget,
    required this.taskStatueWidget,
    required this.taskImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334.w,
      height: 90.h,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(7.r),
              boxShadow: [
                BoxShadow(
                  color: Color(0x75000000),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(taskImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 14.w),

          SizedBox(
            width: 230.w,
            height: 60.h,
            child: Column(
              children: [
                Text(
                  taskDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Lexend Deca',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0,
                    height: 1,
                  ),
                ), //Content
                Spacer(),
                SizedBox(
                  width: 230.w,
                  height: 24.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      taskStatueWidget,
                      SizedBox(width: 11.w),
                      taskIconWidget,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
