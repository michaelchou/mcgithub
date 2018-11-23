import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

///
/// @author MichaelChou
/// @date 2018/11/20 11:10 PM
///

final localeReducer = combineReducers<Locale>([
  TypedReducer<Locale, RefreshLocaleAction>(_refresh),
]);

Locale _refresh(Locale locale, action) {
  locale = action.locale;
  return locale;
}

class RefreshLocaleAction {
  final Locale locale;

  RefreshLocaleAction(this.locale);

}