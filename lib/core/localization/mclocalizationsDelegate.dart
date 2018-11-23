import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mcgithub/core/localization/defaultlocalizations.dart';

///
/// @author MichaelChou
/// @date 2018/11/20 11:45 PM
///

class MCLocalizationsDelegate extends LocalizationsDelegate<MCLocalizations> {

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<MCLocalizations> load(Locale locale) {
    // TODO: implement load
    return new SynchronousFuture<MCLocalizations>(new MCLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<MCLocalizations> old) {
    return false;
  }

  MCLocalizationsDelegate();

  static MCLocalizationsDelegate delegate = new MCLocalizationsDelegate();

}