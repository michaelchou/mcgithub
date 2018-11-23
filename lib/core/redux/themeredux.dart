import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

///
/// @author MichaelChou
/// @date 2018/11/20 11:04 PM
///

final themeDataReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh),
]);

ThemeData _refresh(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}

class RefreshThemeDataAction {
  final ThemeData themeData;

  RefreshThemeDataAction(this.themeData);

}