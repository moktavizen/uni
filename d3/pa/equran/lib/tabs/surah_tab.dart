import 'package:equran/models/surah.dart';
import 'package:equran/providers/surahs_provider.dart';
import 'package:equran/screens/surah_detail_screen.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/list_tile_title.dart';
import 'package:equran/widgets/star_num_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahTab extends ConsumerWidget {
  const SurahTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahList = ref.watch(surahsProvider);

    return switch (surahList) {
      AsyncData(:final value) => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) {
            Surah surah = value.elementAt(index);

            return ListTileContent(surah: surah);
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1,
              color: listDecor,
            );
          },
          itemCount: value.length,
        ),
      AsyncError() => const Center(
          child: SizedBox(
            child: Text('Oops! Terdapat kesalahan saat mengambil data Surah!'),
          ),
        ),
      _ => const Center(
          child: SizedBox(
            child: CircularProgressIndicator(),
          ),
        ),
    };
    // return FutureBuilder(
    //   future: surahList,
    //   builder: ((context, snapshot) {
    //     if (snapshot.hasData) {
    //       return ListView.separated(
    //         padding: const EdgeInsets.symmetric(vertical: 16),
    //         itemBuilder: (context, index) {
    //           Surah surah = snapshot.data!.elementAt(index);
    //
    //           return ListTileContent(surah: surah);
    //         },
    //         separatorBuilder: (context, index) {
    //           return Divider(
    //             thickness: 1,
    //             color: listDecor.withOpacity(0.35),
    //           );
    //         },
    //         itemCount: snapshot.data!.length,
    //       );
    //     }
    //
    //     return const Center(
    //       child: SizedBox(
    //         child: CircularProgressIndicator(),
    //       ),
    //     );
    //   }),
    // );
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurahDetailScreen(
              surahName: surah.transliteration,
              surahTranslation: surah.translation,
              surahLocation: surah.location,
              surahNumAyah: surah.numAyah,
              surahAyahs: surah.ayahList,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        horizontalTitleGap: 16,
        minVerticalPadding: 16,
        leading: StarNumBadge(num: surah.id),
        title: ListTileTitle(title: surah.transliteration),
        subtitle: Text(
          '${surah.location.toUpperCase()} • ${surah.numAyah} AYAT',
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
