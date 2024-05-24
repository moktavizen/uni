import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahJuzListTile extends StatelessWidget {
  const SurahJuzListTile({
    super.key,
    required this.leadingNum,
    required this.titleText,
    required this.subtitleText,
    this.trailingText,
    required this.onTap,
  });

  final int leadingNum;
  final String titleText;
  final String subtitleText;
  final String? trailingText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        horizontalTitleGap: 16,
        minVerticalPadding: 16,
        leading: Stack(
          children: [
            surahNumber,
            SizedBox(
              width: 36,
              height: 36,
              child: Center(
                child: Text(
                  '$leadingNum',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          titleText,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: onSurface,
          ),
        ),
        subtitle: Text(
          subtitleText,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: onSurfaceVar,
          ),
        ),
        trailing: trailingText == null
            ? null
            : Text(
                trailingText!,
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
