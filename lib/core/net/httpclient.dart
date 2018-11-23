import 'package:mcgithub/core/config/config.dart';
import 'package:mcgithub/core/net/httpinfo.dart';
import 'package:mcgithub/core/store/localstorage.dart';

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

import 'dart:collection';

///
/// @author MichaelChou
/// @date 2018/11/8 8:08 PM
/// http client instance
///

class Http {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  static Map optionParams = {
    Config.HTTP_TIMEOUT_KEY: Config.HTTP_TIMEOUT,
    Config.STORE_TOKEN_KEY: null,
    Config.CACHE_AUTH_KEY: null,
  };

  /// 发起网络请求
  /// [ url] 请求url
  /// [ params] 请求参数
  /// [ header] 外加头
  /// [ option] 配置
  static fetch(url, params, Map<String, String> header, Options option,
      {noTip = false}) async {
    // 检测网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return new HttpResult(
          Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip),
          false,
          Code.NETWORK_ERROR);
    }

    Map<String, String> headers = new Map();
    if (header != null) {
      headers.addAll(header);
    }

    // 授权码
    if (optionParams[Config.CACHE_AUTH_KEY] == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        optionParams[Config.CACHE_AUTH_KEY] = authorizationCode;
      }
    }

    headers[Config.HTTP_AUTH_KEY] = optionParams[Config.CACHE_AUTH_KEY];

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    ///超时
    option.connectTimeout = Config.HTTP_TIMEOUT;

    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (Config.DEBUG) {
        print('请求异常: ${e.toString()}');
        print('请求异常url: $url');
        print('请求头: ${option.headers.toString()}');
        if (params != null) {
          print('请求参数: ${params.toString()}');
        }
      }
      return new HttpResult(
          Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
          false,
          errorResponse.statusCode);
    }

    if (Config.DEBUG) {
      print('请求url: $url');
      print('请求头: ${option.headers.toString()}');
      if (params != null) {
        print('请求参数: ${params.toString()}');
      }
      if (response != null) {
        print('返回参数: ${response.toString()}');
      }
      if (optionParams[Config.CACHE_AUTH_KEY] != null) {
        print('${Config.CACHE_AUTH_KEY}: ' + optionParams[Config.CACHE_AUTH_KEY]);
      }
    }

    try {
      if (option.contentType != null &&
          option.contentType.primaryType == "text") {
        return new HttpResult(response.data, true, Code.SUCCESS);
      } else {
        var responseJson = response.data;
        if (response.statusCode == 201 && responseJson[Config.STORE_TOKEN_KEY] != null) {
          optionParams[Config.CACHE_AUTH_KEY] = 'token ' + responseJson[Config.STORE_TOKEN_KEY];
          await LocalStorage.save(
              Config.STORE_TOKEN_KEY, optionParams[Config.CACHE_AUTH_KEY]);
        }
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new HttpResult(response.data, true, Code.SUCCESS,
            headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + url);
      return new HttpResult(response.data, false, response.statusCode,
          headers: response.headers);
    }
    return new HttpResult(
        Code.errorHandleFunction(response.statusCode, "", noTip),
        false,
        response.statusCode);
  }

  /// 清除授权
  static clearAuthorization() {
    optionParams["authorizationCode"] = null;
    LocalStorage.remove(Config.STORE_TOKEN_KEY);
  }

  /// 获取授权token
  static getAuthorization() async {
    String token = await LocalStorage.get(Config.STORE_TOKEN_KEY);
    if (token == null) {
      String basic = await LocalStorage.get(Config.STORE_BASIC_CODE_KEY);
      if (basic == null) {
        //提示输入账号密码
      } else {
        //通过 basic 去获取token，获取到设置，返回token
        return "Basic $basic";
      }
    } else {
      optionParams[Config.CACHE_AUTH_KEY] = token;
      return token;
    }
  }
}
