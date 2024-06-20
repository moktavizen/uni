import 'package:equran/providers/database_provider.dart';
import 'package:equran/databases/database.dart' as d;
import 'package:equran/providers/settings_provider.dart';
import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  String _getArabicFontSizeLabel(int fontSize) {
    const fontSizeLabels = {
      20: 'Sedang',
      24: 'Besar',
      16: 'Kecil',
    };

    return fontSizeLabels[fontSize] ?? '';
  }

  String _getLatinFontSizeLabel(int fontSize) {
    const fontSizeLabels = {
      14: 'Sedang',
      18: 'Besar',
      10: 'Kecil',
    };

    return fontSizeLabels[fontSize] ?? '';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: setting.when(
        data: (value) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 24, color: listDecor),
            const _SettingsGroupTitle(titleText: 'Tampilan'),
            _SettingsListTile(
              leadingIcon: themeIcon,
              titleText: 'Tema',
              subtitleText: value.isDark != 1 ? "Terang" : "Gelap",
              onTap: () {},
            ),
            const Divider(height: 24, color: listDecor),
            const _SettingsGroupTitle(titleText: 'Huruf'),
            _SettingsListTile(
              leadingIcon: arabicIcon,
              titleText: 'Ukuran Arabic',
              subtitleText: _getArabicFontSizeLabel(value.arabicFontSize),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _RadioDialogArabicFont(value: value),
                );
              },
            ),
            _SettingsListTile(
              leadingIcon: latinIcon,
              titleText: 'Ukuran Latin',
              subtitleText: _getLatinFontSizeLabel(value.latinFontSize),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _RadioDialogLatinFont(value: value),
                );
              },
            ),
            const Divider(height: 24, color: listDecor),
            const _SettingsGroupTitle(titleText: 'Tentang'),
            _SettingsListTile(
              leadingIcon: sourceIcon,
              titleText: 'Sumber Data',
              subtitleText: 'KEMENAG',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    titlePadding: const EdgeInsets.all(20),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                    actionsPadding: const EdgeInsets.all(8),
                    backgroundColor: surface,
                    title: Text(
                      'Sumber Data',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: primary,
                      ),
                    ),
                    content: Text(
                      'Data Quran, Tafsir, dan Murattal pada aplikasi ini, didapatkan dari Website Quran resmi milik Kementerian Agama Republik Indonesia',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: onSurface,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: const Text('OK'),
                      )
                    ],
                  ),
                );
              },
            ),
            const Divider(height: 24, color: listDecor),
            const _AppVer()
          ],
        ),
        error: (e, s) {
          debugPrintStack(label: e.toString(), stackTrace: s);
          return Center(
            child: Text(
              textAlign: TextAlign.center,
              'Oops!\nTerdapat kesalahan\nmemproses data Surah!',
              style: GoogleFonts.inter(color: onSurface),
            ),
          );
        },
        loading: () => const Center(
          child: RepaintBoundary(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class _RadioDialogLatinFont extends ConsumerStatefulWidget {
  const _RadioDialogLatinFont({
    required this.value,
  });

  final d.Setting value;

  @override
  ConsumerState<_RadioDialogLatinFont> createState() =>
      _RadioDialogLatinFontState();
}

class _RadioDialogLatinFontState extends ConsumerState<_RadioDialogLatinFont> {
  late int _currentFontSize = widget.value.latinFontSize;

  void _setCurrentFontSize(int? value) {
    setState(() {
      _currentFontSize = value ?? 14;
    });
  }

  void _saveFontSize() {
    final database = ref.read(databaseProvider);

    database.setLatinFontSize(_currentFontSize);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.all(8),
      backgroundColor: surface,
      title: Text(
        'Ukuran Latin',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: primary,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: listDecor, height: 1),
          RadioListTile(
            title: Text(
              'Kecil',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: onSurface,
              ),
            ),
            value: 10,
            groupValue: _currentFontSize,
            onChanged: _setCurrentFontSize,
          ),
          RadioListTile(
            title: Text(
              'Sedang',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: onSurface,
              ),
            ),
            value: 14,
            groupValue: _currentFontSize,
            onChanged: _setCurrentFontSize,
          ),
          RadioListTile(
            title: Text(
              'Besar',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: onSurface,
              ),
            ),
            value: 18,
            groupValue: _currentFontSize,
            onChanged: _setCurrentFontSize,
          ),
          const Divider(color: listDecor, height: 1),
        ],
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            _saveFontSize();
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        )
      ],
    );
  }
}

class _RadioDialogArabicFont extends ConsumerStatefulWidget {
  const _RadioDialogArabicFont({
    required this.value,
  });

  final d.Setting value;

  @override
  ConsumerState<_RadioDialogArabicFont> createState() =>
      _RadioDialogArabicFontState();
}

class _RadioDialogArabicFontState
    extends ConsumerState<_RadioDialogArabicFont> {
  late int _currentFontSize = widget.value.arabicFontSize;

  void _setCurrentFontSize(int? value) {
    setState(() {
      _currentFontSize = value ?? 14;
    });
  }

  void _saveFontSize() {
    final database = ref.read(databaseProvider);

    database.setArabicFontSize(_currentFontSize);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.all(8),
      backgroundColor: surface,
      title: Text(
        'Ukuran Arabic',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: primary,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: listDecor, height: 1),
          RadioListTile(
            title: Text(
              'Kecil',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: onSurface,
              ),
            ),
            value: 16,
            groupValue: _currentFontSize,
            onChanged: _setCurrentFontSize,
          ),
          RadioListTile(
            title: Text(
              'Sedang',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: onSurface,
              ),
            ),
            value: 20,
            groupValue: _currentFontSize,
            onChanged: _setCurrentFontSize,
          ),
          RadioListTile(
            title: Text(
              'Besar',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: onSurface,
              ),
            ),
            value: 24,
            groupValue: _currentFontSize,
            onChanged: _setCurrentFontSize,
          ),
          const Divider(color: listDecor, height: 1),
        ],
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            _saveFontSize();
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        )
      ],
    );
  }
}

class _AppVer extends StatelessWidget {
  const _AppVer();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'EQuran - v0.0.1\n'
          'Final Project for University',
          textAlign: TextAlign.center,
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
        style: GoogleFonts.inter(
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
    required this.onTap,
  });

  final Widget leadingIcon;
  final String titleText;
  final String subtitleText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              height: 36,
              child: Align(
                alignment: Alignment.topLeft,
                child: leadingIcon,
              ),
            ),
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
            rightChevronIcon,
          ],
        ),
      ),
    );
  }
}
