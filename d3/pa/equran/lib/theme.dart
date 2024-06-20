import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xffffffff),
    onSurface: Color(0xff240f4f),
    onSurfaceVariant: Color(0xff8789a3),
    onInverseSurface: Color(0xffffffff),
    primary: Color(0xff672cbc),
    primaryFixedDim: Color(0xffdbccef),
    secondary: Color(0xff863ed5),
    errorContainer: Color(0xFFBA1A1A),
    primaryContainer: Color(0xfff3f3f5),
    secondaryContainer: Color(0xffdf98fa),
    tertiaryContainer: Color(0xff9055ff),
    outlineVariant: Color(0xffe7eaee),
  ),
  scaffoldBackgroundColor: const Color(0xffffffff),
  dialogBackgroundColor: const Color(0xffffffff),
  dividerColor: const Color(0xffe7eaee),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffffffff),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Color(0xffe0e0e0),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff040c23),
    onSurface: Color(0xffffffff),
    onSurfaceVariant: Color(0xffa19cc5),
    onInverseSurface: Color(0xffffffff),
    primary: Color(0xffa44aff),
    primaryFixedDim: Color(0xffdbccef),
    secondary: Color(0xffa44aff),
    errorContainer: Color(0xffba1a1a),
    primaryContainer: Color(0xff121931),
    secondaryContainer: Color(0xffdf98fa),
    tertiaryContainer: Color(0xff9055ff),
    outlineVariant: Color(0xff2e3553),
  ),
  scaffoldBackgroundColor: const Color(0xff040c23),
  dialogBackgroundColor: const Color(0xff040c23),
  dividerColor: const Color(0xff2e3553),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff040c23),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Color(0xff0c0c0c),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  ),
);
