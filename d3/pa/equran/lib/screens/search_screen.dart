import 'package:equran/databases/database.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:equran/widgets/hizb_border.dart';
import 'package:equran/widgets/tab_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.allSurah,
  });

  final List<Surah> allSurah;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';
  late List<Surah> surahs = widget.allSurah;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        if (_text != _controller.text && _controller.text.isNotEmpty) {
          _text = _controller.text;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void searchFromInput(String input) {
    final normalizedInput = input.toLowerCase().replaceAll(RegExp('[- ]'), '');

    final results = widget.allSurah.where((surah) {
      final normalizedLatin =
          surah.latin.toLowerCase().replaceAll(RegExp('[- ]'), '');

      return normalizedLatin.contains(normalizedInput);
    }).toList();

    setState(() {
      surahs = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: backIcon,
        ),
        title: TextField(
          onChanged: searchFromInput,
          autofocus: true,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: onSurface,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: surahBar,
            hintText: 'Cari Surah.. ',
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: onSurfaceVar,
            ),
          ),
          textInputAction: TextInputAction.search,
          controller: _controller,
        ),
        action: IconButton.filled(
          onPressed: () {},
          icon: micIcon,
          style: IconButton.styleFrom(backgroundColor: surahBar),
        ),
      ),
      body: _text.isEmpty
          ? Center(
              child: Text(
                textAlign: TextAlign.center,
                'Ketik atau gunakan suara\nuntuk melakukan pencarian',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: onSurface,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Surah surah = surahs.elementAt(index);
                  return InkWell(
                    splashColor: systemUiBackground,
                    onTap: () {
                      context.goNamed(
                        'surah',
                        pathParameters: {'surahId': surah.id.toString()},
                        extra: surah,
                      );
                    },
                    child: TabListTile(
                      leading: HizbBorder(
                        child: Text(
                          '${surah.id}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: onSurface,
                          ),
                        ),
                      ),
                      title: Text(
                        surah.latin,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: onSurface,
                        ),
                      ),
                      subtitle: Text(
                        '${surah.location.toUpperCase()} • ${surah.ayahCount} AYAT',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: onSurfaceVar,
                        ),
                      ),
                      trailing: Text(
                        surah.arabic,
                        style: const TextStyle(
                          fontFamily: 'IsepMisbah',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: primary,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: surahs.length,
              ),
            ),
    );
  }
}
