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
  String currentTitle = '';

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        setState(() {
          currentTitle = 'Favorite';
        });
        context.goNamed('favorite');
      case 1:
        setState(() {
          currentTitle = 'EQuran';
        });
        context.goNamed('read');
      case 2:
        setState(() {
          currentTitle = 'Setting';
        });
        context.goNamed('setting');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: menuIcon,
        ),
        title: Text(
          currentTitle,
          style: GoogleFonts.inter(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: widget.child,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: systemUiBackground,
          highlightColor: systemUiBackground,
        ),
        child: BottomNavigationBar(
          currentIndex: HomeNavigation._calculateSelectedIndex(context),
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
