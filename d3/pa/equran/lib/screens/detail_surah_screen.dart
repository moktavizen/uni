import 'package:flutter/material.dart';

class DetailSurahScreen extends StatelessWidget {
  const DetailSurahScreen({super.key, required this.surahNum});

  final int surahNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Surah ke-$surahNum'),
      ),
    );
  }
}
