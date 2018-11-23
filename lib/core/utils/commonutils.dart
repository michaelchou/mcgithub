import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:mcgithub/core/style/mcstringbase.dart';
import 'package:mcgithub/core/localization/defaultlocalizations.dart';
import 'package:mcgithub/core/style/mcstyle.dart';

///
/// @author MichaelChou
/// @date 2018/11/21 11:35 PM
///

class CommonUtils {
  static MCStringBase getLocale(BuildContext context) =>
      MCLocalizations.of(context).currentLocalized;

  static Future<Null> showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent,
          child: WillPopScope(
            onWillPop: () => Future.value(false),
            child: Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: SpinKitCubeGrid(color: Color(MCColors.white))),
                    Container(height: 10.0),
                    Container(
                        child: Text(CommonUtils.getLocale(context).loadingText))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
