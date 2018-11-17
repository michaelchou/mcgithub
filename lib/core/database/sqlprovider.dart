import 'package:sqflite/sqflite.dart';

import 'package:mcgithub/core/database/sqlmanager.dart';
import 'package:meta/meta.dart';

///
/// @author MichaelChou
/// @date 2018/11/17 4:34 PM
///

/// 基类
abstract class BaseDbProvider {
  bool isTableExists = false;

  createTableSqlString();

  getTableName();

  createTableBaseString(String name, String columnId) {
    return '''
    create table $name (
    $columnId integer primary key autoincremeent, 
    ''';
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  @mustCallSuper
  open() async {
    if (!isTableExists) {
      await prepare(getTableName(), createTableSqlString());
    }
    return await SqlManager.getCurrentDatabase();
  }

  prepare(String tableName, String crateSql) async {
    isTableExists = await SqlManager.isTableExists(tableName);
    if (!isTableExists) {
      Database db = await SqlManager.getCurrentDatabase();
      return await db.execute(crateSql);
    }
  }
}
