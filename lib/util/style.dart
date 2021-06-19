import 'package:flutter/material.dart';

import 'colors.dart';

class Style {
  static final _pageTransitionsTheme = PageTransitionsTheme(
    builders: const {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  static final ThemeData light = ThemeData(
    accentColor: kAccentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kNavBarColor,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF5C698B),
      unselectedLabelStyle:
          TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.4),
      selectedLabelStyle:
          TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.4),
    ),
    primaryColor: kPrimaryColor,
    // brightness: Brightness.light,
    pageTransitionsTheme: _pageTransitionsTheme,
    scaffoldBackgroundColor: kPrimaryColor,
  );
}
