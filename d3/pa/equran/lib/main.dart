import 'package:equran/providers/settings_provider.dart';
import 'package:equran/routes.dart';
import 'package:equran/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  ThemeMode getThemeMode(int? isDark) {
    switch (isDark) {
      case 0:
        return ThemeMode.light;
      case 1:
        return ThemeMode.dark;
      case 2:
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Enable edge-to-edge display on gesture naviagtion.
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    // Always portrait orientation.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final setting = ref.watch(settingProvider);

    return MaterialApp.router(
      title: 'EQuran',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      themeMode: getThemeMode(setting.value?.isDark),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
