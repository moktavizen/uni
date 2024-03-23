import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color surface = Color(0xFFFFFFFF);
const Color onSurface = Color(0xFF240F4F);
const Color onSurfaceVar = Color(0xFF8789A3);
const Color primary = Color(0xFF672CBC);
const Color secondary = Color(0xFF994EF8);
const Color lastReadGrad1 = Color(0xFFDF98FA);
const Color lastReadGrad2 = Color(0xFF9055FF);
const Color listDecor = Color(0xFFBBC4CE);

const SvgAsset menuIcon = SvgAsset(name: 'menu-icon');
const SvgAsset searchIcon = SvgAsset(name: 'search-icon');
const SvgAsset favoriteIcon = SvgAsset(name: 'favorite-icon');
const SvgAsset favoriteIconSolid = SvgAsset(name: 'favorite-icon-solid');
const SvgAsset readIcon = SvgAsset(name: 'read-icon');
const SvgAsset readIconSolid = SvgAsset(name: 'read-icon-solid');
const SvgAsset settingIcon = SvgAsset(name: 'setting-icon');
const SvgAsset settingIconSolid = SvgAsset(name: 'setting-icon-solid');
const SvgAsset quranBg = SvgAsset(name: 'quran-bg');
const SvgAsset lastRead = SvgAsset(name: 'last-read-icon');
const SvgAsset surahNumber = SvgAsset(name: 'surah-number');

class SvgAsset extends StatelessWidget {
  const SvgAsset({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$name.svg',
    );
  }
}