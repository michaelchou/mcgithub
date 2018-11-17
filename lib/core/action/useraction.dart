import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mcgithub/core/config/config.dart';
import 'package:mcgithub/core/config/privateconfig.dart';
import 'package:mcgithub/core/store/localstorage.dart';
import 'package:mcgithub/core/net/httpclient.dart';
import 'package:mcgithub/core/net/githubapi.dart';
import 'package:mcgithub/core/action/actionresult.dart';
import 'package:mcgithub/core/model/user.dart';
import 'package:mcgithub/core/database/provider/user/userinfodbprovider.dart';

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

    var httpResult = await Http.fetch(Api.getAuthorization(),
        json.encode(requestParams), null, new Options(method: "post"));
    var userInfoResult;
    // 授权通过
    if (httpResult != null && httpResult.result) {
      await LocalStorage.save(Config.USER_PASSWORD_KEY, password);
//      await Http.fetch(Api.getMyUserInfo(), null, null, null);
      userInfoResult = await getUserInfo(null);
      if (Config.DEBUG) {
        print("user result " + userInfoResult.result.toString());
        print(userInfoResult.data);
        print(httpResult.data.toString());
      }
    }
    return new ActionResult(userInfoResult, httpResult.result);
  }

  static getLocalUserInfo() async {
    var userInfoText = await LocalStorage.get(Config.USER_INFO_KEY);
    // 本地缓存了客户信息
    if (userInfoText != null) {
      var userMap = json.decode(userInfoText);
      User user = User.fromJson(userMap);
      return new ActionResult(user, true);
    } else {  // 本地未缓存客户信息
      return new ActionResult(null, false);
    }
  }

  // 通过userName获取用户详细信息
  static getUserInfo(userName, {needDb = false}) async {
    UserInfoDbProvider provider = new UserInfoDbProvider();
    next() async {
      var httpResult;
      if (userName == null) {
        httpResult = await Http.fetch(Api.getMyUserInfo(), null, null, null);
      } else {
        httpResult = await Http.fetch(Api.getUserInfo(userName), null, null, null);
      }
      if (httpResult != null && httpResult.result) {
        String starred = '---';
        if (httpResult.data['type'] == 'Organization') {
//          var countResult = await get
        }
        User user = User.fromJson(httpResult.data);
        user.hireAble = starred;
        if (userName == null) {
          LocalStorage.save(Config.USER_INFO_KEY, json.encode(user.toJson()));
        } else {
          if (needDb) {
            provider.insert(userName, json.encode(user.toJson()));
          }
        }
        return new ActionResult(user, true);
      } else {
        return new ActionResult(httpResult.data, false);
      }
    }

    if (needDb) {
      User user = await provider.getUserInfo(userName);
      if (user == null) {
        return await next();
      } else {
        ActionResult actionResult = new ActionResult(user, true, next: next());
        return actionResult;
      }
    } else {
      return await next();
    }
  }
}
