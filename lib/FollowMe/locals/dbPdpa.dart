import 'dart:io';

import 'package:dldcoop/FollowMe/models/sql/pdpaDb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBPdpa {
  late Database database;

  Future<bool> initDB() async {
    try {
      final String dbName = 'PdpaDb.db';
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
          await db.execute('''
            create table  $TABLE_PDPA (
              $COLUMN_ID  integer primary key ,
              $COLUMN_PDPA TEXT NOT NULL DEFAULT '0')
            ''');
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

  Future<List<PdpaDb>> getPdpa() async {
    List<Map> maps = await database.query(
      TABLE_PDPA,
      columns: [COLUMN_ID, COLUMN_PDPA],
    );
    if (maps.length > 0) {
      return maps.map((p) => PdpaDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<PdpaDb> insertPdpa(PdpaDb pdpa) async {
    pdpa.id = await database.insert(TABLE_PDPA, pdpa.toMap());
    return pdpa;
  }

  Future<int> updatePdpa(PdpaDb pdpa) async {
    return await database.update(
      TABLE_PDPA,
      pdpa.toMap(),
      where: "$COLUMN_ID = ?",
      whereArgs: [pdpa.id],
    );
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $TABLE_PDPA ', []);
  }
}
