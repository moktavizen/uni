import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:equran/providers/favorites_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/hizb_border.dart';
import 'package:equran/widgets/tab_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  void _shareFavorite(WidgetRef ref, BuildContext context, int ayahId) async {
    final database = ref.read(databaseProvider);
    final ayah = await database.singleAyah(ayahId).getSingle();

    await Share.share(
      '${ayah.arabic}\n'
      '\n'
      '${ayah.translation}\n'
      '[${ayah.surahId}:${ayah.ayahNum}]',
    );
  }

  void _deleteFavorite(WidgetRef ref, BuildContext context, int ayahId) {
    final database = ref.read(databaseProvider);

    database.unsetFavorite(ayahId);
    database.deleteFavorite(ayahId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteList = ref.watch(favoritesProvider);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 10),
              _AddCollection(),
              SizedBox(
                height: 16,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: listDecor,
              )
            ],
          ),
        ),
        Expanded(
          child: favoriteList.when(
            data: (value) {
              if (value.isEmpty) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Kamu belum mempunyai\ndaftar ayat favorit!',
                    style: GoogleFonts.inter(color: onSurface),
                  ),
                );
              } else {
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                  itemBuilder: (context, index) {
                    Favorite fav = value.elementAt(index);
                    return InkWell(
                      splashColor: systemUiBackground,
                      onTap: () {
                        context.goNamed(
                          'surah',
                          pathParameters: {'surahId': fav.surahId.toString()},
                          extra: fav,
                        );
                      },
                      child: TabListTile(
                        leading: HizbBorder(
                          child: Text(
                            '${fav.surahId}',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: onSurface,
                            ),
                          ),
                        ),
                        title: Text(
                          fav.surahName,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: onSurface,
                          ),
                        ),
                        subtitle: Text(
                          'Ayat ${fav.ayahIndex + 1}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: onSurfaceVar,
                          ),
                        ),
                        trailing: MenuAnchor(
                          alignmentOffset: const Offset(-44, 0),
                          builder: (context, controller, child) => IconButton(
                            onPressed: () {
                              if (controller.isOpen) {
                                controller.close();
                              } else {
                                controller.open();
                              }
                            },
                            icon: moreIcon,
                          ),
                          menuChildren: [
                            MenuItemButton(
                              child: Row(
                                children: [
                                  shareIcon,
                                  const SizedBox(width: 8),
                                  Text(
                                    'Bagi',
                                    style: GoogleFonts.inter(color: onSurface),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                _shareFavorite(ref, context, fav.ayahId);
                              },
                            ),
                            MenuItemButton(
                              child: Row(
                                children: [
                                  closeIcon,
                                  const SizedBox(width: 8),
                                  Text(
                                    'Hapus',
                                    style: GoogleFonts.inter(color: onSurface),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                _deleteFavorite(ref, context, fav.ayahId);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: value.length,
                );
              }
            },
            error: (e, s) {
              debugPrintStack(label: e.toString(), stackTrace: s);
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  'Kamu belum mempunyai\ndaftar ayat favorit!',
                  style: GoogleFonts.inter(color: onSurface),
                ),
              );
            },
            loading: () => ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              itemBuilder: (context, index) {
                return const Skeletonizer.zone(
                  child: TabListTile(
                    leading: Bone.icon(size: 36),
                    title: Bone.text(width: 92, fontSize: 16),
                    subtitle: Bone.text(width: 136, fontSize: 12),
                    trailing: Bone.text(width: 64, fontSize: 20),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: listDecor,
              ),
              itemCount: 7,
            ),
          ),
        ),
      ],
    );
  }
}

class _AddCollection extends StatelessWidget {
  const _AddCollection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        addFolderIcon,
        const SizedBox(width: 8),
        Text(
          'Tambah Favorit',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: primary,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
