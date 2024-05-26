import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

final AudioPlayer player = AudioPlayer();

const Color surface = Color(0xffffffff);
const Color onSurface = Color(0xff240f4f);
const Color onSurfaceVar = Color(0xff8789a3);
const Color primary = Color(0xff672cbc);
const Color secondary = Color(0xff863ed5);
const Color lastReadGrad1 = Color(0xffdf98fa);
const Color lastReadGrad2 = Color(0xff9055ff);
final Color listDecor = const Color(0xffbbc4ce).withOpacity(0.35);
final Color surahBar = const Color(0xff121931).withOpacity(0.05);
const Color systemUiDivider = Color(0xffe0e0e0);
const Color systemUiBackground = Colors.transparent;

const SvgAsset menuIcon = SvgAsset(name: 'menu-icon');
const SvgAsset backIcon = SvgAsset(name: 'back-icon');
const SvgAsset closeIcon = SvgAsset(name: 'close-icon');
const SvgAsset searchIcon = SvgAsset(name: 'search-icon');
const SvgAsset favoriteIcon = SvgAsset(name: 'favorite-icon');
const SvgAsset favoriteIconSolid = SvgAsset(name: 'favorite-icon-solid');
const SvgAsset readIcon = SvgAsset(name: 'read-icon');
const SvgAsset readIconSolid = SvgAsset(name: 'read-icon-solid');
const SvgAsset settingIcon = SvgAsset(name: 'setting-icon');
const SvgAsset settingIconSolid = SvgAsset(name: 'setting-icon-solid');
const SvgAsset lastRead = SvgAsset(name: 'last-read-icon');
const SvgAsset shareIcon = SvgAsset(name: 'share-icon');
const SvgAsset playIcon = SvgAsset(name: 'play-icon');
const SvgAsset pauseIcon = SvgAsset(name: 'pause-icon');
const SvgAsset tafsirIcon = SvgAsset(name: 'tafsir-icon');
const SvgAsset bookmarkIcon = SvgAsset(name: 'bookmark-icon');
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
