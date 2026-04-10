import 'package:dartz/dartz.dart' hide State;
import 'package:to_do_app/core/utils/app_icons.dart';
import 'package:to_do_app/core/widgets/my_app_bar.dart';
import 'package:to_do_app/features/add_tasks/view/add_task.dart';
import '../../../core/network/api_helper.dart';
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/task_box_widget.dart';
import '../data/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Either<String, List<TaskModel>>> tasksFuture;

  @override
  void initState() {
    super.initState();
    tasksFuture = APIHelper.getTasks();
  }

  void refreshTasks() {
    setState(() {
      tasksFuture = APIHelper.getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.infinity,
        color: AppColors.appPrimaryColor,
        child: FutureBuilder<Either<String, List<TaskModel>>>(
          future: tasksFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return snapshot.data!.fold(
              (error) => Center(
                child: Text(error, style: TextStyle(color: Colors.red)),
              ),
              (tasks) {
                bool hasTasks = tasks.isNotEmpty;

                return Column(
                  children: [
                    MyAppBar(tasks: hasTasks, onTaskAdded: refreshTasks),
                    Expanded(
                      child: hasTasks
                          ? _buildTasksList(tasks)
                          : _buildEmptyState(context),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 123.h),
        SizedBox(
          width: 182.w,
          child: Text(
            "There are no tasks yet, Press the button \nTo add New Task",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Lexend Deca', fontSize: 16.sp),
          ),
        ),
        SizedBox(height: 39.h),
        SvgPicture.asset(AppAssets.homeLogo, height: 268.h),

        const Spacer(),
        _buildAddButton(context),
        SizedBox(height: 25.h),
      ],
    );
  }

  Widget _buildTasksList(List<TaskModel> tasks) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskBox(
        task: tasks[index],
        onUpdated: refreshTasks,
      ),    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 25.w),
          child: InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddTask(onTaskAdded: refreshTasks),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 50.r,
                  height: 50.r,
                  decoration: BoxDecoration(
                    color: AppColors.appGreen1,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                AppIcon(icon: AppIcons.addTaskIcon),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
