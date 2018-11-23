import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:async';

import 'package:mcgithub/core/redux/mcstate.dart';
import 'package:mcgithub/core/model/user.dart';
import 'package:mcgithub/core/style/mcstyle.dart';
import 'package:mcgithub/pages/welcomepage.dart';
import 'package:mcgithub/pages/loginpage.dart';
import 'package:mcgithub/core/net/httpinfo.dart';
import 'package:mcgithub/core/localization/mclocalizationsDelegate.dart';

void main() {
  runApp(new MCGitHub());
}

class MCGitHub extends StatelessWidget {

  final store = new Store<MCState>(
    appReducer,
    initialState: new MCState(
      userInfo: User.empty(),
      eventList: new List(),
      themeData: new ThemeData(
        primarySwatch: MCColors.primarySwatch,
        platform: TargetPlatform.iOS,
      ),
      locale: Locale('zh', 'CH'),
    )
  );

  MCGitHub({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new StoreBuilder<MCState>(builder: (context, store) {
          return new MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              MCLocalizationsDelegate.delegate,
            ],
            locale: store.state.locale,
            supportedLocales: [store.state.locale],
            theme: store.state.themeData,
            routes: {
              WelcomePage.sName: (context) {
                store.state.platformLocale = Localizations.localeOf(context);
                return WelcomePage();
              },
              LoginPage.sName: (context) {
                return new MCLocalizations(
                  child: new LoginPage(),
                );
              }
            },
          );
        }),
    );

  }

}

class MCLocalizations extends StatefulWidget {

  final Widget child;


  MCLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MCLocalizationsState();

}

class _MCLocalizationsState extends State<MCLocalizations> {
  StreamSubscription stream;
  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<MCState>(builder: (context, store) {
      return new Localizations.override(
        context: context,
        locale: store.state.locale,
        child: widget.child,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    stream = Code.eventBus.on<HttpErrorEvent>().listen((event) {
      errorHandleFunction(event.code, event.message);
    });
  }


  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }

  errorHandleFunction(int code, message) {
    switch (code) {
      case Code.NETWORK_ERROR:
        break;
      case 401:
        break;
      case 403:
        break;
      case 404:
        break;
      case Code.NETWORK_TIMEOUT:
        break;
      default:
        break;
    }
  }

}