import 'package:equran/databases/database.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/hizb_border.dart';
import 'package:equran/widgets/tab_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahListTile extends StatelessWidget {
  const SurahListTile({
    super.key,
    required this.surah,
  });

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: systemUiBackground,
      onTap: () {
        context.pushNamed(
          'surah',
          pathParameters: {'surahId': surah.id.toString()},
          extra: surah,
        );
      },
      child: TabListTile(
        leading: HizbBorder(
          child: Text(
            '${surah.id}',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: onSurface,
            ),
          ),
        ),
        title: Text(
          surah.latin,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: onSurface,
          ),
        ),
        subtitle: Text(
          '${surah.location.toUpperCase()} • ${surah.ayahCount} AYAT',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: onSurfaceVar,
          ),
        ),
        trailing: Text(
          surah.arabic,
          style: const TextStyle(
            fontFamily: 'IsepMisbah',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: primary,
          ),
        ),
      ),
    );
  }
}
