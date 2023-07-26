const String TABLE_PDPA = 'pdpa';
const String COLUMN_ID = 'id';
const String COLUMN_PDPA = 'pdpa';

class PdpaDb {
  int? id;
  String? pdpa;

  PdpaDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_PDPA: pdpa,
    };

    if (id != null) {
      map[COLUMN_ID] = id;
    }
    return map;
  }

  PdpaDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[COLUMN_ID];
    pdpa = map[COLUMN_PDPA];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "pdpa": pdpa,
  };
  @override
  String toString() => "$id, $pdpa";

}
