import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarNumBadge extends StatelessWidget {
  const StarNumBadge({
    super.key,
    required this.num,
  });

  final int num;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        surahNumber,
        SizedBox(
          width: 36,
          height: 36,
          child: Center(
            child: Text(
              '$num',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: onSurface,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
