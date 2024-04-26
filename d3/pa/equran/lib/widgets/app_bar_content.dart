import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarContent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarContent({
    super.key,
    required this.titleText,
    this.leadingIcon = menuIcon,
    this.onPressLeading,
  });

  final String titleText;
  final Widget leadingIcon;
  final void Function()? onPressLeading;

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
          onPressed: () {
            onPressLeading!();
          },
          icon: leadingIcon,
        ),
        title: Text(
          titleText,
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: _CustomSearchDelegate());
            },
            icon: searchIcon,
          ),
        ],
      ),
    );
  }
}

class _CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Al-Fatihah",
    "Al-Baqarah",
    "Ali ‘Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An‘am",
    "Al-A‘raf",
    "Al-Anfal",
    "At-Taubah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra‘d",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: backIcon,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var surah in searchTerms) {
      if (surah.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(surah);
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return ListTile(title: Text(result));
      },
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var surah in searchTerms) {
      if (surah.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(surah);
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];

        return ListTile(title: Text(result));
      },
      itemCount: matchQuery.length,
    );
  }
}
