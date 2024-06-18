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
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

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
  final TextEditingController _textController = TextEditingController();
  List<ExtractedResult<dynamic>> _searchResults = [];
  final SpeechToText _speechToText = SpeechToText();
  String _textFromSpeech = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _searchFromInput(String input) {
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
      _searchResults = results;
    });
  }

  void _initSpeech() async {
    await _speechToText.initialize();
  }

  void _startListening() async {
    await _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        _textFromSpeech = result.recognizedWords;
        _searchFromInput(_textFromSpeech);
        _textController.text += _textFromSpeech;
        _textController.selection = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length),
        );
      },
      localeId: 'in_ID',
    );
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
          onChanged: _searchFromInput,
          textController: _textController,
        ),
        action: IconButton.filled(
          onPressed: () {
            _textController.clear();
            _searchFromInput('');
          },
          icon: const Icon(Icons.close, color: onSurfaceVar),
          style: IconButton.styleFrom(backgroundColor: surahBar),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (_textController.text.isEmpty) {
            return ListView.builder(
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
            );
          } else if (_textController.text.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) {
                final result = _searchResults.elementAt(index).choice;
                if (result is Surah) {
                  return SurahListTile(surah: result);
                } else if (result is Juz) {
                  return JuzListTile(juz: result);
                } else {
                  return null;
                }
              },
              itemCount: _searchResults.length,
            );
          }
          // else if (_isListening == true) {
          //   return const Column(
          //     children: [
          //       Center(child: Text('Now Listening')),
          //     ],
          //   );
          // }
          else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          onPressed: _startListening,
          tooltip: 'Voice Search',
          child: micIcon,
        ),
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
      controller: textController,
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
    );
  }
}
