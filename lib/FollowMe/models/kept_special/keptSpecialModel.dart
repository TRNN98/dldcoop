class KeptSpecial {
  String? receiptNo;
  String? receiptDate;
  String? receiveAmount;
  String? moneyTypeName;
  String? membershipNo;
  String? description;
  String? principalAmount;
  String? itemAmount;
  String? interestAmount;
  String? balance;
  String? count;

  KeptSpecial({
    this.receiptNo,
    this.receiptDate,
    this.receiveAmount,
    this.moneyTypeName,
    this.membershipNo,
    this.description,
    this.principalAmount,
    this.itemAmount,
    this.interestAmount,
    this.balance,
    this.count,
  });

  KeptSpecial.fromJson(dynamic json) {
    receiptNo = json['receipt_no'];
    receiptDate = json['receipt_date'];
    receiveAmount = json['receive_amount'];
    moneyTypeName = json['money_type_name'];
    membershipNo = json['membership_no'];
    description = json['description'];
    principalAmount = json['principal_amount'];
    itemAmount = json['item_amount'];
    interestAmount = json['interest_amount'];
    balance = json['balance'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['receipt_no'] = receiptNo;
    map['receipt_date'] = receiptDate;
    map['receive_amount'] = receiveAmount;
    map['money_type_name'] = moneyTypeName;
    map['membership_no'] = membershipNo;
    map['description'] = description;
    map['principal_amount'] = principalAmount;
    map['item_amount'] = itemAmount;
    map['interest_amount'] = interestAmount;
    map['balance'] = balance;
    map['count'] = count;
    return map;
  }
}
