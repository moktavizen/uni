import 'package:equran/styles.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({
    super.key,
    required this.child,
  });

  final Widget child;

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/favorite')) {
      return 0;
    }
    if (location.startsWith('/read')) {
      return 1;
    }
    if (location.startsWith('/setting')) {
      return 2;
    }
    return 0;
  }

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  String currentTitle = 'Baca';

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        setState(() => currentTitle = 'Favorit');
        context.goNamed('favorite');
        break;
      case 1:
        setState(() => currentTitle = 'Baca');
        context.goNamed('read');
        break;
      case 2:
        setState(() => currentTitle = 'Pengaturan');
        context.goNamed('setting');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: menuIcon,
        ),
        title: Text(
          currentTitle,
          style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: HomeNavigation._calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 16,
        selectedLabelStyle: GoogleFonts.inter(fontSize: 14),
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 14),
        items: const [
          BottomNavigationBarItem(
            icon: favoriteScreenIcon,
            activeIcon: favoriteScreenIconSolid,
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: readScreenIcon,
            activeIcon: readScreenIconSolid,
            label: 'Baca',
          ),
          BottomNavigationBarItem(
            icon: settingScreenIcon,
            activeIcon: settingScreenIconSolid,
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
