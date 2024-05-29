import 'package:equran/routes.dart';
import 'package:equran/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Enable edge-to-edge display on gesture naviagtion.
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    return MaterialApp.router(
      title: 'EQuran',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: systemUiBackground,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: systemUiBackground,
            systemNavigationBarDividerColor: systemUiDivider,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
    );
  }
}
