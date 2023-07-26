import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/sql/deviceDB.dart';

class DBDevice {
  late Database database;

  Future<bool> initDB() async {
    try {
      final String dbName = 'DeviceDb.db';
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
          String sql = "CREATE TABLE $TABLE_DV ("
              "$COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
              "$COLUMN_Status TEXT"
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

  Future<List<DeviceJsonDb>> getDevice() async {
    List<Map> maps = await database.query(
      TABLE_DV,
      columns: [COLUMN_ID, COLUMN_Status],
    );
    if (maps.length > 0) {
      List<DeviceJsonDb> result =
          maps.map((p) => DeviceJsonDb.fromMap(p)).toList();
      return result;
    }
    return [];
  }

  Future<DeviceDb> insertDevice(DeviceDb dv) async {
    print(dv.toMap());
    dv.id = await database.insert(TABLE_DV, dv.toMap());
    // product.id = await database.rawInsert("INSERT Into ....");
    return dv;
  }

  // Future<int> updateLg(DeviceDb ie) async {
  //   return await database.update(
  //     TABLE_IE,
  //     ie.toMap(),
  //     where: "$COLUMN_ID = ?",
  //     whereArgs: [ie.id],
  //   );
  // }

  Future<int> deleteIe(int id) async {
    return await database
        .delete(TABLE_DV, where: '$COLUMN_ID = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    return await database.rawDelete('DELETE FROM $TABLE_DV ', []);
  }
}
