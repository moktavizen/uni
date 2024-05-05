import 'package:equran/models/surah.dart';
import 'package:equran/screens/surah_detail_screen.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/surah_juz_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({
    super.key,
    required this.surahList,
  });

  final AsyncValue<List<Surah>> surahList;

  void _goToSurahDetail(BuildContext context, Surah surah) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SurahDetailScreen(
          surahName: surah.transliteration,
          surahTranslation: surah.translation,
          surahLocation: surah.location,
          surahNumAyah: surah.numAyah,
          surahAyahs: surah.ayahList,
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
                _goToSurahDetail(context, surah);
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
      AsyncError() => const Center(
          child: SizedBox(
            child: Text('Oops! Terdapat kesalahan saat mengambil data Surah!'),
          ),
        ),
      _ => const Center(
          child: SizedBox(
            child: CircularProgressIndicator(),
          ),
        ),
    };
  }
}
