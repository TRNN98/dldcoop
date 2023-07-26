const String TABLE_DV = 'device';
const String COLUMN_ID = 'id';
const String COLUMN_Status = 'status';

class DeviceDb {
  int? id;
  String? status;

  DeviceDb();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_Status: status,
    };

    // if (id != null) {
    //   map[COLUMN_ID] = id;
    // }
    return map;
  }

  DeviceDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[COLUMN_ID];
    status = map[COLUMN_Status];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
      };
// @override
// String toString() => "$id, $type,$description,$amount";

}

class DeviceJsonDb {
  int? id;
  String? status;

  DeviceJsonDb(this.id, this.status);

  DeviceJsonDb.fromMap(Map<dynamic, dynamic> map) {
    id = map[COLUMN_ID];
    status = map[COLUMN_Status];
  }

  Map<String, dynamic> toJson() => {"id": id, "status": status};

  @override
  String toString() => "IEJsonDb({$id, $status})";
}
