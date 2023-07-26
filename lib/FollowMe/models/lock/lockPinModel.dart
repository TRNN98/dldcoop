class LockPinModel {
  String? time;
  String? txt1;
  String? txt2;

  LockPinModel({
    this.time,
    this.txt1,
    this.txt2,
  });

  factory LockPinModel.fromJson(Map<String, dynamic> json) => LockPinModel(
    time: json["time"],
    txt1: json["txt1"],
    txt2: json["txt2"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "txt1": txt1,
    "txt2": txt2,
  };
}
