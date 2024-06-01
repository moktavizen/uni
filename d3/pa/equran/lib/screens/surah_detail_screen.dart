import 'package:equran/databases/database.dart';
import 'package:equran/providers/ayahs_in_surah_provider.dart';
import 'package:equran/providers/murattal_player_provider.dart';
import 'package:equran/providers/selected_player_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/ayah_list_view.dart';
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
    final AudioPlayer player = ref.watch(murattalPlayerProvider);
    final String selectedButtonState = ref.watch(selectedPlayerProvider);

    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            player.dispose();
            context.pop();
          },
          icon: backIcon,
        ),
        title: Text(
          surah.latin,
          style: GoogleFonts.inter(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  child: BismillahCard(
                    title: surah.latin,
                    subtitle: surah.translation,
                    caption:
                        '${surah.location.toUpperCase()} • ${surah.ayahCount} AYAT',
                  ),
                ),
              ],
            ),
          ),
          AyahListView(
            ayahList: ayahList,
            selectedButtonState: selectedButtonState,
          ),
        ],
      ),
    );
  }
}
