import 'dart:io';

import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:equran/providers/murattal_provider.dart';
import 'package:equran/providers/settings_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AyahListScaffold extends ConsumerStatefulWidget {
  const AyahListScaffold({
    super.key,
    required this.screenId,
    required this.headerTitle,
    required this.headerSubtitle,
    required this.headerCaption,
    required this.ayahList,
    this.ayahIndex,
  });

  final int screenId;
  final String headerTitle;
  final String headerSubtitle;
  final String headerCaption;
  final AsyncValue<List<Ayah>> ayahList;
  final int? ayahIndex;

  @override
  ConsumerState<AyahListScaffold> createState() => _AyahListScaffoldState();
}

class _AyahListScaffoldState extends ConsumerState<AyahListScaffold> {
  String _selectedPlayerState = '';
  final _scrollController = AutoScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.ayahIndex != null && widget.ayahIndex! > 0) {
      _scrollController.scrollToIndex(
        widget.ayahIndex!,
        preferPosition: AutoScrollPosition.begin,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _autoScroll(double speedFactor) {
    double maxExtent = _scrollController.position.maxScrollExtent;
    double distanceDifference = maxExtent - _scrollController.offset;
    double durationDouble = distanceDifference / speedFactor;

    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: durationDouble.toInt()),
      curve: Curves.linear,
    );
  }

  void _updateSelectedPlayer(int playerId) {
    setState(() {
      _selectedPlayerState = '$playerId selected';
      // print(_selectedPlayerState);
    });
  }

  void _popScreen(AudioPlayer player, BuildContext context) {
    player.dispose();
    context.goNamed('read');
  }

  @override
  Widget build(BuildContext context) {
    final player = ref.watch(murattalProvider);
    final setting = ref.watch(settingProvider);
    double speedFactor = setting.value!.autoScrollSpeed.toDouble();
    bool isTranslate = setting.value?.isTranslate == 1 ? true : false;
    bool isBar = setting.value?.isBar == 1 ? true : false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (speedFactor > 0) {
        _autoScroll(speedFactor);
      } else {
        // stop auto scroll
        _scrollController.jumpTo(_scrollController.offset);
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        leading: PopScope(
          // Detect pop from system
          canPop: false,
          onPopInvoked: (bool didPop) async {
            if (didPop) {
              return;
            }
            // when pop from system
            _popScreen(player, context);
          },
          child: IconButton(
            onPressed: () {
              // when pop from back button
              _popScreen(player, context);
            },
            icon: backIcon,
          ),
        ),
        title: Text(
          widget.headerTitle,
          style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Theme.of(context).colorScheme.surface,
                context: context,
                builder: (BuildContext context) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          right: 20,
                          bottom: 8,
                          left: 24,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Preferensi Baca',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const Spacer(),
                            IconButton.filledTonal(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: closeIcon,
                              padding: const EdgeInsets.all(0),
                              style: IconButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                              visualDensity: VisualDensity.compact,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.view_comfy_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Tata Letak Ayat',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            )
                          ],
                        ),
                      ),
                      CheckboxListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 36, right: 20),
                        visualDensity: VisualDensity.compact,
                        value: isTranslate,
                        onChanged: (bool? value) {
                          final database = ref.read(databaseProvider);
                          setState(() {
                            isTranslate = value!;
                          });
                          database.setIsTranslate(isTranslate == true ? 1 : 0);
                        },
                        title: const Text('Terjemahan'),
                      ),
                      CheckboxListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 36, right: 20),
                        visualDensity: VisualDensity.compact,
                        value: isBar,
                        onChanged: (bool? value) {
                          final database = ref.read(databaseProvider);
                          setState(() {
                            isBar = value!;
                          });
                          database.setIsBar(isBar == true ? 1 : 0);
                        },
                        title: const Text('Bilah Aksi'),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.only(
                          top: 16,
                          right: 20,
                          bottom: 4,
                          left: 20,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.swipe_up,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'Kecepatan Auto Scroll',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Slider(
                              activeColor:
                                  Theme.of(context).colorScheme.secondary,
                              inactiveColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              thumbColor: Theme.of(context).colorScheme.primary,
                              value: speedFactor,
                              max: 100,
                              divisions: 4,
                              label: (speedFactor / 25).toInt().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  speedFactor = value;
                                });
                                final database = ref.read(databaseProvider);
                                database
                                    .setAutoScrollSpeed(speedFactor.toInt());
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 64)
                    ],
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          IconButton(
            onPressed: () {
              CustomAppBar.goSearch(ref, context);
            },
            icon: searchIcon,
          ),
        ],
      ),
      body: Listener(
        onPointerUp: (_) {
          if (speedFactor > 0) {
            _autoScroll(speedFactor);
          }
        },
        child: CupertinoScrollbar(
          controller: _scrollController,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 24,
                  ),
                  child: _BismillahCard(
                    title: widget.headerTitle,
                    subtitle: widget.headerSubtitle,
                    caption: widget.headerCaption,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 64,
                  left: 24,
                  right: 24,
                ),
                sliver: widget.ayahList.when(
                  data: (value) {
                    return SliverList.builder(
                      // itemPositionsListener: itemPositionsListener,
                      itemBuilder: (context, index) {
                        Ayah ayah = value.elementAt(index);

                        return AutoScrollTag(
                          index: index,
                          controller: _scrollController,
                          key: ValueKey(index),
                          child: _AyahListTile(
                            arabicText: _ArabicText(
                              arabic: ayah.arabic,
                              fontSize:
                                  setting.value!.arabicFontSize.toDouble(),
                              isBar: setting.value!.isBar,
                              ayahNum: ayah.ayahNum,
                            ),
                            tlText: setting.value?.isTranslate == 0
                                ? const SizedBox.shrink()
                                : _TlText(
                                    translation: ayah.translation,
                                    fontSize:
                                        setting.value!.latinFontSize.toDouble(),
                                  ),
                            actionBar: setting.value?.isBar == 0
                                ? const SizedBox.shrink()
                                : _AyahBar(
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
                                        player: player,
                                        selectedPlayerState:
                                            _selectedPlayerState,
                                        updateSelectedPlayer:
                                            _updateSelectedPlayer,
                                        // updateLastRead: _updateLastRead,
                                      ),
                                      _FavAyahButton(
                                        ayah: ayah,
                                        screenId: widget.screenId,
                                        screenTitle: widget.headerTitle,
                                        screenSubtitle: widget.headerSubtitle,
                                        screenCaption: widget.headerCaption,
                                      )
                                    ],
                                  ),
                          ),
                        );
                      },
                      itemCount: value.length,
                    );
                  },
                  error: (e, s) {
                    debugPrintStack(label: e.toString(), stackTrace: s);
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'Oops!\nTerdapat kesalahan\nmemproses data Ayah!',
                          style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    );
                  },
                  loading: () => const _ListTileSkeleton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BismillahCard extends StatelessWidget {
  const _BismillahCard({
    required this.title,
    required this.subtitle,
    required this.caption,
  });

  final String title;
  final String subtitle;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 257,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.secondaryContainer,
                  Theme.of(context).colorScheme.tertiaryContainer,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
              opacity: 0.1,
              child: quranBgSurah,
            ),
          ),
          Container(
            height: 257,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 26,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  indent: 64,
                  endIndent: 64,
                  thickness: 1,
                  height: 32,
                  color: Theme.of(context)
                      .colorScheme
                      .onInverseSurface
                      .withOpacity(0.35),
                ),
                Text(
                  caption,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                ),
                const SizedBox(height: 32),
                bismillah
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListTileSkeleton extends StatelessWidget {
  const _ListTileSkeleton();

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
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
      itemCount: 3,
    );
  }
}

