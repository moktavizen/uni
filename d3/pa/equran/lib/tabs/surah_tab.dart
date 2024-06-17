import 'package:equran/databases/database.dart';
import 'package:equran/providers/surahs_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/list_tile_skeleton.dart';
import 'package:equran/widgets/surah_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahTab extends ConsumerWidget {
  const SurahTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surahList = ref.watch(surahsProvider);
    return Builder(
      builder: (BuildContext context) => CustomScrollView(
        key: const PageStorageKey('surah'),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
            sliver: surahList.when(
              data: (value) => SliverList.builder(
                itemBuilder: (context, index) {
                  Surah surah = value.elementAt(index);
                  return SurahListTile(surah: surah);
                },
                itemCount: value.length,
              ),
              error: (e, s) {
                debugPrintStack(label: e.toString(), stackTrace: s);
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Oops!\nTerdapat kesalahan\nmemproses data Surah!',
                      style: GoogleFonts.inter(color: onSurface),
                    ),
                  ),
                );
              },
              loading: () => const ListTileSkeleton(),
            ),
          )
        ],
      ),
    );
  }
}
