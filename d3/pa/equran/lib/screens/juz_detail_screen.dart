import 'package:equran/databases/database.dart';
import 'package:equran/providers/ayahs_in_juz_provider.dart';
import 'package:equran/providers/murattal_player_provider.dart';
import 'package:equran/providers/selected_player_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/ayah_list_tile.dart';
import 'package:equran/widgets/bismillah_card.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class JuzDetailScreen extends ConsumerWidget {
  const JuzDetailScreen({
    super.key,
    required this.juz,
    required this.juzId,
  });

  final Juz juz;
  final String? juzId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ayahList = ref.watch(ayahsInJuzProvider(int.parse(juzId!)));
    final AudioPlayer player = ref.watch(murattalPlayerProvider);
    final String selectedButtonState = ref.watch(selectedPlayerProvider);
    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        titleText: 'Juz ${juz.id} - ${juz.ayahCount} Ayat',
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
                    title: 'Juz ${juz.id} - ${juz.ayahCount} Ayat',
                    subtitle: 'Mulai Surah',
                    caption:
                        '${juz.surahStart.toUpperCase()} AYAT ${juz.ayahStart}',
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
                    'Oops!\nTerdapat kesalahan\nsaat memproses data Juz!',
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
