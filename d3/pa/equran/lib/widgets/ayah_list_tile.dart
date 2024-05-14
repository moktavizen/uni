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
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 16),
        AyahBar(
          ayah: ayah,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class AyahBar extends StatelessWidget {
  const AyahBar({super.key, required this.ayah});

  final Ayah ayah;

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
          _AyahNum(ayah: ayah),
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
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return _BottomSheetContent(ayah: ayah);
                },
              );
            },
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

class _AyahNum extends StatelessWidget {
  const _AyahNum({
    required this.ayah,
  });

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27,
      height: 27,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(13.5),
      ),
      child: Center(
        child: Text(
          "${ayah.ayahNum}",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: surface,
          ),
        ),
      ),
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  const _BottomSheetContent({
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
