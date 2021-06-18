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
    accentColor: Color(0xFF2E5FE3),
    appBarTheme: AppBarTheme(titleSpacing: 0.0),
    buttonTheme: ButtonThemeData(buttonColor: kLightAccentColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 8.0,
      selectedItemColor: kLightSecondaryColor,
      type: BottomNavigationBarType.fixed,
    ),
    brightness: Brightness.light,
    errorColor: kLightErrorColor,
    pageTransitionsTheme: _pageTransitionsTheme,
    // primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    // textTheme: GoogleFonts.rubikTextTheme(ThemeData.light().textTheme),
  );
}