class _AyahListTile extends StatelessWidget {
  const _AyahListTile({
    required this.arabicText,
    required this.tlText,
    required this.actionBar,
  });

  final Widget arabicText;
  final Widget tlText;
  final Widget actionBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 14),
        arabicText,
        tlText,
        actionBar,
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
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
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

class _ArabicText extends ConsumerWidget {
  const _ArabicText({
    required this.arabic,
    required this.fontSize,
    required this.isBar,
    required this.ayahNum,
  });

  final String arabic;
  final double fontSize;
  final int isBar;
  final int ayahNum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          isBar == 1 ? arabic : '$arabic • $ayahNum',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'IsepMisbah',
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
            color: Theme.of(context).colorScheme.onSurface,
            height: 2.5,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _TlText extends ConsumerWidget {
  const _TlText({
    required this.translation,
    required this.fontSize,
  });

  final String translation;
  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: fontSize,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// Alternanive Arabic Fonts
// style: GoogleFonts.amiri(
//   fontWeight: FontWeight.w700,
//   fontSize: 20,
//   color: Theme.of(context).colorScheme.onSurface,,
//   height: 2.5,
// style: GoogleFonts.notoNaskhArabic(
//   fontWeight: FontWeight.w700,
//   fontSize: 20,
//   color: Theme.of(context).colorScheme.onSurface,,
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
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(13.5),
      ),
      child: Center(
        child: Text(
          '$ayahNum',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Theme.of(context).colorScheme.onInverseSurface,
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
          backgroundColor: Theme.of(context).colorScheme.surface,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) => ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 160,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                            color: Theme.of(context).colorScheme.primary,
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
                          onPressed: () => Navigator.of(context).pop(),
                          icon: closeIcon,
                          padding: const EdgeInsets.all(0),
                          style: IconButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          visualDensity: VisualDensity.compact,
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        right: 24,
                        bottom: 64,
                        left: 24,
                      ),
                      child: Text(
                        tafsir,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      icon: tafsirIcon,
    );
  }
}

