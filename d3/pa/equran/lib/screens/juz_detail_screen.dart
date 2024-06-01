import 'package:equran/databases/database.dart';
import 'package:equran/providers/ayahs_in_juz_provider.dart';
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
        leading: IconButton(
          onPressed: () {
            player.dispose();
            context.pop();
          },
          icon: backIcon,
        ),
        title: Text(
          'Juz ${juz.id} - ${juz.ayahCount} Ayat',
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
                    title: 'Juz ${juz.id} - ${juz.ayahCount} Ayat',
                    subtitle: 'Mulai Surah',
                    caption:
                        '${juz.surahStart.toUpperCase()} AYAT ${juz.ayahStart}',
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
