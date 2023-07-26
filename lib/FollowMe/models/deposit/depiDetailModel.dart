class DepiDetailModel {
  DepiDetailModel({
    this.operatedate,
    this.totalbalance,
    this.depositbalance,
    this.deposititemdescription,
    this.signFlag,
  });

  DepiDetailModel.fromJson(dynamic json) {
    operatedate = json['operate_date'];
    totalbalance = json['total_balance'];
    depositbalance = json['deposit_balance'];
    deposititemdescription = json['deposit_item_description'];
    signFlag = json['sign_flag'];
  }
  String? operatedate;
  String? totalbalance;
  String? depositbalance;
  String? deposititemdescription;
  int? signFlag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['operate_date'] = operatedate;
    map['total_balance'] = totalbalance;
    map['deposit_balance'] = depositbalance;
    map['deposit_item_description'] = deposititemdescription;
    map['sign_flag'] = signFlag;
    return map;
  }
}
