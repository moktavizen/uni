import 'package:equran/models/ayah.dart';
import 'package:equran/widgets/ayah_list_tile.dart';
import 'package:equran/widgets/bismillah_card.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SurahDetailScreen extends StatelessWidget {
  const SurahDetailScreen({
    super.key,
    required this.surahName,
    required this.surahTranslation,
    required this.surahLocation,
    required this.surahNumAyah,
    required this.surahAyahs,
  });

  final String surahName;
  final String surahTranslation;
  final String surahLocation;
  final int surahNumAyah;
  final List<Ayah> surahAyahs;

  void _pressLeading(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        titleText: surahName,
        leadingIcon: backIcon,
        onPressLeading: () {
          _pressLeading(context);
        },
      ),
      body: BodyContent(
          surahName: surahName,
          surahTranslation: surahTranslation,
          surahLocation: surahLocation,
          surahNumAyah: surahNumAyah,
          surahAyahs: surahAyahs),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
    required this.surahName,
    required this.surahTranslation,
    required this.surahLocation,
    required this.surahNumAyah,
    required this.surahAyahs,
  });

  final String surahName;
  final String surahTranslation;
  final String surahLocation;
  final int surahNumAyah;
  final List<Ayah> surahAyahs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: BismillahCard(
              title: surahName,
              subtitle: surahTranslation,
              caption: "${surahLocation.toUpperCase()} • $surahNumAyah AYAT",
            ),
          )
        ],
        body: ListView.separated(
          itemBuilder: (context, index) {
            Ayah ayah = surahAyahs.elementAt(
              index + (surahName == "Al-Fatihah" ? 1 : 0),
            );

            return AyahListTile(ayah: ayah);
          },
          separatorBuilder: (context, index) => Container(),
          itemCount: surahNumAyah + (surahName == "Al-Fatihah" ? -1 : 0),
        ),
      ),
    );
  }
}
