import 'package:equran/providers/last_read_provider.dart';
import 'package:equran/styles.dart';
import 'package:equran/tabs/juz_tab.dart';
import 'package:equran/tabs/surah_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class _Greeter extends StatelessWidget {
  const _Greeter();

  @override
  Widget build(BuildContext context) {
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
          const _LastRead(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _LastRead extends ConsumerWidget {
  const _LastRead();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastRead = ref.watch(lastReadProvider);

    return InkWell(
      onTap: () {},
      child: Container(
        height: 131,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: lastRead.when(
          data: (value) => Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [lastReadGrad1, lastReadGrad2],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                    const Spacer(),
                    Text(
                      value.screenTitle,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: surface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ayat No: ${value.ayahNum}',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: surface,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: quranBgHome,
              ),
            ],
          ),
          error: (e, s) {
            debugPrintStack(label: e.toString(), stackTrace: s);
            return Center(
              child: Text(
                textAlign: TextAlign.center,
                'Oops!\nTerdapat kesalahan\nmemproses data Terakhir Dibaca!',
                style: GoogleFonts.inter(color: onSurface),
              ),
            );
          },
          loading: () => const _LastReadSkeleton(),
        ),
      ),
    );
  }
}

class _LastReadSkeleton extends StatelessWidget {
  const _LastReadSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer.zone(
      child: Bone(
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
