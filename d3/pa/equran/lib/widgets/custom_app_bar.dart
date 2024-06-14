import 'package:equran/providers/database_provider.dart';
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
                onPressed: () async {
                  final database = ref.read(databaseProvider);
                  final allSUrah = await database.allSurah().get();

                  if (context.mounted) {
                    context.push(
                      '/search',
                      extra: allSUrah,
                    );
                  }
                },
                icon: searchIcon,
              ),
        ],
      ),
    );
  }
}
