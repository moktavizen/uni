import 'dart:io';

import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:equran/providers/murattal_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
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

class _AyahListScaffoldState extends ConsumerState<AyahListScaffold>
    with WidgetsBindingObserver {
  String _selectedPlayerState = '';
  int _lastReadIndex = 0;
  int _lastReadAyahNum = 0;
  String _lastReadSurahName = '';
  final _controller = AutoScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _updateSelectedPlayer(int playerId) {
    setState(() {
      _selectedPlayerState = '$playerId selected';
      // print(_selectedPlayerState);
    });
  }

  void _updateLastRead(int index, int ayahNum, String surahName) {
    _lastReadIndex = index;
    _lastReadAyahNum = ayahNum;
    _lastReadSurahName = surahName;
  }

  void _saveLastRead() {
    final database = ref.read(databaseProvider);

    database.saveLastRead(
      widget.screenId,
      widget.headerTitle,
      widget.headerSubtitle,
      widget.headerCaption,
      _lastReadIndex,
      _lastReadAyahNum,
      _lastReadSurahName,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) return;

    final bool isBackground = state == AppLifecycleState.paused;

    if (isBackground) {
      _saveLastRead();
    }
  }

  void _popScreen(AudioPlayer player) {
    player.dispose();
    _saveLastRead();
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final player = ref.watch(murattalProvider);

    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        leading: PopScope(
          // Detect pop from system
          canPop: false,
          onPopInvoked: (bool didPop) async {
            if (didPop) {
              return;
            }
            // when pop from system
            _popScreen(player);
          },
          child: IconButton(
            onPressed: () {
              // when pop from back button
              _popScreen(player);
            },
            icon: backIcon,
          ),
        ),
        title: Text(
          widget.headerTitle,
          style: GoogleFonts.inter(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: InViewNotifierCustomScrollView(
        controller: _controller,
        isInViewPortCondition:
            (double deltaTop, double deltaBottom, double vpHeight) =>
                deltaTop < 0 && deltaBottom > 0,
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
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 24,
            ),
            sliver: widget.ayahList.when(
              data: (value) {
                if (widget.ayahIndex != null && widget.ayahIndex! > 0) {
                  _controller.scrollToIndex(
                    widget.ayahIndex!,
                    preferPosition: AutoScrollPosition.begin,
                  );
                }

                return SliverList.builder(
                  // itemPositionsListener: itemPositionsListener,
                  itemBuilder: (context, index) {
                    Ayah ayah = value.elementAt(index);

                    // initial value
                    _lastReadAyahNum = value.elementAt(0).ayahNum;
                    _lastReadSurahName = value.elementAt(0).surahName;

                    return AutoScrollTag(
                      index: index,
                      controller: _controller,
                      key: ValueKey(index),
                      child: InViewNotifierWidget(
                        id: '$index',
                        builder: (BuildContext context, bool isInView,
                            Widget? child) {
                          if (isInView == true) {
                            _updateLastRead(
                              index,
                              ayah.ayahNum,
                              ayah.surahName,
                            );
                          }
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
                                  player: player,
                                  selectedPlayerState: _selectedPlayerState,
                                  updateSelectedPlayer: _updateSelectedPlayer,
                                  // updateLastRead: _updateLastRead,
                                ),
                                const _FavAyahButton(),
                              ],
                            ),
                          );
                        },
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
                      style: GoogleFonts.inter(color: onSurface),
                    ),
                  ),
                );
              },
              loading: () => const _ListTileSkeleton(),
            ),
          ),
        ],
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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [lastReadGrad1, lastReadGrad2],
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
                    color: surface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: surface,
                  ),
                  textAlign: TextAlign.center,
                ),
                Divider(
                  indent: 64,
                  endIndent: 64,
                  thickness: 1,
                  height: 32,
                  color: surface.withOpacity(0.35),
                ),
                Text(
                  caption,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: surface,
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
        const SizedBox(height: 16),
        tlText,
        const SizedBox(height: 16),
        actionBar,
        const SizedBox(height: 14),
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
    setState(() {
      _playerButtonState = '$playerId playing';
    });
  }

  void _pauseButton(playerId) {
    setState(() {
      _playerButtonState = '$playerId paused';
    });
  }

  void _stopButton(playerId) {
    setState(() {
      _playerButtonState = '$playerId stopped';
    });
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
                backgroundColor: error,
                content: Text(
                  textAlign: TextAlign.center,
                  'Fitur ini membutuhkan koneksi internet!',
                  style: GoogleFonts.inter(color: surface),
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
