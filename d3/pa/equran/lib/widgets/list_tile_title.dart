import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTileTitle extends StatelessWidget {
  const ListTileTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: onSurface,
      ),
    );
  }
}
