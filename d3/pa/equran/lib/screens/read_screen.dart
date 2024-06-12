import 'package:equran/providers/last_read_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/tabs/juz_tab.dart';
import 'package:equran/tabs/surah_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverToBoxAdapter(
            child: _Greeter(),
          ),
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              backgroundColor: surface,
              pinned: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              toolbarHeight: 0,
              bottom: TabBar(
                labelColor: primary,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                unselectedLabelColor: onSurfaceVar,
                splashBorderRadius: BorderRadius.circular(10),
                indicatorColor: primary,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                dividerHeight: 3,
                dividerColor: surahBar,
                labelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: 'Surah'),
                  Tab(text: 'Juz'),
                ],
              ),
            ),
          ),
        ],
        body: const TabBarView(
          children: [
            SurahTab(),
            JuzTab(),
          ],
        ),
      ),
    );
  }
}

class _Greeter extends ConsumerWidget {
  const _Greeter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastRead = ref.watch(lastReadProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'Assalamualaikum',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: onSurfaceVar,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Welcome to EQuran!',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: onSurface,
            ),
          ),
          const SizedBox(height: 24),
          lastRead.when(
            data: (value) {
              if (value.screenTitle.contains('Juz')) {
                return _LastReadCard(
                  onTap: () {
                    context.goNamed(
                      'juz',
                      pathParameters: {'juzId': value.screenId.toString()},
                      extra: value,
                    );
                  },
                  title: value.screenTitle,
                  subtitle: '${value.surahName} - ${value.ayahNum}',
                );
              } else {
                return _LastReadCard(
                  onTap: () {
                    context.goNamed(
                      'surah',
                      pathParameters: {'surahId': value.screenId.toString()},
                      extra: value,
                    );
                  },
                  title: value.screenTitle,
                  subtitle: 'Ayah No: ${value.ayahNum}',
                );
              }
            },
            error: (e, s) => const _LastReadCard(
              title: 'Belum ada',
              subtitle: 'ayat yang kamu baca',
            ),
            loading: () => const _LastReadSkeleton(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _LastReadCard extends StatelessWidget {
  const _LastReadCard({
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: _LastReadBg(
        child: _LastReadTile(
          badge: Row(
            children: [
              lastReadIcon,
              const SizedBox(width: 8),
              Text(
                'Last Read',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: surface,
                ),
              ),
            ],
          ),
          title: Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: surface,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: surface,
            ),
          ),
          decoration: quranBgHome,
        ),
      ),
    );
  }
}

class _LastReadBg extends StatelessWidget {
  const _LastReadBg({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [lastReadGrad1, lastReadGrad2],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}

class _LastReadTile extends StatelessWidget {
  const _LastReadTile({
    required this.badge,
    required this.title,
    required this.subtitle,
    required this.decoration,
  });

  final Widget badge;
  final Widget title;
  final Widget subtitle;
  final Widget decoration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              badge,
              const Spacer(),
              title,
              const SizedBox(height: 4),
              subtitle,
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: decoration,
        ),
      ],
    );
  }
}

class _LastReadSkeleton extends StatelessWidget {
  const _LastReadSkeleton();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: Container(
        height: 131,
        width: double.infinity,
        decoration: BoxDecoration(
          color: surahBar,
          borderRadius: BorderRadius.circular(10),
        ),
        child: _LastReadTile(
          badge: const Bone.text(width: 100, fontSize: 14),
          title: const Bone.text(width: 92, fontSize: 18),
          subtitle: const Bone.text(width: 72, fontSize: 14),
          decoration: Bone(
            width: 173,
            height: 97,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
