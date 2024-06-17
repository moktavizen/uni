import 'package:equran/databases/database.dart';
import 'package:equran/providers/database_provider.dart';
import 'package:equran/providers/murattal_provider.dart';
import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.leading,
    this.action,
  });

  final Widget title;
  final Widget leading;
  final Widget? action;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static void goSearch(WidgetRef ref, BuildContext context) async {
    final player = ref.read(murattalProvider);
    player.stop();

    final database = ref.read(databaseProvider);
    final List<Surah> allSurah = await database.allSurah().get();
    final List<Juz> allJuz = await database.allJuz().get();
    final List<dynamic> data = [
      ...allSurah,
      ...allJuz,
    ];

    if (context.mounted) {
      context.pushNamed(
        'search',
        extra: data,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        backgroundColor: surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: leading,
        title: title,
        titleSpacing: 8,
        actions: [
          action ??
              IconButton(
                onPressed: () {
                  goSearch(ref, context);
                },
                icon: searchIcon,
              ),
        ],
      ),
    );
  }
}
