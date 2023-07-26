class ShareModelD {
  ShareModelD({
    this.operateDate,
    this.shareValue,
    this.itemTypeDescription,
    this.period,
    this.shareStock,
  });

  ShareModelD.fromJson(dynamic json) {
    operateDate = json['operate_date'];
    shareValue = json['share_value'];
    itemTypeDescription = json['item_type_description'];
    period = json['period'];
    shareStock = json['share_stock'];
  }

  String? operateDate;
  String? shareValue;
  String? itemTypeDescription;
  int? period;
  String? shareStock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['operate_date'] = operateDate;
    map['share_value'] = shareValue;
    map['item_type_description'] = itemTypeDescription;
    map['period'] = period;
    map['share_stock'] = shareStock;
    return map;
  }
}
