import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:mcgithub/core/store/localstorage.dart';
import 'package:mcgithub/core/config/config.dart';
import 'package:mcgithub/core/redux/mcstate.dart';
import 'package:mcgithub/core/style/mcstyle.dart';
import 'package:mcgithub/widget/mcinputwidget.dart';
import 'package:mcgithub/core/utils/commonutils.dart';

///
/// @author MichaelChou
/// @date 2018/11/21 4:31 PM
///

class LoginPage extends StatefulWidget {
  static final String sName = 'login';

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _userName = '';
  var _password = '';

  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();

  _LoginPageState() : super();

  @override
  void initState() {
    super.initState();
    initParams();
  }

  initParams() async {
    _userName = await LocalStorage.get(Config.STORE_USER_NAME_KEY);
    _password = await LocalStorage.get(Config.STORE_USER_PASSWORD_KEY);
    userController.value = new TextEditingValue(text: _userName ?? '');
    pwController.value = new TextEditingValue(text: _password ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<MCState>(builder: (context, store) {
      return new GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new Container(
          color: Theme.of(context).primaryColor,
          child: new Center(
            child: new Card(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Color(MCColors.cardWhite),
              margin: const EdgeInsets.all(30.0),
              child: new Padding(
                padding: new EdgeInsets.only(
                    left: 30.0, top: 40.0, right: 30.0, bottom: 80.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Image(
                      image: new AssetImage(MCIcons.DEFAULT_USER_ICON),
                      width: 90.0,
                      height: 90.0,
                    ),
                    new Padding(padding: new EdgeInsets.all(10.0)),
                    new MCInputWidget(
                      hintText:
                          CommonUtils.getLocale(context).loginUsernameHintText,
                      iconData: MCIcons.LOGIN_USER,
                      onChanged: (String value) {
                        _userName = value;
                      },
                      controller: userController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
