import 'package:equran/databases/database.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:equran/widgets/juz_list_tile.dart';
import 'package:equran/widgets/surah_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:fuzzywuzzy/model/extracted_result.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.data,
  });

  final List<dynamic> data;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController textController = TextEditingController();
  List<ExtractedResult<dynamic>> searchResults = [];

  void searchFromInput(String input) {
    final results = extractTop(
      query: input,
      choices: widget.data,
      getter: (data) {
        if (data is Surah) {
          return data.latin;
        } else if (data is Juz) {
          return 'Juz ${data.id}';
        } else {
          return '';
        }
      },
      limit: 10,
    );

    setState(() {
      searchResults = results;
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
        title: _TextField(
          onChanged: searchFromInput,
          textController: textController,
        ),
        action: IconButton.filled(
          onPressed: () {},
          icon: micIcon,
          style: IconButton.styleFrom(backgroundColor: surahBar),
        ),
      ),
      body: textController.text.isEmpty
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final result = widget.data.elementAt(index);
                if (result is Surah) {
                  return SurahListTile(surah: result);
                } else if (result is Juz) {
                  return JuzListTile(juz: result);
                } else {
                  return null;
                }
              },
              itemCount: widget.data.length,
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final result = searchResults.elementAt(index).choice;

                if (result is Surah) {
                  return SurahListTile(surah: result);
                } else if (result is Juz) {
                  return JuzListTile(juz: result);
                } else {
                  return null;
                }
              },
              itemCount: searchResults.length,
            ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    required this.onChanged,
    required this.textController,
  });

  final void Function(String) onChanged;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
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
        hintText: 'Cari Surah atau Juz',
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: onSurfaceVar,
        ),
      ),
      textInputAction: TextInputAction.search,
      controller: textController,
    );
  }
}
