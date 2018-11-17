import 'package:mcgithub/core/config/privateconfig.dart';
import 'package:mcgithub/core/action/useraction.dart';

import 'package:flutter/material.dart';

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

  var httpData;
  var result;
  var data;
  _getAuthorizationResult() {
    setState(() {
      result = httpData.result;
      data = httpData.data;
      print('UserInfo:$data');
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
            httpData = await UserAction.login(PConfig.GITHUB_USER_NAME, PConfig.GITHUB_USER_PASSWORD);
            _getAuthorizationResult();
          },color: Colors.blue, child: new Text('HttpClient Auth'),),
          new Text('result:${result.toString()},data:$data')
        ],
      ),
    );
  }
}
