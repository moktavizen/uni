import 'package:equran/models/juz.dart';
import 'package:equran/screens/ayah_list_screen.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/surah_juz_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class JuzTab extends StatelessWidget {
  const JuzTab({
    super.key,
    required this.juzList,
  });

  final AsyncValue<List<Juz>> juzList;

  void _goToAyahListScreen(BuildContext context, Juz juz) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AyahListScreen(
          title: 'Juz ${juz.id} • ${juz.numAyah} Ayat',
          subtitle: 'Mulai Surah',
          caption: '${juz.startSurah.toUpperCase()} AYAT ${juz.startAyah}',
          ayahList: juz.ayahList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (juzList) {
      AsyncData(:final value) => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) {
            Juz juz = value.elementAt(index);

            return SurahJuzListTile(
              leadingNum: juz.id,
              titleText: 'Juz ${juz.id} - ${juz.numAyah} Ayat',
              subtitleText:
                  'MULAI • ${juz.startSurah.toUpperCase()} AYAT ${juz.startAyah}',
              onTap: () {
                _goToAyahListScreen(context, juz);
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
              'Oops!\nTerdapat kesalahan\nsaat memproses data Juz!',
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
