import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mcgithub/core/config/config.dart';
import 'package:mcgithub/core/config/privateconfig.dart';
import 'package:mcgithub/core/store/localstorage.dart';
import 'package:mcgithub/core/net/httpclient.dart';
import 'package:mcgithub/core/net/githubapi.dart';

///
/// @author MichaelChou
/// @date 2018/11/11 9:45 PM
///
/// 用户操作的封装

class UserAction {
  // 用户登录
  static login(userName, password, {store}) async {
    String type = '$userName:$password';
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);
    if (Config.DEBUG) {
      print('base64Str login $base64Str');
    }
    await LocalStorage.save(Config.USER_NAME_KEY, userName);
    await LocalStorage.save(Config.USER_BASIC_CODE, base64Str);

    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "admin_script",
      "client_id": PConfig.GITHUB_CLIENT_ID,
      "client_secret": PConfig.GITHUB_CLIENT_SECRET
    };
    Http.clearAuthorization();

    var httpData = await Http.fetch(Api.getAuthorization(),
        json.encode(requestParams), null, new Options(method: "post"));
    var resultData;
    // 授权通过
    if (httpData != null && httpData.result) {
      await LocalStorage.save(Config.USER_PASSWORD_KEY, password);
      return await Http.fetch(Api.getMyUserInfo(), null, null, null);
//      resultData = await getUserInfo(null);
    }
  }

  // 通过userName获取用户详细信息
//  static getUserInfo(userName, {needDB = false}) async {
//
//    next() async {
//      var httpData;
//      if (userName == null) {
//        httpData = await Http.fetch(Api.getMyUserInfo(), null, null, null);
//      } else {
//        httpData = await Http.fetch(Api.getUserInfo(userName), null, null, null);
//      }
//      if (httpData != null && httpData.result) {
//        String starred = '---';
//        if (httpData.data['type'])
//      }
//    }
//  }
}
