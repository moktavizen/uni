import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BismillahCard extends StatelessWidget {
  const BismillahCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.caption,
  });

  final String title;
  final String subtitle;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Stack(
          children: [
            Container(
              height: 257,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [lastReadGrad1, lastReadGrad2],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Opacity(
                opacity: 0.1,
                child: quranBgSurah,
              ),
            ),
            SizedBox(
              height: 257,
              child: Center(
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          color: surface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: surface,
                        ),
                      ),
                      Divider(
                        indent: 64,
                        endIndent: 64,
                        thickness: 2,
                        height: 32,
                        color: surface.withOpacity(0.35),
                      ),
                      Text(
                        caption,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: surface,
                        ),
                      ),
                      const SizedBox(height: 24),
                      bismillah
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
