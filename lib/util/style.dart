import 'package:flutter/material.dart';

import 'colors.dart';

class Style {
  static final _pageTransitionsTheme = PageTransitionsTheme(
    builders: const {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  static final ThemeData light = ThemeData(
    accentColor: kAccentColor,
    appBarTheme: AppBarTheme(titleSpacing: 0.0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kNavBarColor,
      type: BottomNavigationBarType.fixed,
    ),
    primaryColor: kPrimaryColor,
    brightness: Brightness.light,
    pageTransitionsTheme: _pageTransitionsTheme,
    // primaryColor: Colors.white,
    scaffoldBackgroundColor: kPrimaryColor,
    // textTheme: GoogleFonts.rubikTextTheme(ThemeData.light().textTheme),
  );
}
