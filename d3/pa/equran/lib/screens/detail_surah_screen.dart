import 'package:equran/models/surah.dart';
import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailSurahScreen extends StatelessWidget {
  const DetailSurahScreen({
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
    return Scaffold(
      backgroundColor: surface,
      appBar: AppBarContent(
        title: surahName,
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
            child: SurahGreeter(
              greeterName: surahName,
              greeterTranslation: surahTranslation,
              greeterLocation: surahLocation,
              greeterNumAyah: surahNumAyah,
            ),
          )
        ],
        body: ListView.separated(
          itemBuilder: (context, index) {
            Ayah ayah = surahAyahs.elementAt(
              index + (surahName == "Al-Fatihah" ? 1 : 0),
            );

            return ListTileContent(ayah: ayah);
          },
          separatorBuilder: (context, index) => Container(),
          itemCount: surahNumAyah + (surahName == "Al-Fatihah" ? -1 : 0),
        ),
      ),
    );
  }
}

class ListTileContent extends StatelessWidget {
  const ListTileContent({
    super.key,
    required this.ayah,
  });

  final Ayah ayah;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          ayah.arabic,
          textAlign: TextAlign.right,
          style: GoogleFonts.amiri(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          ayah.translation,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 16),
        AyahBar(
          ayahNum: ayah.id,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class AyahBar extends StatelessWidget {
  const AyahBar({super.key, required this.ayahNum});

  final int ayahNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: surahBar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              color: secondary,
              borderRadius: BorderRadius.circular(13.5),
            ),
            child: Center(
              child: Text(
                "$ayahNum",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: surface,
                ),
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: shareIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: playIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: tafsirIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: bookmarkIcon,
          ),
        ],
      ),
    );
  }
}

class AppBarContent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarContent({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        backgroundColor: surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: backIcon,
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: searchIcon,
          ),
        ],
      ),
    );
  }
}

class SurahGreeter extends StatelessWidget {
  const SurahGreeter({
    super.key,
    required this.greeterName,
    required this.greeterTranslation,
    required this.greeterLocation,
    required this.greeterNumAyah,
  });

  final String greeterName;
  final String greeterTranslation;
  final String greeterLocation;
  final int greeterNumAyah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Stack(
          children: [
            Container(
              height: 257,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [lastReadGrad1, lastReadGrad2],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Opacity(
                opacity: 0.1,
                child: quranBgSurah,
              ),
            ),
            SizedBox(
              height: 257,
              child: Center(
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        greeterName,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 26,
                          color: surface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        greeterTranslation,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: surface,
                        ),
                      ),
                      Divider(
                        indent: 64,
                        endIndent: 64,
                        thickness: 2,
                        height: 32,
                        color: surface.withOpacity(0.35),
                      ),
                      Text(
                        '$greeterLocation • $greeterNumAyah AYAT',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: surface,
                        ),
                      ),
                      const SizedBox(height: 24),
                      bismillah
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
