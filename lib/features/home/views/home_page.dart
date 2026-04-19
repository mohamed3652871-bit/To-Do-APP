import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/app_icons.dart';
import 'package:to_do_app/core/widgets/my_app_bar.dart';
import 'package:to_do_app/features/add_tasks/view/add_task.dart';
import '../../../core/cache/cache_helper.dart';
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/task_box_widget.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../data/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..getTasks(),
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.infinity,
          color: AppColors.appPrimaryColor,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is HomeError) {
                return Center(child: Text(state.message));
              }

              if (state is HomeSuccess) {
                final tasks = state.tasks;

                return Column(
                  children: [
                    MyAppBar(
                      tasks: tasks.isNotEmpty,
                      onTaskAdded: () => context.read<HomeCubit>().refresh(),
                      username:
                          CacheHelper.getValue(CacheKeys.username) ?? "Guest",
                      imagePath: CacheHelper.getValue(CacheKeys.userImage),
                    ),
                    Expanded(
                      child: tasks.isNotEmpty
                          ? _buildTasksList(tasks)
                          : _buildEmptyState(context),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 20.w),
            Text(
              "Tasks",
              style: TextStyle(fontFamily: 'Lexend Deca', fontSize: 16.sp),
            ),
            SizedBox(width: 20.w),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.taskBoxColor,

                borderRadius: BorderRadius.circular(5.r),
              ),
              width: 14.w,
              height: 15.h,
              child: Text(
                "${tasks.length}",
                style: TextStyle(
                  fontFamily: 'Lexend Deca',
                  fontSize: 11.sp,
                  color: AppColors.appGreen1,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 31.h),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: tasks.length,
            itemBuilder: (context, index) => TaskBox(
              task: tasks[index],
              onUpdated: () => context.read<HomeCubit>().refresh(),
            ),
          ),
        ),
      ],
    );
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
                  builder: (_) => AddTask(
                    onTaskAdded: () => context.read<HomeCubit>().refresh(),
                  ),
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
