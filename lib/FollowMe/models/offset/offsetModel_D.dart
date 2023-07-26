class OffsetModelD {
  OffsetModelD({
      this.seqNo, 
      this.itemTypeId, 
      this.description, 
      this.period, 
      this.processDate, 
      this.thaiProcessDate, 
      this.loanApproveAmount, 
      this.itemAmount, 
      this.interestAmount, 
      this.balance, 
      this.principalAmount,});

  OffsetModelD.fromJson(dynamic json) {
    seqNo = json['seq_no'];
    itemTypeId = json['item_type_id'];
    description = json['description'];
    period = json['period'];
    processDate = json['process_date'];
    thaiProcessDate = json['thai_process_date'];
    loanApproveAmount = json['loan_approve_amount'];
    itemAmount = json['item_amount'];
    interestAmount = json['interest_amount'];
    balance = json['balance'];
    principalAmount = json['principal_amount'];
  }
  int? seqNo;
  String? itemTypeId;
  String? description;
  int? period;
  dynamic processDate;
  dynamic thaiProcessDate;
  int? loanApproveAmount;
  String? itemAmount;
  String? interestAmount;
  String? balance;
  String? principalAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seq_no'] = seqNo;
    map['item_type_id'] = itemTypeId;
    map['description'] = description;
    map['period'] = period;
    map['process_date'] = processDate;
    map['thai_process_date'] = thaiProcessDate;
    map['loan_approve_amount'] = loanApproveAmount;
    map['item_amount'] = itemAmount;
    map['interest_amount'] = interestAmount;
    map['balance'] = balance;
    map['principal_amount'] = principalAmount;
    return map;
  }

}