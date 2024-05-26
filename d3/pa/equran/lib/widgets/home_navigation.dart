import 'package:equran/styles.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNavigation extends StatelessWidget {
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

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/favorite');
      case 1:
        GoRouter.of(context).go('/read');
      case 2:
        GoRouter.of(context).go('/setting');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: 'EQuran',
      ),
      body: child,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: systemUiBackground,
          highlightColor: systemUiBackground,
        ),
        child: BottomNavigationBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int idx) => _onItemTapped(idx, context),
          backgroundColor: surface,
          elevation: 16,
          selectedLabelStyle: GoogleFonts.inter(fontSize: 14),
          unselectedLabelStyle: GoogleFonts.inter(fontSize: 14),
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
        ),
      ),
    );
  }
}