class _MurattalPlayButton extends StatefulWidget {
  const _MurattalPlayButton({
    required this.ayahNum,
    required this.surahId,
    required this.player,
    required this.selectedPlayerState,
    required this.updateSelectedPlayer,
    // required this.updateLastRead,
  });

  final int ayahNum;
  final int surahId;
  final AudioPlayer player;
  final String selectedPlayerState;
  final void Function(int) updateSelectedPlayer;
  // final void Function(int) updateLastRead;

  @override
  State<_MurattalPlayButton> createState() => _MurattalPlayButtonState();
}

class _MurattalPlayButtonState extends State<_MurattalPlayButton> {
  late final int _playerId = widget.ayahNum;
  late String _playerButtonState = '$_playerId stopped';

  late final _player = widget.player;
  static const String _baseUrl =
      'https://media.qurankemenag.net/audio/Abu_Bakr_Ash-Shaatree_aac64/';
  late final String _paddedSurahId = widget.surahId.toString().padLeft(3, '0');
  late final String _paddedAyahNum = widget.ayahNum.toString().padLeft(3, '0');
  late final String _murattalId = _paddedSurahId + _paddedAyahNum;

  void _playButton(playerId) {
    if (mounted) {
      setState(() {
        _playerButtonState = '$playerId playing';
      });
    }
  }

  void _pauseButton(playerId) {
    if (mounted) {
      setState(() {
        _playerButtonState = '$playerId paused';
      });
    }
  }

  void _stopButton(playerId) {
    if (mounted) {
      setState(() {
        _playerButtonState = '$playerId stopped';
      });
    }
  }

  Future<void> playAudio() async {
    await _player.stop();
    await _player.setUrl("$_baseUrl$_murattalId.m4a");
    _playButton(_playerId);
    await _player.play();
    _stopButton(_playerId);
  }

