import 'package:equran/models/juz.dart';
import 'package:equran/providers/juzs_provider.dart';
import 'package:equran/screens/juz_detail_screen.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/list_tile_title.dart';
import 'package:equran/widgets/star_num_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class JuzTab extends ConsumerWidget {
  const JuzTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juzList = ref.watch(juzsProvider);

    return switch (juzList) {
      AsyncData(:final value) => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) {
            Juz juz = value.elementAt(index);

            return ListTileContent(juz: juz);
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
    //   future: _getJuzAndAyah(),
    //   builder: ((context, snapshot) {
    //     if (snapshot.hasData) {
    //       return ListView.separated(
    //         padding: const EdgeInsets.symmetric(vertical: 16),
    //         itemBuilder: (context, index) {
    //           Juz juz = snapshot.data!.elementAt(index);
    //
    //           return ListTileContent(juz: juz);
    //         },
    //         separatorBuilder: (context, index) {
    //           return Divider(
    //             thickness: 1,
    //             color: listDecor,
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
    required this.juz,
  });

  final Juz juz;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JuzDetailScreen(
              juzId: juz.id,
              juzNumAyah: juz.numAyah,
              juzStartSurah: juz.startSurah,
              juzStartAyah: juz.startAyah,
              juzAyahs: juz.ayahList,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        horizontalTitleGap: 16,
        minVerticalPadding: 16,
        leading: StarNumBadge(num: juz.id),
        title: ListTileTitle(title: "Juz ${juz.id}"),
        subtitle: Text(
          "MULAI • ${juz.startSurah.toUpperCase()} AYAT ${juz.startAyah}",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: onSurfaceVar,
          ),
        ),
      ),
    );
  }
}
