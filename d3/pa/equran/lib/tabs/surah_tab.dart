import 'package:equran/models/surah.dart';
import 'package:equran/screens/ayah_list_screen.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/surah_juz_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({
    super.key,
    required this.surahList,
  });

  final AsyncValue<List<Surah>> surahList;

  void _goToAyahListScreen(BuildContext context, Surah surah) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AyahListScreen(
          title: surah.transliteration,
          subtitle: surah.translation,
          caption: '${surah.location.toUpperCase()} • ${surah.numAyah} AYAT',
          ayahList: surah.ayahList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (surahList) {
      AsyncData(:final value) => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) {
            Surah surah = value.elementAt(index);

            return SurahJuzListTile(
              leadingNum: surah.id,
              titleText: surah.transliteration,
              subtitleText:
                  '${surah.location.toUpperCase()} • ${surah.numAyah} AYAT',
              trailingText: surah.arabic,
              onTap: () {
                _goToAyahListScreen(context, surah);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1,
              color: listDecor,
            );
          },
          itemCount: value.length,
        ),
      AsyncError() => Center(
          child: SizedBox(
            child: Text(
              textAlign: TextAlign.center,
              'Oops!\nTerdapat kesalahan\nsaat memproses data Surah!',
              style: GoogleFonts.inter(color: onSurface),
            ),
          ),
        ),
      _ => const Center(
          child: SizedBox(
            child: RepaintBoundary(child: CircularProgressIndicator()),
          ),
        ),
    };
  }
}
