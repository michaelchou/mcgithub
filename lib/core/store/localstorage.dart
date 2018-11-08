import 'package:shared_preferences/shared_preferences.dart';

///
/// @author MichaelChou
/// @date 2018/11/8 9:07 PM
///
///
///SharedPreferences 本地存储
class LocalStorage {

  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}