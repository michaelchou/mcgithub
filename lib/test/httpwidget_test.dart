import 'package:mcgithub/core/config/privateconfig.dart';
import 'package:mcgithub/core/config/config.dart';
import 'package:mcgithub/core/net/httpclient.dart';
import 'package:mcgithub/core/net/githubapi.dart';
import 'package:mcgithub/core/store/localstorage.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

///
/// @author MichaelChou
/// @date 2018/11/8 9:28 PM
///

void main() => runApp(new DemoHttpWidget());

class DemoHttpWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'HttpClient Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new DemoHttpPage(title: 'HttpClient Demo Home Page',),
    );
  }
}

class DemoHttpPage extends StatefulWidget {
  final String title;

  DemoHttpPage({Key key, this.title}) : super(key: key);

  @override
  _DemoHttpPageState createState() => new _DemoHttpPageState();
}

class _DemoHttpPageState extends State<DemoHttpPage> {

  var result = true;
  var data;
  var res;
  _getAuthorizationResult() {
    setState(() {
      result = res.result;
      data = res.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HttpClient Test2'),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(onPressed: () async {
            String type = '${PConfig.GITHUB_USER_NAME}:${PConfig.GITHUB_USER_PASSWORD}';
            var bytes = utf8.encode(type);
            var base64Str = base64.encode(bytes);
            if (Config.DEBUG) {
              print("base64Str login " + base64Str);
            }
            await LocalStorage.save(Config.USER_NAME_KEY, PConfig.GITHUB_USER_NAME);
            await LocalStorage.save(Config.USER_BASIC_CODE, base64Str);

            Map requestParams = {
              "scopes": ['user', 'repo', 'gist', 'notifications'],
              "note": "admin_script",
              "client_id": PConfig.GITHUB_CLIENT_ID,
              "client_secret": PConfig.GITHUB_CLIENT_SECRET
            };
            Http.clearAuthorization();

            res = await Http.fetch(Api.getAuthorization(), json.encode(requestParams), null, new Options(method: "post"));

            _getAuthorizationResult();
          },color: Colors.blue, child: new Text('HttpClient Auth'),),
          new Text('result:${result.toString()},data:$data')
        ],
      ),
    );
  }
}