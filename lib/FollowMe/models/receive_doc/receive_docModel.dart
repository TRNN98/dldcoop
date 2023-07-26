class ReceiveDoc {
  String? payType;
  String? operateDate;
  String? docnoGroup;
  String? status;

  ReceiveDoc({
    this.payType,
    this.operateDate,
    this.docnoGroup,
    this.status,
  });

  ReceiveDoc.fromJson(dynamic json) {
    payType = json['pay_type'];
    operateDate = json['operate_date'];
    docnoGroup = json['docno_group'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pay_type'] = payType;
    map['operate_date'] = operateDate;
    map['docno_group'] = docnoGroup;
    map['status'] = status;
    return map;
  }
}
