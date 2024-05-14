import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: surface,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Column(
          children: [
            _AddCollection(),
            SizedBox(height: 32),
            _FavoriteListTile(
              titleText: 'My Favorite',
              subtitleText: '8 Ayah',
            ),
            _FavoriteListTile(
              titleText: 'Daily',
              subtitleText: '5 Ayah',
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteListTile extends StatelessWidget {
  const _FavoriteListTile({
    required this.titleText,
    required this.subtitleText,
  });

  final String titleText;
  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            const Column(
              children: [
                folderIcon,
                SizedBox(height: 16),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitleText,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: onSurfaceVar,
                  ),
                ),
              ],
            ),
            const Spacer(),
            moreIcon,
          ],
        ),
      ),
    );
  }
}

class _AddCollection extends StatelessWidget {
  const _AddCollection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        addFolderIcon,
        const SizedBox(width: 8),
        Text(
          'Tambah Koleksi',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: primary,
          ),
        ),
        const Spacer(),
        moreBarIcon,
      ],
    );
  }
}
