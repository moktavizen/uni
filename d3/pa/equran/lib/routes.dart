import 'package:equran/databases/database.dart';
import 'package:equran/screens/favorites_screen.dart';
import 'package:equran/screens/juz_detail_screen.dart';
import 'package:equran/screens/read_screen.dart';
import 'package:equran/screens/setting_screen.dart';
import 'package:equran/screens/surah_detail_screen.dart';
import 'package:equran/widgets/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
  initialLocation: '/read',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => HomeNavigation(child: child),
      routes: [
        GoRoute(
          path: '/favorite',
          name: 'favorite',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: FavoritesScreen(),
          ),
        ),
        GoRoute(
          path: '/read',
          name: 'read',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ReadScreen(),
          ),
          routes: [
            GoRoute(
              path: 'surah/:surahId',
              name: 'surah',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) {
                Surah surah = state.extra as Surah;
                return SurahDetailScreen(
                  surah: surah,
                  surahId: state.pathParameters['surahId'],
                );
              },
            ),
            GoRoute(
              path: 'juz/:juzId',
              name: 'juz',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) {
                Juz juz = state.extra as Juz;
                return JuzDetailScreen(
                  juz: juz,
                  juzId: state.pathParameters['juzId'],
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/setting',
          name: 'setting',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingScreen(),
          ),
        )
      ],
    ),
  ],
);
