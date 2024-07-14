import 'dart:async';
import 'dart:io';

import 'package:equran/databases/database.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/ayah_list_tile.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:equran/widgets/juz_list_tile.dart';
import 'package:equran/widgets/surah_list_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:fuzzywuzzy/model/extracted_result.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class _SearchParams {
  const _SearchParams({
    required this.input,
    required this.data,
  });

  final String input;
  final List<dynamic> data;
}

List<ExtractedResult<dynamic>> _searchCompute(_SearchParams params) {
  final results = extractTop(
    query: params.input,
    choices: params.data,
    getter: (data) {
      if (data is Surah) {
        return data.latin;
      } else if (data is Juz) {
        return 'Juz ${data.id}';
      } else if (data is Ayah) {
        return data.latin;
      } else {
        return '';
      }
    },
    limit: 10,
  );

  return results;
}

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
  bool _isSearching = false;
  Timer? _debounce;
  final SpeechToText _speechToText = SpeechToText();
  String _textFromSpeech = '';
  double level = 0.0;

  @override
  void dispose() {
    _textController.dispose();
    _debounce?.cancel();
    _speechToText.cancel();
    super.dispose();
  }

  void _searchFromInput(String input) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      setState(() {
        _isSearching = true;
      });

      final results = await compute(
        _searchCompute,
        _SearchParams(input: input, data: widget.data),
      );

      setState(() {
        _searchResults = results;
        _isSearching = false;
      });
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

  Widget _buildFullList() {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 64),
      itemBuilder: (context, index) {
        final result = widget.data.elementAt(index);
        return _buildListTile(result);
      },
      itemCount: widget.data.length,
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 64),
      itemBuilder: (context, index) {
        final result = _searchResults.elementAt(index).choice;
        return _buildListTile(result);
      },
      itemCount: _searchResults.length,
    );
  }

  Widget _buildListTile(dynamic result) {
    if (result is Surah) {
      return SurahListTile(surah: result);
    } else if (result is Juz) {
      return JuzListTile(juz: result);
    } else if (result is Ayah) {
      return AyahListTile(ayah: result);
    } else {
      return const SizedBox.shrink();
    }
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
        actions: [
          IconButton.filled(
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
        ],
      ),
      body: Builder(
        builder: (context) {
          if (_isSearching) {
            return const Center(
              child: RepaintBoundary(child: CircularProgressIndicator()),
            );
          } else if (_textController.text.isEmpty) {
            return _buildFullList();
          } else {
            return _buildSearchResults();
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
        hintText: 'Cari Surah,Juz atau Ayat',
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
