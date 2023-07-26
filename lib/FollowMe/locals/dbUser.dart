import 'dart:io';

import 'package:dldcoop/FollowMe/models/sql/userDb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBUser {
  late Database database;

  Future<bool> initDB() async {
    try {
      final String dbName = 'UserDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);

      if (!await Directory(dirname(path)).exists()) {
        print("create");
        await Directory(dirname(path)).create(recursive: true);
      } else {
        print("no create");
      }
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          print("Db Create");
          String sql = "CREATE TABLE $TABLE_USERNAME ("
              "$COLUMN_ID INTEGER PRIMARY KEY,"
              "$COLUMN_USER TEXT,"
              "$COLUMN_PASSWORD TEXT"
              ")";
          await db.execute(sql);
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) {
          print("Database oldVersion: $oldVersion, newVersion $newVersion");
        },
        onOpen: (Database db) async {
          print("Database version: ${await db.getVersion()}");
        },
      );
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future close() async => database.close();

  Future<List<UserDb>> getUsers() async {
    List<Map> maps = await database.query(
      TABLE_USERNAME,
      columns: [COLUMN_ID, COLUMN_USER, COLUMN_PASSWORD],
    );
    if (maps.length > 0) {
      return maps.map((p) => UserDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<UserDb> insertUsers(UserDb users) async {
    users.id = await database.insert(TABLE_USERNAME, users.toMap());
    return users;
  }

  Future<int> updateUsers(UserDb users) async {
    return await database.update(
      TABLE_USERNAME,
      users.toMap(),
      where: "$COLUMN_ID = ?",
      whereArgs: [users.id],
    );
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $TABLE_USERNAME ', []);
  }
}
