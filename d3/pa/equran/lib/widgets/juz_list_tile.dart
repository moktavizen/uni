import 'package:equran/databases/database.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/hizb_border.dart';
import 'package:equran/widgets/tab_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class JuzListTile extends StatelessWidget {
  const JuzListTile({
    super.key,
    required this.juz,
  });

  final Juz juz;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: systemUiBackground,
      onTap: () {
        context.pushNamed(
          'juz',
          pathParameters: {'juzId': juz.id.toString()},
          extra: juz,
        );
      },
      child: TabListTile(
        leading: HizbBorder(
          child: Text(
            '${juz.id}',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: onSurface,
            ),
          ),
        ),
        title: Text(
          'Juz ${juz.id} - ${juz.ayahCount} Ayat',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: onSurface,
          ),
        ),
        subtitle: Text(
          'MULAI • ${juz.surahStart.toUpperCase()} AYAT ${juz.ayahStart}',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: onSurfaceVar,
          ),
        ),
      ),
    );
  }
}
