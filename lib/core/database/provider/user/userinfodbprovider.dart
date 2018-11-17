import 'package:mcgithub/core/database/sqlprovider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mcgithub/core/model/user.dart';

import 'dart:convert';

///
/// @author MichaelChou
/// @date 2018/11/17 4:35 PM
///
/// 用户表

class UserInfoDbProvider extends BaseDbProvider {
  final String tableName = 'UserInfo';

  final String columnId = '_id';
  final String columnUserName = 'userName';
  final String columnData = 'data';

  int id;
  String userName;
  String data;

  UserInfoDbProvider();

  Map<String, dynamic> toMap(String userName, String data) {
    Map<String, dynamic> map = {columnUserName: userName, columnData: data};
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }


  UserInfoDbProvider.fromMap(Map map) {
    id = map[columnId];
    userName = map[columnUserName];
    data = map[columnData];
  }

  @override
  getTableName() {
    return tableName;
  }

  @override
  createTableSqlString() {
    return createTableBaseString(tableName, columnId) +
    '''
   $columnUserName text not null,
   $columnData text not null)
   ''';
  }

  Future _getUserProvider(Database db, String userName) async {
    List<Map<String ,dynamic>> maps = await db.query(tableName, columns: [columnId, columnUserName, columnData], where: '$columnUserName = ?', whereArgs: [userName]);
    if (maps.length > 0) {
      UserInfoDbProvider provider = UserInfoDbProvider.fromMap(maps.first);
      return provider;
    }
    return null;
  }

  /// 插入数据
  Future insert(String userName, String eventMapString) async {
    Database db = await getDataBase();
    var userProvider = await _getUserProvider(db, userName);
    if (userProvider != null) {
      await db.delete(tableName, where: '$columnUserName = ?', whereArgs: [userName]);
    }
    return await db.insert(tableName, toMap(userName, eventMapString));
  }

  Future<User> getUserInfo(String userName) async {
    Database db = await getDataBase();
    var userProvider = await _getUserProvider(db, userName);
    if (userProvider != null) {
      return User.fromJson(json.decode(userProvider.data));
    }
    return null;
  }
}