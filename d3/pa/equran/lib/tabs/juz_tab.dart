import 'package:equran/models/juz.dart';
import 'package:equran/providers/juzs_provider.dart';
import 'package:equran/screens/juz_detail_screen.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/surah_juz_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JuzTab extends ConsumerWidget {
  const JuzTab({super.key});

  void _goToJuzDetail(BuildContext context, Juz juz) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JuzDetailScreen(
          juzId: juz.id,
          juzNumAyah: juz.numAyah,
          juzStartSurah: juz.startSurah,
          juzStartAyah: juz.startAyah,
          juzAyahs: juz.ayahList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juzList = ref.watch(juzsProvider);

    return switch (juzList) {
      AsyncData(:final value) => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) {
            Juz juz = value.elementAt(index);

            return SurahJuzListTile(
              leadingNum: juz.id,
              titleText: 'Juz ${juz.id}',
              subtitleText:
                  'MULAI • ${juz.startSurah.toUpperCase()} AYAT ${juz.startAyah}',
              onTap: () {
                _goToJuzDetail(context, juz);
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
