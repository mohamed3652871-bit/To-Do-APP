import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:to_do_app/core/translation/translation_keys.dart';

import '../../features/Settings/views/settings.dart';
import '../../features/add_tasks/view/add_task.dart';
import '../cache/cache_keys.dart';
import '../cache/cache_helper.dart';
import '../utils/shared_packages.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.username,
    required this.tasks,
    required this.onTaskAdded,
    this.imagePath,
    this.onTapFun,
  });

  final String username;
  final bool tasks;
  final VoidCallback onTaskAdded;
  final String? imagePath;
  final VoidCallback? onTapFun;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final String usernameCached =
        CacheHelper.getValue(CacheKeys.username) ?? 'Guest';

    return InkWell(
      onTap: onTapFun ??
              () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
          },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),


        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: AppColors.appPrimaryColor,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),

        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.appBlack,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: width < 600 ? 24 : 28,
                backgroundImage: (imagePath != null &&
                    imagePath!.startsWith('http'))
                    ? NetworkImage(imagePath!)
                    : const AssetImage(AppAssets.placeHolder)
                as ImageProvider,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                "${TranslationKeys.hello.tr}\n$usernameCached",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: width < 600 ? 14 : 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            if (tasks)
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddTask(
                        onTaskAdded: onTaskAdded,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  size: width < 600 ? 24 : 28,
                  color: AppColors.appGreen1,
                ),
              ),
          ],
        ),
      ),
    );
  }
}