import 'package:equran/models/surah.dart';
import 'package:equran/screens/detail_surah_screen.dart';
import 'package:equran/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSurah() async {
    String jsonString =
        await rootBundle.loadString('assets/data/surah-list.json');

    return compute(surahFromJson, jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getSurah(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) {
              Surah surah = snapshot.data!.elementAt(index);

              return ListTileContent(surah: surah);
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 1,
                color: listDecor.withOpacity(0.35),
              );
            },
            itemCount: snapshot.data!.length,
          );
        }

        return const Center(
          child: SizedBox(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}

class ListTileContent extends StatelessWidget {
  const ListTileContent({
    super.key,
    required this.surah,
  });

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailSurahScreen(
              surahName: surah.transliteration,
              surahTranslation: surah.translation,
              surahLocation: surah.location.name,
              surahNumAyah: surah.numAyah,
              surahAyahs: surah.ayahs,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        horizontalTitleGap: 16,
        minVerticalPadding: 16,
        leading: Stack(
          children: [
            surahNumber,
            SizedBox(
              width: 36,
              height: 36,
              child: Center(
                child: Text(
                  '${surah.id}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          surah.transliteration,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: onSurface,
          ),
        ),
        subtitle: Text(
          '${surah.location.name} • ${surah.numAyah} AYAT',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: onSurfaceVar,
          ),
        ),
        trailing: Text(
          surah.arabic,
          style: GoogleFonts.amiri(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: primary,
          ),
        ),
      ),
    );
  }
}
