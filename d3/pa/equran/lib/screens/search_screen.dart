import 'dart:io';

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
  double level = 0.0;

  @override
  void dispose() {
    _textController.dispose();
    _speechToText.cancel();
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

  Future<void> _initSpeech() async {
    await _speechToText.initialize();
  }

  void _startListening() async {
    await _initSpeech();
    await _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        if (result.finalResult == true) {
          level = 0.0;
          _textFromSpeech = result.recognizedWords;
          _textController.text = _textFromSpeech;
          _textController.selection = TextSelection.fromPosition(
            TextPosition(offset: _textController.text.length),
          );
          _searchFromInput(_textFromSpeech);
        }
      },
      onSoundLevelChange: _soundLevelListener,
      localeId: 'in_ID',
    );
  }

  void _soundLevelListener(double level) {
    setState(() {
      this.level = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (_textController.text.isEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 64),
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
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 64),
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
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: RepaintBoundary(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  spreadRadius: level * 2,
                  color: Theme.of(context).colorScheme.primaryFixedDim,
                )
              ],
            ),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () async {
                try {
                  final conn = await InternetAddress.lookup('example.com');
                  final bool isConn =
                      conn.isNotEmpty && conn[0].rawAddress.isNotEmpty;

                  if (isConn == true && context.mounted) {
                    ScaffoldMessenger.of(context).clearSnackBars();

                    _startListening();
                  }
                } on SocketException catch (_) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            Theme.of(context).colorScheme.errorContainer,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        showCloseIcon: true,
                        content: Text(
                          'Fitur ini butuh internet!',
                          style: GoogleFonts.inter(
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
                          ),
                        ),
                      ),
                    );
                  }
                }
              },
              tooltip: 'Voice Search',
              child: micIcon,
            ),
          ),
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
        color: Theme.of(context).colorScheme.onSurface,
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
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        hintText: 'Cari Surah atau Juz',
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      textInputAction: TextInputAction.search,
    );
  }
}
