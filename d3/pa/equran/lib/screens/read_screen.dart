import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: surface,
      appBar: AppBarContent(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class AppBarContent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarContent({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: SafeArea(
        child: Container(
          color: surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: menuIcon,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'EQuran',
                  style: GoogleFonts.poppins(
                    color: primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: searchIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: surface,
      selectedItemColor: primary,
      unselectedItemColor: onSurfaceVar,
      items: [
        BottomNavigationBarItem(
          icon: favoriteIcon,
          activeIcon: favoriteIconSolid,
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: readIcon,
          activeIcon: readIconSolid,
          label: 'Read',
        ),
        BottomNavigationBarItem(
          icon: settingIcon,
          activeIcon: settingIconSolid,
          label: 'Setting',
        ),
      ],
    );
  }
}
