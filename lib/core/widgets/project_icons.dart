import '../utils/shared_packages.dart';
class TaskStatueWidget extends StatelessWidget {
  final Color statueColor;
  final Color statueBGColor;
  final String statue;

  const TaskStatueWidget({
    super.key,
    required this.statue,
    required this.statueColor,
    required this.statueBGColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
      height: 16.8.h,
      constraints: BoxConstraints(minWidth: 56.w),
      decoration: BoxDecoration(
        color: statueBGColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(
        statue,
        style: TextStyle(
          color: statueColor,
          fontFamily: 'Lexend Deca',
          fontSize: 10.sp,
          fontWeight: FontWeight.w300,
          height: 0,
          letterSpacing: 0,
        ),
      ),
    );
  }
}

//////////////////////////////////////////////
class TaskIconWidget extends StatelessWidget {
  final IconData statueIcon;
  final Color iconBGColor;
  final Color iconColor;
  final double iconWidth;
  final double iconHeight;

  const TaskIconWidget({
    super.key,
    required this.statueIcon,
    required this.iconColor,
    required this.iconBGColor,
    this.iconWidth=22,
    this.iconHeight=22,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconWidth.w,
      height: iconHeight.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: iconBGColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Icon(statueIcon, size: 12.r, color: iconColor),
    );
  }
}

//////////////
class InProgressBar extends StatelessWidget {
  const InProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskStatueWidget(
      statue: "In Progress",
      statueColor: Colors.black,
      statueBGColor: Color(0xffCEEBDC),
    );
  }
}

class DoneBar extends StatelessWidget {
  const DoneBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskStatueWidget(
      statue: "Done",
      statueColor: Colors.white,
      statueBGColor: Colors.green,
    );
  }
}

class MissedBar extends StatelessWidget {
  const MissedBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TaskStatueWidget(
      statue: "In Progress",
      statueColor: Colors.white,
      statueBGColor: Colors.red,
    );
  }
}

class HomeIcon extends StatelessWidget {
  final Color iconColor;
  final Color iconBGColor;
  const HomeIcon({super.key, this.iconColor=Colors.white, this.iconBGColor=const Color(0xffFF0084)});


  @override
  Widget build(BuildContext context) {
    return  TaskIconWidget(
      statueIcon: Icons.home,
      iconColor: iconColor,
      iconBGColor: iconBGColor,
    );
  }
}

class WorkIcon extends StatelessWidget {
  final Color iconColor;
  final Color iconBGColor;
  const WorkIcon({super.key, this.iconColor=Colors.white, this.iconBGColor=Colors.black});

  @override
  Widget build(BuildContext context) {
    return  TaskIconWidget(
      statueIcon: Icons.work,
      iconColor: iconColor,
      iconBGColor: iconBGColor,
    );
  }
}

class PersonalIcon extends StatelessWidget {
  final Color iconColor;
  final Color iconBGColor;
  const PersonalIcon({super.key, this.iconColor=const Color(0xffCEEBDC), this.iconBGColor=const Color(0xff149954)});
  @override
  Widget build(BuildContext context) {
    return TaskIconWidget(
      statueIcon: Icons.person,
      iconColor: iconColor,
      iconBGColor: iconBGColor,
    );
  }
}
