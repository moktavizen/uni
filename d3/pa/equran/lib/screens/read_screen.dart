import 'package:equran/styles.dart';
import 'package:equran/tabs/juz_tab.dart';
import 'package:equran/tabs/surah_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: surface,
      appBar: AppBarContent(),
      body: BodyContent(),
      bottomNavigationBar: NavBarContent(),
    );
  }
}

class AppBarContent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarContent({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        backgroundColor: surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: menuIcon,
        ),
        title: Text(
          'Baca',
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: searchIcon,
          ),
        ],
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(
              child: Greeter(),
            ),
            const SliverAppBar(
              backgroundColor: surface,
              pinned: true,
              elevation: 0,
              scrolledUnderElevation: 0,
              toolbarHeight: 0,
              bottom: TabBarContent(),
            ),
          ],
          body: const TabBarView(
            children: [
              SurahTab(),
              JuzTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarContent extends StatelessWidget implements PreferredSizeWidget {
  const TabBarContent({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight + 1);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: primary,
      unselectedLabelColor: onSurfaceVar,
      splashBorderRadius: BorderRadius.circular(10),
      indicatorColor: primary,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 3,
      dividerHeight: 3,
      dividerColor: onSurfaceVar.withOpacity(0.1),
      labelStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
      ),
      tabs: const [
        Tab(text: 'Surah'),
        Tab(text: 'Juz'),
      ],
    );
  }
}

class Greeter extends StatelessWidget {
  const Greeter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: onSurfaceVar,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Welcome to EQuran!',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 24),
        const LastRead(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class LastRead extends StatelessWidget {
  const LastRead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [lastReadGrad1, lastReadGrad2],
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: quranBgHome,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  lastRead,
                  const SizedBox(width: 8),
                  Text(
                    'Last Read',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: surface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Al-Fatihah',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: surface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Ayat No: 1',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: surface,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class NavBarContent extends StatelessWidget {
  const NavBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: surface,
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 13,
        color: primary,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 13,
        color: onSurfaceVar,
      ),
      items: const [
        BottomNavigationBarItem(
          icon: favoriteIcon,
          activeIcon: favoriteIconSolid,
          label: 'Favorit',
        ),
        BottomNavigationBarItem(
          icon: readIcon,
          activeIcon: readIconSolid,
          label: 'Baca',
        ),
        BottomNavigationBarItem(
          icon: settingIcon,
          activeIcon: settingIconSolid,
          label: 'Pengaturan',
        ),
      ],
    );
  }
}
