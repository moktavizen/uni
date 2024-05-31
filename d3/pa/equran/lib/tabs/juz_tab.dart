import 'package:equran/databases/database.dart';
import 'package:equran/providers/juzs_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/hizb_border.dart';
import 'package:equran/widgets/list_tile_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class JuzTab extends ConsumerWidget {
  const JuzTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juzList = ref.watch(juzsProvider);
    return Builder(
      builder: (BuildContext context) => CustomScrollView(
        key: const PageStorageKey('Juz'),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            sliver: switch (juzList) {
              AsyncData(:final value) => SliverList.separated(
                  itemBuilder: (context, index) {
                    Juz juz = value.elementAt(index);

                    return InkWell(
                      onTap: () {
                        return context.goNamed(
                          'juz',
                          pathParameters: {
                            'juzId': (juz.id).toString(),
                          },
                          extra: juz,
                        );
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        horizontalTitleGap: 16,
                        minVerticalPadding: 16,
                        leading: HizbBorder(
                          child: Text(
                            '${juz.id}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: onSurface,
                            ),
                          ),
                        ),
                        title: Text(
                          'Juz ${juz.id} - ${juz.ayahCount} Ayat',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: onSurface,
                          ),
                        ),
                        subtitle: Text(
                          'MULAI • ${juz.surahStart.toUpperCase()} AYAT ${juz.ayahStart}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: onSurfaceVar,
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
                      'Oops!\nTerdapat kesalahan\nsaat memproses data Juz!',
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
