import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
abstract class AppIcons {
  static const _svgAssetBasePath = "assets/icons/";

  //static const _imageAssetBasePath="assets/images/";
  static const String personLogin = "${_svgAssetBasePath}Profile.svg";
  static const String lockOpened = "${_svgAssetBasePath}LockOpened.svg";
  static const String lockClosed = "${_svgAssetBasePath}LockClosed.svg";
  static const String passwordIcon = "${_svgAssetBasePath}Password.svg";
  static const String addTaskIcon = "${_svgAssetBasePath}addtask.svg";


}

class AppIcon extends StatelessWidget {
  final String icon;
  final double size;
  final Color? color;

  const AppIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.color,});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: BoxFit.contain,
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
