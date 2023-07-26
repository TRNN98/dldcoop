class CremationModel {
  CremationModel({
    this.cremType,
    this.cremName,
  });

  String? cremType;
  String? cremName;

  factory CremationModel.fromJson(Map<String, dynamic> json) => CremationModel(
        cremType: json["crem_type"],
        cremName: json["crem_name"],
      );

  Map<String, dynamic> toJson() => {
        "crem_type": cremType,
        "crem_name": cremName,
      };
}
