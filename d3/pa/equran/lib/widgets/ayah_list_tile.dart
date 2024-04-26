import 'package:equran/models/ayah.dart';
import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AyahListTile extends StatelessWidget {
  const AyahListTile({
    super.key,
    required this.ayah,
  });

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 18),
        Text(
          ayah.arabic,
          textAlign: TextAlign.right,
          style: GoogleFonts.amiri(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          ayah.translation,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 16),
        AyahBar(
          ayahNum: ayah.ayah,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class AyahBar extends StatelessWidget {
  const AyahBar({super.key, required this.ayahNum});

  final int ayahNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: surahBar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              color: secondary,
              borderRadius: BorderRadius.circular(13.5),
            ),
            child: Center(
              child: Text(
                "$ayahNum",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: surface,
                ),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: shareIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: playIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: tafsirIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: bookmarkIcon,
          ),
        ],
      ),
    );
  }
}
