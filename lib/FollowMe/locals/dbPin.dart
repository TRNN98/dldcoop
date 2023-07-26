import 'dart:io';

import 'package:dldcoop/FollowMe/models/sql/pinDb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBPin {
  late Database database;

  Future<bool> initDB() async {
    try {
      final String dbName = 'PinDb.db';
      final String dbPath = await getDatabasesPath();
      final String path = join(dbPath, dbName);
      if (!await Directory(dirname(path)).exists()) {
        print("create pin");
        await Directory(dirname(path)).create(recursive: true);
      } else {
        print("no create pin");
      }
      database = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          print("Db Create");
          String sql = "CREATE TABLE $TABLE_PIN ("
              "$COLUMN_ID INTEGER PRIMARY KEY,"
              "$COLUMN_PINNUMBER TEXT"
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

  Future<List<PinDb>> getPins() async {
    List<Map> maps = await database.query(
      TABLE_PIN,
      columns: [COLUMN_ID, COLUMN_PINNUMBER],
    );
    if (maps.length > 0) {
      return maps.map((p) => PinDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<PinDb> insertPins(PinDb pins) async {
    pins.id = await database.insert(TABLE_PIN, pins.toMap());

    return pins;
  }

  Future<int> updatePins(PinDb pins) async {
    return await database.update(
      TABLE_PIN,
      pins.toMap(),
      where: "$COLUMN_ID = ?",
      whereArgs: [pins.id],
    );
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $TABLE_PIN ', []);
  }
}
