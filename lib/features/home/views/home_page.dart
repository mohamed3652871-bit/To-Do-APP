import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:redacted/redacted.dart';

import 'package:to_do_app/core/translation/translation_keys.dart';
import 'package:to_do_app/core/utils/app_icons.dart';
import 'package:to_do_app/core/widgets/my_app_bar.dart';
import 'package:to_do_app/features/add_tasks/view/add_task.dart';

import '../../../core/cache/cache_helper.dart';
import '../../../core/cache/cache_keys.dart';
import '../../../core/utils/shared_packages.dart';
import '../../../core/widgets/task_box_widget.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../data/model/task_model.dart';

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
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading){

                  return Column(
                    children: [
                      MyAppBar(
                        tasks: false,
                        onTaskAdded: () => context.read<HomeCubit>().refresh(),
                        username:
                            CacheHelper.getValue(CacheKeys.username) ?? "Guest",
                        imagePath: CacheHelper.getValue(CacheKeys.userImage),
                      ).redacted(context: context, redact: true),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: ListView.builder(
                            itemCount: (5),
                            itemBuilder: (context, index) => TaskBox(
                              task: TaskModel(),
                              onUpdated: () =>
                                  context.read<HomeCubit>().refresh(),
                            ).redacted(context: context, redact: true),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                if (state is HomeError) {
                  return Center(child: Text(state.message));
                }

                if (state is HomeSuccess) {
                  final tasks = context.read<HomeCubit>().tasks;

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
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: _buildTasksList(tasks),
                              )
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
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildAddButton(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            TranslationKeys.homeHint.tr,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp),
          ), //no tasks yet
          SizedBox(height: 39.h),
          SvgPicture.asset(AppAssets.homeLogo, height: 268.h),

          SizedBox(height: 25.h),
        ],
      ),
    );
  }

  Widget _buildTasksList(List<TaskModel> tasks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Row(
          children: [
            Text(
              TranslationKeys.tasks.tr,
              style: TextStyle(
                color: AppColors.appBlack,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 20.w),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: AppColors.taskBoxColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                "${tasks.length}",
                style: TextStyle(fontSize: 11.sp, color: AppColors.appGreen1),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Expanded(
          child: ListView.builder(
            itemCount: (tasks.length),
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
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                AddTask(onTaskAdded: () => context.read<HomeCubit>().refresh()),
          ),
        );
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.appGreen1,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.appBlack,
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: AppIcon(icon: AppIcons.addTaskIcon, size: 24.r),
      ),
    );
  }
}
