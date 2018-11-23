import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:mcgithub/core/style/mcstringbase.dart';
import 'package:mcgithub/core/style/mcstringzh.dart';

///
/// @author MichaelChou
/// @date 2018/11/20 11:46 PM
///

class MCLocalizations {
  final Locale locale;

  MCLocalizations(this.locale);

  static Map<String, MCStringBase> _localizedValues = {
    'zh': new MCStringZh(),
    'en': new MCStringZh(),
  };

  MCStringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  static MCLocalizations of(BuildContext context) {
    return Localizations.of(context, MCLocalizations);
  }

}