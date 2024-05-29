import 'package:equran/databases/database.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/surah_juz_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class JuzTab extends StatelessWidget {
  const JuzTab({
    super.key,
    required this.juzList,
  });

  final AsyncValue<List<Juz>> juzList;

  @override
  Widget build(BuildContext context) {
    return switch (juzList) {
      AsyncData(:final value) => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) {
            Juz juz = value.elementAt(index);

            return SurahJuzListTile(
              leadingNum: juz.id,
              titleText: 'Juz ${juz.id} - ${juz.ayahCount} Ayat',
              subtitleText:
                  'MULAI • ${juz.surahStart.toUpperCase()} AYAT ${juz.ayahStart}',
              onTap: () {
                return context.goNamed(
                  'juz',
                  pathParameters: {
                    'juz-id': (juz.id).toString(),
                  },
                  extra: juz,
                );
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