  Future<void> pauseAudio() async {
    await _player.pause();
    _pauseButton(_playerId);
  }

  Future<void> resumeAudio(String selectedPlayerState) async {
    // print('$selectedPlayerState = $_playerId selected');
    if (selectedPlayerState != '$_playerId selected') {
      await _player.stop();
      await _player.setUrl("$_baseUrl$_murattalId.m4a");
    }
    _playButton(_playerId);
    await _player.play();
    _stopButton(_playerId);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        try {
          final conn = await InternetAddress.lookup('example.com');
          final bool isConn = conn.isNotEmpty && conn[0].rawAddress.isNotEmpty;

          if (isConn == true && context.mounted) {
            ScaffoldMessenger.of(context).clearSnackBars();

            if (_playerButtonState == '$_playerId playing') {
              pauseAudio();
            } else if (_playerButtonState == '$_playerId stopped') {
              playAudio();
            } else if (_playerButtonState == '$_playerId paused') {
              resumeAudio(widget.selectedPlayerState);
            }
          }
        } on SocketException catch (_) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                showCloseIcon: true,
                content: Text(
                  'Fitur ini butuh internet!',
                  style: GoogleFonts.inter(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                  ),
                ),
              ),
            );
          }
        }
        widget.updateSelectedPlayer(_playerId);
      },
      icon: _playerButtonState == '$_playerId playing' ? pauseIcon : playIcon,
    );
  }
}

class _FavAyahButton extends ConsumerWidget {
  const _FavAyahButton({
    required this.ayah,
    required this.screenId,
    required this.screenTitle,
    required this.screenSubtitle,
    required this.screenCaption,
  });

  final Ayah ayah;
  final int screenId;
  final String screenTitle;
  final String screenSubtitle;
  final String screenCaption;

  void _toggleFavorite(WidgetRef ref, BuildContext context) {
    final database = ref.read(databaseProvider);

    switch (ayah.isFav) {
      case 0:
        database.setFavorite(ayah.id);
        database.saveFavorite(
          ayah.surahId,
          ayah.surahName,
          ayah.id,
          ayah.ayahNum - 1,
          screenTitle,
          screenSubtitle,
          screenCaption,
        );
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ditambahkan ke Daftar Favorit',
              style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );

        break;
      case 1:
        database.unsetFavorite(ayah.id);
        database.deleteFavorite(ayah.id);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Dihapus dari Daftar Favorit',
              style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.onInverseSurface,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );

        break;
    }
  }

  void _saveLastRead(WidgetRef ref) {
    final database = ref.read(databaseProvider);

    database.saveLastRead(
      screenId,
      screenTitle,
      screenSubtitle,
      screenCaption,
      ayah.ayahNum - 1,
      ayah.ayahNum,
      ayah.surahName,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Theme.of(context).colorScheme.surface,
          context: context,
          builder: (BuildContext context) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    right: 20,
                    bottom: 8,
                    left: 24,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${ayah.surahName} Ayat ${ayah.ayahNum}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Spacer(),
                      IconButton.filledTonal(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: closeIcon,
                        padding: const EdgeInsets.all(0),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                        ),
                        visualDensity: VisualDensity.compact,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _saveLastRead(ref);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Ditandai sebagai Terakhir Dibaca',
                          style: GoogleFonts.inter(
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
                          ),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        showCloseIcon: true,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        lastReadSolidIcon,
                        const SizedBox(width: 16),
                        Text(
                          'Tandai Terakhir Dibaca',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _toggleFavorite(ref, context);
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        favoriteIconSolid,
                        const SizedBox(width: 16),
                        Text(
                          ayah.isFav == 0
                              ? 'Tambah ke Daftar Favorit'
                              : 'Hapus dari Daftar Favorit',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 64)
              ],
            ),
          ),
        );
      },
      icon: ayah.isFav == 1 ? favoriteIconSolid : favoriteIcon,
    );
  }
}
