import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:mcgithub/core/redux/mcstate.dart';
import 'package:mcgithub/core/action/useraction.dart';
import 'package:mcgithub/core/utils/navigatorutils.dart';

///
/// @author MichaelChou
/// @date 2018/11/21 2:19 PM
///

class WelcomePage extends StatefulWidget {
  static final String sName = '/';

  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hasInit = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreBuilder<MCState>(
      builder: (context, store) {
        return new Container(
//          color: Color(0xFFFFFFFF),
          child: new Center(
            child: new Image(image: new AssetImage('html/images/welcome.png')),
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hasInit) {
      return;
    }
    hasInit = true;
    Store<MCState> store = StoreProvider.of(context);

    new Future.delayed(const Duration(seconds: 2), () {
      UserAction.initUserInfo(store).then((actionResult) {
        if (actionResult != null && actionResult.result) {
          print('XXXXXXXXXXXXX${actionResult.data}');
        } else {
          NavigatorUtils.goLogin(context);
        }
        return true;
      });
    });
  }
}