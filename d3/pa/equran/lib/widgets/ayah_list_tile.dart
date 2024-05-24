import 'dart:io';

import 'package:equran/models/ayah.dart';
import 'package:equran/providers/murattal_button_provider.dart';
import 'package:equran/providers/selected_button_provider.dart';
import 'package:equran/screens/ayah_list_screen.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/tafsir_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class AyahListTile extends StatelessWidget {
  const AyahListTile({
    super.key,
    required this.ayah,
    required this.selectedButtonState,
  });

  final Ayah ayah;
  final String selectedButtonState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),
        RepaintBoundary(
          child: Text(
            ayah.arabic,
            textAlign: TextAlign.right,
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
            style: const TextStyle(
              fontFamily: 'IsepMisbah',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: onSurface,
              height: 2.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        RepaintBoundary(
          child: Text(
            ayah.translation,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: onSurface,
            ),
          ),
        ),
        const SizedBox(height: 16),
        RepaintBoundary(
          child: AyahBar(
            ayah: ayah,
            selectedButtonState: selectedButtonState,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class AyahBar extends StatelessWidget {
  const AyahBar({
    super.key,
    required this.ayah,
    required this.selectedButtonState,
  });

  final Ayah ayah;
  final String selectedButtonState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 4),
      decoration: BoxDecoration(
        color: surahBar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _AyahNum(ayahNum: ayah.ayahNum),
          const Spacer(),
          Row(
            children: [
              SizedBox(
                width: 40,
                child: IconButton(
                  onPressed: () async {
                    await Share.share(
                      '${ayah.arabic}\n'
                      '\n'
                      '${ayah.translation}\n'
                      '[${ayah.surahId}:${ayah.ayahNum}]',
                    );
                  },
                  icon: shareIcon,
                ),
              ),
              SizedBox(
                width: 40,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return TafsirBottomSheet(ayah: ayah);
                      },
                    );
                  },
                  icon: tafsirIcon,
                ),
              ),
              RepaintBoundary(
                child: _MurattalPlayButton(
                  ayah: ayah,
                  selectedButtonState: selectedButtonState,
                ),
              ),
              SizedBox(
                width: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: bookmarkIcon,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MurattalPlayButton extends ConsumerWidget {
  const _MurattalPlayButton({
    required this.ayah,
    required this.selectedButtonState,
  });

  final Ayah ayah;
  final String selectedButtonState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int buttonId = ayah.ayahNum;

    String paddedSurahId = ayah.surahId.toString().padLeft(3, '0');
    String paddedAyahNum = ayah.ayahNum.toString().padLeft(3, '0');
    String murattalId = paddedSurahId + paddedAyahNum;

    final String murattalButtonState =
        ref.watch(murattalButtonProvider(buttonId: buttonId));
    final MurattalButton murattalButtonNotifier =
        ref.read(murattalButtonProvider(buttonId: buttonId).notifier);

    return SizedBox(
      width: 40,
      child: IconButton(
        onPressed: () async {
          ref
              .read(selectedButtonProvider.notifier)
              .selectButton(buttonId: buttonId);
          try {
            final conn = await InternetAddress.lookup('example.com');
            final bool isConn =
                conn.isNotEmpty && conn[0].rawAddress.isNotEmpty;
            if (isConn == true && context.mounted) {
              ScaffoldMessenger.of(context).clearSnackBars();

              if (murattalButtonState == '$buttonId playing') {
                await player.pause();
                murattalButtonNotifier.pauseButton();
              } else if (murattalButtonState == '$buttonId stopped') {
                await player.stop();
                await player.setUrl(
                  "https://media.qurankemenag.net/audio/Abu_Bakr_Ash-Shaatree_aac64/$murattalId.m4a",
                );
                murattalButtonNotifier.playButton();
                await player.play();
                murattalButtonNotifier.stopButton();
              } else if (murattalButtonState == '$buttonId paused') {
                if (selectedButtonState != '$buttonId selected') {
                  await player.stop();
                  await player.setUrl(
                    "https://media.qurankemenag.net/audio/Abu_Bakr_Ash-Shaatree_aac64/$murattalId.m4a",
                  );
                }
                murattalButtonNotifier.playButton();
                await player.play();
                murattalButtonNotifier.stopButton();
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
        icon: murattalButtonState == '$buttonId playing' ? pauseIcon : playIcon,
      ),
    );
  }
}

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
