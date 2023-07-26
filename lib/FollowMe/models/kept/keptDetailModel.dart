class KeptDetailModel {
  KeptDetailModel({
    this.countRow,
    this.keepingTypeName,
    this.receiveDescription,
    this.principalOfLoan,
    this.interest,
    this.moneyAmount,
  });

  KeptDetailModel.fromJson(dynamic json) {
    countRow = json['count_row'];
    keepingTypeName = json['keeping_type_name'];
    receiveDescription = json['receive_description'];
    principalOfLoan = json['principal_of_loan'];
    interest = json['interest'];
    moneyAmount = json['money_amount'];
  }
  int? countRow;
  String? keepingTypeName;
  String? receiveDescription;
  String? principalOfLoan;
  String? interest;
  String? moneyAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count_row'] = countRow;
    map['receive_description'] = receiveDescription;
    map['principal_of_loan'] = principalOfLoan;
    map['interest'] = interest;
    map['money_amount'] = moneyAmount;
    return map;
  }
}
