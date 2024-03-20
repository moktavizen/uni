import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color surface = Color(0xFFFFFFFF);
const Color onSurface = Color(0xFF240F4F);
const Color onSurfaceVar = Color(0xFF8789A3);
const Color primary = Color(0xFF672CBC);
const Color secondary = Color(0xFF994EF8);

const Widget menuIcon = SvgIcon(iconName: 'menu-icon');
const Widget searchIcon = SvgIcon(iconName: 'search-icon');
const Widget favoriteIcon = SvgIcon(iconName: 'favorite-icon');
const Widget favoriteIconSolid = SvgIcon(iconName: 'favorite-icon-solid');
const Widget readIcon = SvgIcon(iconName: 'read-icon');
const Widget readIconSolid = SvgIcon(iconName: 'read-icon-solid');
const Widget settingIcon = SvgIcon(iconName: 'setting-icon');
const Widget settingIconSolid = SvgIcon(iconName: 'setting-icon-solid');

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.iconName,
  });

  final String iconName;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$iconName',
    );
  }
}
