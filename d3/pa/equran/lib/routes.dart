import 'package:equran/databases/database.dart';
import 'package:equran/screens/favorites_screen.dart';
import 'package:equran/screens/juz_detail_screen.dart';
import 'package:equran/screens/read_screen.dart';
import 'package:equran/screens/search_screen.dart';
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
  // debugLogDiagnostics: true,
  initialLocation: '/read',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/search',
      name: 'search',
      builder: (context, state) {
        final List<Surah> allSurah = state.extra as List<Surah>;

        return SearchScreen(
          allSurah: allSurah,
        );
      },
    ),
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
                final Surah? surah =
                    state.extra is Surah ? state.extra as Surah : null;
                final LastRead? lastRead =
                    state.extra is LastRead ? state.extra as LastRead : null;
                final Favorite? fav =
                    state.extra is Favorite ? state.extra as Favorite : null;

                return SurahDetailScreen(
                  surahId: state.pathParameters['surahId'],
                  surah: surah,
                  lastRead: lastRead,
                  fav: fav,
                );
              },
            ),
            GoRoute(
              path: 'juz/:juzId',
              name: 'juz',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) {
                final Juz? juz = state.extra is Juz ? state.extra as Juz : null;
                final LastRead? lastRead =
                    state.extra is LastRead ? state.extra as LastRead : null;

                return JuzDetailScreen(
                  juzId: state.pathParameters['juzId'],
                  juz: juz,
                  lastRead: lastRead,
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
