import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(height: 24, color: listDecor),
                const _SettingsGroupTitle(titleText: 'Tampilan'),
                const _SettingsListTile(
                  leadingIcon: themeIcon,
                  titleText: 'Tema',
                  subtitleText: 'Terang',
                ),
                const _SettingsListTile(
                  leadingIcon: langIcon,
                  titleText: 'Bahasa',
                  subtitleText: 'Indonesia',
                ),
                Divider(height: 24, color: listDecor),
                const _SettingsGroupTitle(titleText: 'Font'),
                const _SettingsListTile(
                  leadingIcon: arabicIcon,
                  titleText: 'Ukuran Arabic',
                  subtitleText: '18 px',
                ),
                const _SettingsListTile(
                  leadingIcon: latinIcon,
                  titleText: 'Ukuran Latin',
                  subtitleText: '16 px',
                ),
                Divider(height: 24, color: listDecor),
                const _SettingsGroupTitle(titleText: 'Tafsir'),
                const _SettingsListTile(
                  leadingIcon: sourceIcon,
                  titleText: 'Sumber Tafsir',
                  subtitleText: 'KEMENAG',
                ),
                Divider(height: 24, color: listDecor),
                const _AppVer()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AppVer extends StatelessWidget {
  const _AppVer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 64),
          Text(
            'Final Project for University',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: onSurfaceVar,
            ),
          ),
          Text(
            'EQuran - v0.0.1',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: onSurfaceVar,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsGroupTitle extends StatelessWidget {
  const _SettingsGroupTitle({
    required this.titleText,
  });

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        titleText,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: primary,
        ),
      ),
    );
  }
}

class _SettingsListTile extends StatelessWidget {
  const _SettingsListTile({
    required this.leadingIcon,
    required this.titleText,
    required this.subtitleText,
  });

  final Widget leadingIcon;
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
            Column(
              children: [
                leadingIcon,
                const SizedBox(height: 16),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitleText,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: onSurfaceVar,
                  ),
                ),
              ],
            ),
            const Spacer(),
            rightChevronIcon,
          ],
        ),
      ),
    );
  }
}
