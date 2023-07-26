class LoanModleD {
  LoanModleD({
    this.loanPaymentDate,
    this.paymentAmount,
    this.signStatus,
    this.period,
    this.interestAmount,
    this.principalbalance,
    this.principalbalancenet,
    this.itemTypeDescription,
    this.insuranceamount,
    this.insuranceriskamount,
    this.refloancodno,
    this.paymentamountnet,
    this.interestamountnet,
    this.itemtypecode,
    this.seqNo,
  });

  LoanModleD.fromJson(dynamic json) {
    loanPaymentDate = json['loan_payment_date'];
    paymentAmount = json['payment_amount'];
    signStatus = json['sign_status'];
    period = json['period'];
    interestAmount = json['interest_amount'];
    principalbalance = json['principal_balance'];
    principalbalancenet = json['PRINCIPAL_BALANCE_NET'];
    itemTypeDescription = json['item_type_description'];
    insuranceamount = json['INSURANCE_AMOUNT'];
    insuranceriskamount = json['INSURANCE_RISK_AMOUNT'];
    refloancodno = json['REF_LOAN_COD_NO'];
    paymentamountnet = json['PAYMENT_AMOUNT_NET'];
    interestamountnet = json['INTEREST_AMOUNT_NET'];
    itemtypecode = json['ITEM_TYPE_CODE'];
    seqNo = json['seq_no'];
  }

  String? loanPaymentDate;
  String? paymentAmount;
  int? signStatus;
  int? period;
  String? interestAmount;
  String? principalbalance;
  String? principalbalancenet;
  String? itemTypeDescription;
  String? insuranceamount;
  String? insuranceriskamount;
  String? refloancodno;
  String? paymentamountnet;
  String? interestamountnet;
  String? itemtypecode;
  int? seqNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loan_payment_date'] = loanPaymentDate;
    map['payment_amount'] = paymentAmount;
    map['sign_status'] = signStatus;
    map['period'] = period;
    map['interest_amount'] = interestAmount;
    map['principal_balance'] = principalbalance;
    map['PRINCIPAL_BALANCE_NET'] = principalbalancenet;
    map['item_type_description'] = itemTypeDescription;
    map['INSURANCE_AMOUNT'] = insuranceamount;
    map['INSURANCE_RISK_AMOUNT'] = insuranceriskamount;
    map['REF_LOAN_COD_NO'] = refloancodno;
    map['PAYMENT_AMOUNT_NET'] = paymentamountnet;
    map['INTEREST_AMOUNT_NET'] = interestamountnet;
    map['ITEM_TYPE_CODE'] = itemtypecode;
    map['seq_no'] = seqNo;
    return map;
  }
}
