import 'package:equran/models/ayah.dart';
import 'package:equran/screens/ayahs_detail_screen.dart';
import 'package:equran/screens/favorites_screen.dart';
import 'package:equran/screens/read_screen.dart';
import 'package:equran/screens/setting_screen.dart';
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
  debugLogDiagnostics: true,
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
              path: 'ayahs/:title/:subtitle/:caption',
              name: 'ayahs',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) {
                List<Ayah> ayahList = state.extra as List<Ayah>;
                return AyahsDetailScreen(
                  title: state.pathParameters['title'],
                  subtitle: state.pathParameters['subtitle'],
                  caption: state.pathParameters['caption'],
                  ayahList: ayahList,
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
