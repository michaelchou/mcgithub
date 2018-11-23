import 'package:flutter/material.dart';

import 'package:mcgithub/core/model/user.dart';
import 'package:mcgithub/core/model/event.dart';
import 'package:mcgithub/core/redux/userredux.dart';
import 'package:mcgithub/core/redux/eventredux.dart';
import 'package:mcgithub/core/redux/themeredux.dart';
import 'package:mcgithub/core/redux/localeredux.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 12:56 PM
///
/// 全局ReDux store 对象，保存State对象

class MCState {
  /// 用户信息
  User userInfo;

  /// 用户事件列表
  List<Event> eventList = new List();

  /// 多主题
  ThemeData themeData;

  /// 多语言
  Locale locale;

  // 当前手机平台默认语言
  Locale platformLocale;

  MCState({this.userInfo, this.eventList, this.themeData, this.locale});
}

MCState appReducer(MCState state, action) {
  return MCState(
    userInfo: userReducer(state.userInfo, action),
    eventList: eventReducer(state.eventList, action),
    themeData: themeDataReducer(state.themeData, action),
    locale: localeReducer(state.locale, action),
  );
}