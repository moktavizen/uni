import 'package:equran/models/ayah.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/ayah_list_tile.dart';
import 'package:equran/widgets/bismillah_card.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class JuzDetailScreen extends StatelessWidget {
  const JuzDetailScreen({
    super.key,
    required this.juzId,
    required this.juzNumAyah,
    required this.juzStartSurah,
    required this.juzStartAyah,
    required this.juzAyahs,
  });

  final int juzId;
  final int juzNumAyah;
  final String juzStartSurah;
  final int juzStartAyah;
  final List<Ayah> juzAyahs;

  void _pressLeading(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        titleText: "Juz $juzId",
        leadingIcon: backIcon,
        onPressLeading: () {
          _pressLeading(context);
        },
      ),
      body: BodyContent(
        juzId: juzId,
        juzNumAyah: juzNumAyah,
        juzStartSurah: juzStartSurah,
        juzStartAyah: juzStartAyah,
        juzAyahs: juzAyahs,
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
    required this.juzId,
    required this.juzNumAyah,
    required this.juzStartSurah,
    required this.juzStartAyah,
    required this.juzAyahs,
  });

  final int juzId;
  final int juzNumAyah;
  final String juzStartSurah;
  final int juzStartAyah;
  final List<Ayah> juzAyahs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: BismillahCard(
              title: "Juz $juzId • $juzNumAyah Ayat",
              subtitle: "Mulai Surah",
              caption: "${juzStartSurah.toUpperCase()} AYAT $juzStartAyah",
            ),
          )
        ],
        body: ListView.separated(
          itemBuilder: (context, index) {
            Ayah ayah = juzAyahs.elementAt(
              index + (juzId == 1 ? 1 : 0),
            );

            return AyahListTile(ayah: ayah);
          },
          separatorBuilder: (context, index) => Container(),
          itemCount: juzNumAyah + (juzId == 1 ? -1 : 0),
        ),
      ),
    );
  }
}
