import 'dart:io';

import 'package:sqflite/sqflite.dart';

import 'package:mcgithub/core/action/useraction.dart';
import 'package:mcgithub/core/model/user.dart';

///
/// @author MichaelChou
/// @date 2018/11/17 4:33 PM
///

class SqlManager {

  static const _VERSION = 1;

  static const _DB_FILE_NAME = 'mc_github_app_flutter.db';

  static Database _database;

  /// 初始化
  /// open database
  static init() async {
    var databasePath = await getDatabasesPath();
    var localUserInfo = await UserAction.getLocalUserInfo();
    String dbName = _DB_FILE_NAME;
    if (localUserInfo != null && localUserInfo.result) {
      User user = localUserInfo.data;
      if (user != null && user.login != null) {
        dbName = '${user.login}_$_DB_FILE_NAME';
      }
    }
    String path = databasePath + dbName;
    if (Platform.isIOS) {
      path = '$databasePath/$dbName';
    }
    _database = await openDatabase(path, version: _VERSION, onCreate: (Database db, int version) async {

    });

  }

  /// 表是否存在
  static isTableExists(String tableName) async {
    await getCurrentDatabase();
    var result = await _database.rawQuery("select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return result != null && result.length > 0;
  }

  /// 获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    } else {
      return _database;
    }
  }

  /// 关闭数据库
  static close() async {
    _database?.close();
    _database = null;
  }

}