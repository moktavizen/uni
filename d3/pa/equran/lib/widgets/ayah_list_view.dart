import 'dart:io';

import 'package:equran/databases/database.dart';
import 'package:equran/providers/murattal_player_provider.dart';
import 'package:equran/providers/player_button_provider.dart';
import 'package:equran/providers/selected_player_provider.dart';
import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AyahListView extends StatelessWidget {
  const AyahListView({
    super.key,
    required this.ayahList,
    required this.selectedButtonState,
  });

  final AsyncValue<List<Ayah>> ayahList;
  final String selectedButtonState;

  @override
  Widget build(BuildContext context) {
    return switch (ayahList) {
      AsyncData(:final value) => SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverList.separated(
            addAutomaticKeepAlives: true,
            itemBuilder: (context, index) {
              Ayah ayah = value.elementAt(index);

              return _AyahListTile(
                arabicText: _ArabicText(arabic: ayah.arabic),
                tlText: _TlText(translation: ayah.translation),
                actionBar: _AyahBar(
                  ayahNum: _AyahNum(ayahNum: ayah.ayahNum),
                  actions: [
                    _ShareAyahButton(
                      arabic: ayah.arabic,
                      translation: ayah.translation,
                      surahId: ayah.surahId,
                      ayahNum: ayah.ayahNum,
                    ),
                    _ShowTafsirButton(
                      surahName: ayah.surahName,
                      ayahNum: ayah.ayahNum,
                      tafsir: ayah.tafsir,
                      surahId: ayah.surahId,
                    ),
                    _MurattalPlayButton(
                      ayahNum: ayah.ayahNum,
                      surahId: ayah.surahId,
                      selectedButtonState: selectedButtonState,
                    ),
                    const _FavAyahButton(),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 28),
            itemCount: value.length,
          ),
        ),
      AsyncError() => Center(
          child: SizedBox(
            child: Text(
              textAlign: TextAlign.center,
              'Oops!\nTerdapat kesalahan\nsaat memproses data Ayah!',
              style: GoogleFonts.inter(color: onSurface),
            ),
          ),
        ),
      _ => const _ListTileSkeleton(),
    };
  }
}

class _ListTileSkeleton extends StatelessWidget {
  const _ListTileSkeleton();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(24),
      sliver: SliverList.separated(
        itemBuilder: (context, index) {
          return Skeletonizer.zone(
            child: _AyahListTile(
              arabicText: const Bone.multiText(
                textAlign: TextAlign.right,
                lines: 1,
                style: TextStyle(fontSize: 20, height: 2.5),
              ),
              tlText: const Bone.multiText(
                lines: 2,
                style: TextStyle(fontSize: 14),
              ),
              actionBar: Bone(
                width: double.infinity,
                height: 47,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemCount: 7,
      ),
    );
  }
}

class _AyahListTile extends StatefulWidget {
  const _AyahListTile({
    required this.arabicText,
    required this.tlText,
    required this.actionBar,
  });
  final Widget arabicText;
  final Widget tlText;
  final Widget actionBar;

  @override
  State<_AyahListTile> createState() => _AyahListTileState();
}

class _AyahListTileState extends State<_AyahListTile>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        widget.arabicText,
        const SizedBox(height: 16),
        widget.tlText,
        const SizedBox(height: 16),
        widget.actionBar,
      ],
    );
  }
}

class _AyahBar extends StatelessWidget {
  const _AyahBar({
    required this.ayahNum,
    required this.actions,
  });

  final Widget ayahNum;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      padding: const EdgeInsets.only(left: 12, right: 4),
      decoration: BoxDecoration(
        color: surahBar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ayahNum,
          const Spacer(),
          Row(
            children: [
              SizedBox(
                width: 40,
                child: actions[0],
              ),
              SizedBox(
                width: 40,
                child: actions[1],
              ),
              SizedBox(
                width: 40,
                child: actions[2],
              ),
              SizedBox(
                width: 40,
                child: actions[3],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArabicText extends StatelessWidget {
  const _ArabicText({
    required this.arabic,
  });

  final String arabic;

  @override
  Widget build(BuildContext context) {
    return Text(
      arabic,
      textAlign: TextAlign.right,
      style: const TextStyle(
        fontFamily: 'IsepMisbah',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: onSurface,
        height: 2.5,
      ),
    );
  }
}

class _TlText extends StatelessWidget {
  const _TlText({
    required this.translation,
  });

  final String translation;

  @override
  Widget build(BuildContext context) {
    return Text(
      translation,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: onSurface,
      ),
    );
  }
}

// Alternanive Arabic Fonts
// style: GoogleFonts.amiri(
//   fontWeight: FontWeight.w700,
//   fontSize: 20,
//   color: onSurface,
//   height: 2.5,
// style: GoogleFonts.notoNaskhArabic(
//   fontWeight: FontWeight.w700,
//   fontSize: 20,
//   color: onSurface,
//   height: 2,

class _AyahNum extends StatelessWidget {
  const _AyahNum({
    required this.ayahNum,
  });

  final int ayahNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27,
      height: 27,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(13.5),
      ),
      child: Center(
        child: Text(
          '$ayahNum',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: surface,
          ),
        ),
      ),
    );
  }
}

