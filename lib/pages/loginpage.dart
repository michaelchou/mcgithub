import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:mcgithub/core/store/localstorage.dart';
import 'package:mcgithub/core/config/config.dart';
import 'package:mcgithub/core/redux/mcstate.dart';
import 'package:mcgithub/core/style/mcstyle.dart';
import 'package:mcgithub/widget/mcinputwidget.dart';
import 'package:mcgithub/widget/mcflexbutton.dart';
import 'package:mcgithub/core/utils/commonutils.dart';
import 'package:mcgithub/core/utils/navigatorutils.dart';
import 'package:mcgithub/core/action/useraction.dart';

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

  final TextEditingController userController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  _LoginPageState() : super();

  @override
  void initState() {
    super.initState();
    initParams();
  }

  initParams() async {
    _userName = await LocalStorage.get(Config.STORE_USER_NAME_KEY);
    _password = await LocalStorage.get(Config.STORE_USER_PASSWORD_KEY);
    userController.value = TextEditingValue(text: _userName ?? '');
    pwController.value = TextEditingValue(text: _password ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MCState>(builder: (context, store) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Color(MCColors.cardWhite),
              margin: const EdgeInsets.all(30.0),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 30.0, top: 40.0, right: 30.0, bottom: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    /// 登录logo
                    Image(
                      image: AssetImage(MCIcons.DEFAULT_USER_ICON),
                      width: 90.0,
                      height: 90.0,
                    ),
                    /// 换行
                    Padding(padding: EdgeInsets.all(10.0)),
                    /// 输入用户名
                    MCInputWidget(
                      hintText:
                          CommonUtils.getLocale(context).loginUsernameHintText,
                      iconData: MCIcons.LOGIN_USER,
                      onChanged: (String value) {
                        _userName = value;
                      },
                      controller: userController,
                    ),
                    /// 换行
                    Padding(padding: EdgeInsets.all(10.0)),
                    /// 输入密码
                    MCInputWidget(
                      hintText: CommonUtils.getLocale(context).loginPasswordHintText,
                      iconData: MCIcons.LOGIN_PASSWORD,
                      // obscureText: true,
                      onChanged: (String value) {
                        _password = value;
                      },
                      controller: pwController,
                    ),
                    /// 换行
                    Padding(padding: EdgeInsets.all(10.0)),
                    MCFlexButton(
                      text: CommonUtils.getLocale(context).loginText,
                      color: Theme.of(context).primaryColor,
                      textColor: Color(MCColors.textWhite),
                      onPress: () {
                        if (_userName == null || _userName.length == 0) {
                          return;
                        }
                        if (_password == null || _password.length == 0) {
                          return;
                        }
                        CommonUtils.showLoadingDialog(context);
                        UserAction.login(_userName.trim(), _password.trim(), store: store).then((actionResult) {
                          Navigator.pop(context);
                          if (actionResult != null && actionResult.result) {
                            Future.delayed(const Duration(seconds: 1), () {
                              NavigatorUtils.goHome(context);
                              return true;
                            });
                          }
                        });
                      },
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
