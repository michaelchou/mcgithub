import 'package:flutter/material.dart';

import 'package:mcgithub/core/style/mcstringbase.dart';
import 'package:mcgithub/core/localization/defaultlocalizations.dart';

///
/// @author MichaelChou
/// @date 2018/11/21 11:35 PM
///

class CommonUtils {
  static MCStringBase getLocale(BuildContext context) => MCLocalizations.of(context).currentLocalized;
}