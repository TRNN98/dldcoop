class GainModel {
  GainModel({
      this.membershipNo, 
      this.gainName, 
      this.relatedNa, 
      this.recNo,});

  GainModel.fromJson(dynamic json) {
    membershipNo = json['membership_no'];
    gainName = json['gain_name'];
    relatedNa = json['related_na'];
    recNo = json['rec_no'];
  }
  String? membershipNo;
  String? gainName;
  String? relatedNa;
  int? recNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['membership_no'] = membershipNo;
    map['gain_name'] = gainName;
    map['related_na'] = relatedNa;
    map['rec_no'] = recNo;
    return map;
  }

}