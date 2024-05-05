import 'package:equran/screens/favorites_screen.dart';
import 'package:equran/screens/read_screen.dart';
import 'package:equran/screens/setting_screen.dart';
import 'package:equran/styles.dart';
import 'package:equran/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedScreenIndex = 1;

  void _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentTitle = 'Baca';
    Widget currentScreen = const ReadScreen();

    switch (selectedScreenIndex) {
      case 0:
        currentTitle = 'Favorit';
        currentScreen = const FavoritesScreen();
      case 2:
        currentTitle = 'Pengaturan';
        currentScreen = const SettingScreen();
    }

    return Scaffold(
      appBar: CustomAppBar(
        titleText: currentTitle,
      ),
      body: currentScreen,
      bottomNavigationBar: _CustomNavBar(
        onSelectScreen: _selectScreen,
        selectedScreenIndex: selectedScreenIndex,
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    required this.onSelectScreen,
    required this.selectedScreenIndex,
  });

  final void Function(int index) onSelectScreen;
  final int selectedScreenIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onSelectScreen,
      currentIndex: selectedScreenIndex,
      backgroundColor: surface,
      elevation: 16,
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
