import 'package:equran/models/ayah.dart';
import 'package:equran/providers/selected_button_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/ayah_list_tile.dart';
import 'package:equran/widgets/bismillah_card.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

final AudioPlayer player = AudioPlayer();

class AyahsDetailScreen extends ConsumerWidget {
  const AyahsDetailScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.caption,
    required this.ayahList,
  });

  final String? title;
  final String? subtitle;
  final String? caption;
  final List<Ayah> ayahList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String selectedButtonState = ref.watch(selectedButtonProvider);

    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        titleText: title!,
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
                    title: title!,
                    subtitle: subtitle!,
                    caption: caption!,
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            )
          ],
          body: ListView.separated(
            padding: const EdgeInsets.only(bottom: 24),
            itemBuilder: (context, index) {
              Ayah ayah = ayahList.elementAt(index);

              return AyahListTile(
                ayah: ayah,
                selectedButtonState: selectedButtonState,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemCount: ayahList.length,
          ),
        ),
      ),
    );
  }
}