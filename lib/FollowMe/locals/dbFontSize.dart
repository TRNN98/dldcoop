import 'dart:io';
import 'package:dldcoop/FollowMe/models/sql/fontSizeDb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBFs {
  late Database database;

  Future<bool> initDB() async {
    try {
      final String dbName = 'DBFs.db';
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
          String sql = "CREATE TABLE $TABLE_FS ("
              "$COLUMN_ID INTEGER PRIMARY KEY,"
              "$COLUMN_FS TEXT"
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

  Future<List<FontSizeDb>> getFs() async {
    List<Map> maps = await database.query(
      TABLE_FS,
      columns: [COLUMN_ID, COLUMN_FS],
    );

    if (maps.length > 0) {
      return maps.map((p) => FontSizeDb.fromMap(p)).toList();
    }
    return [];
  }

  Future<FontSizeDb> insertFs(FontSizeDb fs) async {
    fs.id = await database.insert(TABLE_FS, fs.toMap());
    // product.id = await database.rawInsert("INSERT Into ....");
    return fs;
  }

  Future<int> updateFs(FontSizeDb fs) async {
    return await database.update(
      TABLE_FS,
      fs.toMap(),
      where: "$COLUMN_ID = ?",
      whereArgs: [fs.id],
    );
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $TABLE_FS ', []);
  }
}
