class ShareModelH {
  ShareModelH({
    this.shareAmount,
    this.shareStock,
    this.periodRecrieve,
    this.dropStatus,
  });

  ShareModelH.fromJson(dynamic json) {
    shareAmount = json['share_amount'];
    shareStock = json['share_stock'];
    periodRecrieve = json['period_recrieve'].toString();
    dropStatus = json['drop_status'];
  }

  String? shareAmount;
  String? shareStock;
  String? periodRecrieve;
  String? dropStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['share_amount'] = shareAmount;
    map['share_stock'] = shareStock;
    map['period_recrieve'] = periodRecrieve;
    map['drop_status'] = dropStatus;
    return map;
  }
}
