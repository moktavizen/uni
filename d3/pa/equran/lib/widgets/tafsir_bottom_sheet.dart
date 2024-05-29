import 'package:equran/databases/database.dart';
import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class TafsirBottomSheet extends StatelessWidget {
  const TafsirBottomSheet({
    super.key,
    required this.ayah,
  });

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 84,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: surface,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Tafsir ${ayah.surahName} Ayat ${ayah.ayahNum}',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: primary,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () async {
                    await Share.share(
                      'Tafsir ${ayah.surahName} Ayat ${ayah.ayahNum}:\n'
                      '\n'
                      '${ayah.tafsir}[${ayah.surahId}:${ayah.ayahNum}]',
                    );
                  },
                  icon: shareIcon,
                  padding: const EdgeInsets.all(0),
                  visualDensity: VisualDensity.compact,
                ),
                IconButton.filledTonal(
                  onPressed: () => Navigator.pop(context),
                  icon: closeIcon,
                  padding: const EdgeInsets.all(0),
                  visualDensity: VisualDensity.compact,
                )
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  ayah.tafsir,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
