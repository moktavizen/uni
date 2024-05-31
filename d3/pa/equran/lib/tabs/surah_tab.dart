import 'package:equran/databases/database.dart';
import 'package:equran/providers/surahs_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/hizb_border.dart';
import 'package:equran/widgets/list_tile_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        key: const PageStorageKey('Surah'),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            sliver: switch (surahList) {
              AsyncData(:final value) => SliverList.separated(
                  itemBuilder: (context, index) {
                    Surah surah = value.elementAt(index);

                    return InkWell(
                      onTap: () {
                        return context.goNamed(
                          'surah',
                          pathParameters: {
                            'surahId': (surah.id).toString(),
                          },
                          extra: surah,
                        );
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        horizontalTitleGap: 16,
                        minVerticalPadding: 16,
                        leading: HizbBorder(
                          child: Text(
                            '${surah.id}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: onSurface,
                            ),
                          ),
                        ),
                        title: Text(
                          surah.latin,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: onSurface,
                          ),
                        ),
                        subtitle: Text(
                          '${surah.location.toUpperCase()} • ${surah.ayahCount} AYAT',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: onSurfaceVar,
                          ),
                        ),
                        trailing: Text(
                          surah.arabic,
                          style: const TextStyle(
                            fontFamily: 'IsepMisbah',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: primary,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(thickness: 1, color: listDecor);
                  },
                  itemCount: value.length,
                ),
              AsyncError() => Center(
                  child: SizedBox(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Oops!\nTerdapat kesalahan\nsaat memproses data Surah!',
                      style: GoogleFonts.inter(color: onSurface),
                    ),
                  ),
                ),
              _ => const ListTileSkeleton(),
            },
          )
        ],
      ),
    );
  }
}
