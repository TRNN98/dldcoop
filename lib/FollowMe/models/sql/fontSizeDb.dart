final String TABLE_FS = 'fontsize';
final String COLUMN_ID = 'id';
final String COLUMN_FS = 'fs';

class FontSizeDb {
  int? id;
  String? fs;

  FontSizeDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_FS: fs,
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }
    return map;
  }

  FontSizeDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[COLUMN_ID];
    fs = map[COLUMN_FS];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "fs": fs,
  };
  @override
  String toString() => "$id, $fs";

}