class _ShareAyahButton extends StatelessWidget {
  const _ShareAyahButton({
    required this.arabic,
    required this.translation,
    required this.surahId,
    required this.ayahNum,
  });

  final String arabic;
  final String translation;
  final int surahId;
  final int ayahNum;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await Share.share(
          '$arabic\n'
          '\n'
          '$translation\n'
          '[$surahId:$ayahNum]',
        );
      },
      icon: shareIcon,
    );
  }
}

class _ShowTafsirButton extends StatelessWidget {
  const _ShowTafsirButton({
    required this.surahName,
    required this.ayahNum,
    required this.tafsir,
    required this.surahId,
  });

  final String surahName;
  final int ayahNum;
  final String tafsir;
  final int surahId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - 160,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: surface,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        right: 20,
                        bottom: 16,
                        left: 24,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Tafsir $surahName Ayat $ayahNum',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: primary,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              await Share.share(
                                'Tafsir $surahName Ayat $ayahNum:\n'
                                '\n'
                                '$tafsir[$surahId:$ayahNum]',
                              );
                            },
                            icon: shareIcon,
                            padding: const EdgeInsets.all(0),
                            visualDensity: VisualDensity.compact,
                          ),
                          IconButton.filledTonal(
                            onPressed: () => Navigator.pop(context),
                            icon: closeIcon,
                            padding: const EdgeInsets.all(0),
                            visualDensity: VisualDensity.compact,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          right: 24,
                          bottom: 24,
                          left: 24,
                        ),
                        child: Text(
                          tafsir,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: onSurface,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: tafsirIcon,
    );
  }
}

class _MurattalPlayButton extends ConsumerWidget {
  const _MurattalPlayButton({
    required this.ayahNum,
    required this.surahId,
    required this.selectedButtonState,
  });

  final int ayahNum;
  final int surahId;
  final String selectedButtonState;

  Future<void> playAudio(AudioPlayer player, WidgetRef ref, int buttonId,
      String baseUrl, String murattalId) async {
    await player.stop();
    await player.setUrl("$baseUrl$murattalId.m4a");
    ref.read(playerButtonProvider(buttonId).notifier).playButton();
    await player.play();
    ref.read(playerButtonProvider(buttonId).notifier).stopButton();
  }

  Future<void> resumeAudio(AudioPlayer player, WidgetRef ref, int buttonId,
      String baseUrl, String murattalId, String selectedButtonState) async {
    if (selectedButtonState != '$buttonId selected') {
      await player.stop();
      await player.setUrl("$baseUrl$murattalId.m4a");
    }
    ref.read(playerButtonProvider(buttonId).notifier).playButton();
    await player.play();
    ref.read(playerButtonProvider(buttonId).notifier).stopButton();
  }

  Future<void> pauseAudio(
      AudioPlayer player, WidgetRef ref, int buttonId) async {
    await player.pause();
    ref.read(playerButtonProvider(buttonId).notifier).pauseButton();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int buttonId = ayahNum;
    String baseUrl =
        'https://media.qurankemenag.net/audio/Abu_Bakr_Ash-Shaatree_aac64/';

    String paddedSurahId = surahId.toString().padLeft(3, '0');
    String paddedAyahNum = ayahNum.toString().padLeft(3, '0');
    String murattalId = paddedSurahId + paddedAyahNum;

    final AudioPlayer player = ref.watch(murattalPlayerProvider);

    final String playerButtonState = ref.watch(playerButtonProvider(buttonId));

    return IconButton(
      onPressed: () async {
        ref
            .read(selectedPlayerProvider.notifier)
            .selectButton(buttonId: buttonId);
        try {
          final conn = await InternetAddress.lookup('example.com');
          final bool isConn = conn.isNotEmpty && conn[0].rawAddress.isNotEmpty;
          if (isConn == true && context.mounted) {
            ScaffoldMessenger.of(context).clearSnackBars();

            if (playerButtonState == '$buttonId playing') {
              pauseAudio(player, ref, buttonId);
            } else if (playerButtonState == '$buttonId stopped') {
              playAudio(player, ref, buttonId, baseUrl, murattalId);
            } else if (playerButtonState == '$buttonId paused') {
              resumeAudio(player, ref, buttonId, baseUrl, murattalId,
                  selectedButtonState);
            }
          }
        } on SocketException catch (_) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: primary,
                content: Text(
                  textAlign: TextAlign.center,
                  'Fitur ini membutuhkan koneksi internet!',
                  style: GoogleFonts.inter(color: surface),
                ),
              ),
            );
          }
        }
      },
      icon: playerButtonState == '$buttonId playing' ? pauseIcon : playIcon,
    );
  }
}

class _FavAyahButton extends StatelessWidget {
  const _FavAyahButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: bookmarkIcon,
    );
  }
}
