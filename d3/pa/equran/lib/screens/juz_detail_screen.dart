import 'package:equran/models/ayah.dart';
import 'package:equran/models/juz.dart';
import 'package:equran/providers/selected_button_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/ayah_list_tile.dart';
import 'package:equran/widgets/bismillah_card.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class JuzDetailScreen extends ConsumerWidget {
  const JuzDetailScreen({
    super.key,
    required this.juz,
  });

  final Juz juz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String selectedButtonState = ref.watch(selectedButtonProvider);

    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        titleText: 'Juz ${juz.id} • ${juz.ayahList.length} Ayat',
        leadingIcon: backIcon,
        onPressLeading: () {
          player.stop();
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
                    title: 'Juz ${juz.id} • ${juz.ayahList.length} Ayat',
                    subtitle: 'Mulai Surah',
                    caption:
                        '${juz.startSurah.toUpperCase()} AYAT ${juz.startAyah}',
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            )
          ],
          body: ListView.separated(
            padding: const EdgeInsets.only(bottom: 24),
            itemBuilder: (context, index) {
              Ayah ayah = juz.ayahList.elementAt(index);

              return AyahListTile(
                ayah: ayah,
                selectedButtonState: selectedButtonState,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemCount: juz.ayahList.length,
          ),
        ),
      ),
    );
  }
}
