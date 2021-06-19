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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kNavBarColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      selectedItemColor: Color(0xFF5C698B),
    ),
    primaryColor: kPrimaryColor,
    // brightness: Brightness.light,
    pageTransitionsTheme: _pageTransitionsTheme,
    scaffoldBackgroundColor: kPrimaryColor,
  );
}
