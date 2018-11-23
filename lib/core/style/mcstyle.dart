import 'package:flutter/material.dart';

///
/// @author MichaelChou
/// @date 2018/11/20 11:27 PM
///

class MCColors {

  static const int primaryValue = 0xFF24292E;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color> {
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    }
  );
}

class MCIcons {
  static const String FONT_FAMILY = 'wxcIconFont';

  static const String DEFAULT_USER_ICON = 'html/images/logo.png';

  static const IconData LOGIN_USER = const IconData(0xe666, fontFamily: MCIcons.FONT_FAMILY);
  static const IconData LOGIN_PW = const IconData(0xe60e, fontFamily: MCIcons.FONT_FAMILY);
}