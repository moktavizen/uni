import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Color surface = Color(0xffffffff);
const Color onSurface = Color(0xff240f4f);
const Color onSurfaceVar = Color(0xff8789a3);
const Color primary = Color(0xff672cbc);
const Color secondary = Color(0xff863ed5);
const Color lastReadGrad1 = Color(0xffdf98fa);
const Color lastReadGrad2 = Color(0xff9055ff);
const Color listDecor = Color(0xffe7eaee);
const Color surahBar = Color(0xfff3f3f5);
const Color systemUiDivider = Color(0xffe0e0e0);
const Color systemUiBackground = Colors.transparent;
const Color error = Color(0xFFBA1A1A);

const SvgAsset menuIcon = SvgAsset(name: 'menu-icon');
const SvgAsset backIcon = SvgAsset(name: 'back-icon');
const SvgAsset closeIcon = SvgAsset(name: 'close-icon');
const SvgAsset searchIcon = SvgAsset(name: 'search-icon');
const SvgAsset micIcon = SvgAsset(name: 'mic-icon');
const SvgAsset favoriteScreenIcon = SvgAsset(name: 'favorite-screen-icon');
const SvgAsset favoriteScreenIconSolid =
    SvgAsset(name: 'favorite-screen-icon-solid');
const SvgAsset readScreenIcon = SvgAsset(name: 'read-screen-icon');
const SvgAsset readScreenIconSolid = SvgAsset(name: 'read-screen-icon-solid');
const SvgAsset settingScreenIcon = SvgAsset(name: 'setting-screen-icon');
const SvgAsset settingScreenIconSolid =
    SvgAsset(name: 'setting-screen-icon-solid');
const SvgAsset lastReadIcon = SvgAsset(name: 'last-read-icon');
const SvgAsset shareIcon = SvgAsset(name: 'share-icon');
const SvgAsset playIcon = SvgAsset(name: 'play-icon');
const SvgAsset pauseIcon = SvgAsset(name: 'pause-icon');
const SvgAsset tafsirIcon = SvgAsset(name: 'tafsir-icon');
const SvgAsset favoriteIcon = SvgAsset(name: 'favorite-icon');
const SvgAsset favoriteIconSolid = SvgAsset(name: 'favorite-icon-solid');
const SvgAsset themeIcon = SvgAsset(name: 'theme-icon');
const SvgAsset langIcon = SvgAsset(name: 'lang-icon');
const SvgAsset arabicIcon = SvgAsset(name: 'arabic-icon');
const SvgAsset latinIcon = SvgAsset(name: 'latin-icon');
const SvgAsset sourceIcon = SvgAsset(name: 'source-icon');
const SvgAsset rightChevronIcon = SvgAsset(name: 'right-chevron-icon');
const SvgAsset addFolderIcon = SvgAsset(name: 'add-folder-icon');
const SvgAsset folderIcon = SvgAsset(name: 'folder-icon');
const SvgAsset moreIcon = SvgAsset(name: 'more-icon');
const SvgAsset moreBarIcon = SvgAsset(name: 'more-bar-icon');
const SvgAsset surahNumber = SvgAsset(name: 'surah-number');
const SvgAsset quranBgHome = SvgAsset(name: 'quran-bg');
const SvgAsset bismillah = SvgAsset(name: 'bismillah');
final quranBgSurah = SvgPicture.asset(
  'assets/svg/quran-bg.svg',
  width: 269,
);

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
