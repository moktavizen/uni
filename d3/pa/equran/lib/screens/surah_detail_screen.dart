import 'package:equran/databases/database.dart';
import 'package:equran/providers/ayahs_in_surah_provider.dart';
import 'package:equran/providers/player_provider.dart';
import 'package:equran/providers/selected_button_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/ayah_list_tile.dart';
import 'package:equran/widgets/bismillah_card.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class SurahDetailScreen extends ConsumerWidget {
  const SurahDetailScreen({
    super.key,
    required this.surah,
    required this.surahId,
  });

  final Surah surah;
  final String? surahId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ayahList = ref.watch(ayahsInSurahProvider(int.parse(surahId!)));
    final AudioPlayer player = ref.watch(playerProvider);
    final String selectedButtonState = ref.watch(selectedButtonProvider);

    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        titleText: surah.latin,
        leadingIcon: backIcon,
        onPressLeading: () {
          player.dispose();
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  BismillahCard(
                    title: surah.latin,
                    subtitle: surah.translation,
                    caption:
                        '${surah.location.toUpperCase()} • ${surah.ayahCount} AYAT',
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            )
          ],
          body: switch (ayahList) {
            AsyncData(:final value) => ListView.separated(
                padding: const EdgeInsets.only(bottom: 24),
                addAutomaticKeepAlives: true,
                itemBuilder: (context, index) {
                  Ayah ayah = value.elementAt(index);

                  return AyahListTile(
                    ayah: ayah,
                    selectedButtonState: selectedButtonState,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
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
            _ => const Center(
                child: SizedBox(
                  child: RepaintBoundary(child: CircularProgressIndicator()),
                ),
              ),
          },
        ),
      ),
    );
  }
}
