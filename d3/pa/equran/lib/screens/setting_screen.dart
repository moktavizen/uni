import 'package:equran/providers/database_provider.dart';
import 'package:equran/databases/database.dart' as d;
import 'package:equran/providers/settings_provider.dart';
import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  String _getTheme(int themeVal) {
    const themeLabels = {
      0: 'Terang',
      1: 'Gelap',
      2: 'Sistem',
    };

    return themeLabels[themeVal] ?? '';
  }

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

  // String _getSpeedLabel(int speed) {
  //   const speedLabel = {
  //     0: 'Nonaktif',
  //     25: 'Lambat',
  //     50: 'Cepat',
  //     75: 'Cepat',
  //     100: 'Sangat Cepat',
  //   };
  //
  //   return speedLabel[speed] ?? '';
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 24),
          const _SettingsGroupTitle(titleText: 'Tampilan'),
          _SettingsListTile(
            leadingIcon: themeIcon,
            titleText: 'Tema Aplikasi',
            subtitleText: _getTheme(setting.value!.isDark),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    _RadioDialogTheme(value: setting.value!),
              );
            },
          ),
          const Divider(height: 24),
          const _SettingsGroupTitle(titleText: 'Baca'),
          _SettingsListTile(
            leadingIcon: arabicIcon,
            titleText: 'Ukuran Arabic',
            subtitleText:
                _getArabicFontSizeLabel(setting.value!.arabicFontSize),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    _RadioDialogArabicFont(value: setting.value!),
              );
            },
          ),
          _SettingsListTile(
            leadingIcon: latinIcon,
            titleText: 'Ukuran Latin',
            subtitleText: _getLatinFontSizeLabel(setting.value!.latinFontSize),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    _RadioDialogLatinFont(value: setting.value!),
              );
            },
          ),
          // _SettingsListTile(
          //   leadingIcon: Icon(
          //     Icons.swipe_down_rounded,
          //     color: Theme.of(context).colorScheme.secondary,
          //   ),
          //   titleText: 'Kecepatan Auto Scroll',
          //   subtitleText: _getSpeedLabel(setting.value!.autoScrollSpeed),
          //   onTap: () {
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) =>
          //           _RadioDialogLatinFont(value: setting.value!),
          //     );
          //   },
          // ),
          const Divider(height: 24),
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
                  contentPadding: const EdgeInsets.all(0),
                  actionsPadding: const EdgeInsets.all(8),
                  title: Text(
                    'Sumber Data',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(height: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Text(
                          'Data Quran, Tafsir, dan Murattal pada aplikasi ini, didapatkan dari Website Quran resmi milik Kementerian Agama Republik Indonesia',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                    ],
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
          const Divider(height: 24),
          const _AppVer()
        ],
      ),
    );
  }
}

class _RadioDialogTheme extends ConsumerStatefulWidget {
  const _RadioDialogTheme({
    required this.value,
  });

  final d.Setting value;

  @override
  ConsumerState<_RadioDialogTheme> createState() => _RadioDialogThemeState();
}

class _RadioDialogThemeState extends ConsumerState<_RadioDialogTheme> {
  late int _currentTheme = widget.value.isDark;

  void _setCurrentTheme(int? value) {
    setState(() {
      _currentTheme = value ?? 0;
    });
  }

  void _saveCurrentTheme() {
    final database = ref.read(databaseProvider);

    database.setTheme(_currentTheme);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(20),
      contentPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.all(8),
      title: Text(
        'Tema Aplikasi',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1),
          RadioListTile(
            title: Text(
              'Sistem',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            value: 2,
            groupValue: _currentTheme,
            onChanged: _setCurrentTheme,
          ),
          RadioListTile(
            title: Text(
              'Terang',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            value: 0,
            groupValue: _currentTheme,
            onChanged: _setCurrentTheme,
          ),
          RadioListTile(
            title: Text(
              'Gelap',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            value: 1,
            groupValue: _currentTheme,
            onChanged: _setCurrentTheme,
          ),
          const Divider(height: 1),
        ],
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            _saveCurrentTheme();
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        )
      ],
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
      title: Text(
        'Ukuran Latin',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1),
          RadioListTile(
            title: Text(
              'Kecil',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
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
                color: Theme.of(context).colorScheme.onSurface,
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
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            value: 18,
            groupValue: _currentFontSize,
            onChanged: _setCurrentFontSize,
          ),
          const Divider(height: 1),
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
      title: Text(
        'Ukuran Arabic',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1),
          RadioListTile(
            title: Text(
              'Kecil',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface,
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
                color: Theme.of(context).colorScheme.onSurface,
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
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            value: 24,
            groupValue: _currentFontSize,
            onChanged: _setCurrentFontSize,
          ),
          const Divider(height: 1),
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
            color: Theme.of(context).colorScheme.onSurfaceVariant,
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
          color: Theme.of(context).colorScheme.primary,
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
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitleText,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
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
