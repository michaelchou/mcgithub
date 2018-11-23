import 'package:flutter/material.dart';

import 'package:mcgithub/pages/loginpage.dart';

///
/// @author MichaelChou
/// @date 2018/11/21 10:14 PM
///

class NavigatorUtils {
  static goLogin(BuildContext context) =>
      Navigator.pushReplacementNamed(context, LoginPage.sName);
}
