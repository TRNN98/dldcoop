class LoanModel {
  LoanModel({
      this.principalBalance, 
      this.loanContractNo, 
      this.beginingOfContract, 
      this.loanApproveAmount, 
      this.periodPaymentAmount, 
      this.loanPaymentTypeCode, 
      this.loanPaymentTypeDesc, 
      this.lastPeriod, 
      this.bankAccNo, 
      this.loanType, 
      this.accruedMoneyDisplay, 
      this.loanApproveAmountDisplay, 
      this.accruedMoney, 
      this.realRecieve, 
      this.memberFullName, 
      this.bankName, 
      this.loanTypeDescription, 
      this.loanInstallmentAmount, 
      this.cCountColl, 
      this.percentPay, 
      this.loanInterestRate, 
      this.dropLoanemerStatus, 
      this.dropLoannormalStatus, 
      this.effactiveDate, 
      this.documentNo, 
      this.approveStatus, 
      this.effactiveEnd, 
      this.remark, 
      this.dropPaymentStatus, 
      this.loanObjectiveCode, 
      this.loanObjectiveDes, 
      this.dropPaymentStatusDesc, 
      this.approveStatusDesc, 
      this.effectDate,});

  LoanModel.fromJson(dynamic json) {
    principalBalance = json['principal_balance'];
    loanContractNo = json['loan_contract_no'];
    beginingOfContract = json['begining_of_contract'];
    loanApproveAmount = json['loan_approve_amount'];
    periodPaymentAmount = json['period_payment_amount'];
    loanPaymentTypeCode = json['loan_payment_type_code'];
    loanPaymentTypeDesc = json['loan_payment_type_desc'];
    lastPeriod = json['last_period'];
    bankAccNo = json['bank_acc_no'];
    loanType = json['loan_type'];
    accruedMoneyDisplay = json['accrued_money_display'];
    loanApproveAmountDisplay = json['loan_approve_amount_display'];
    accruedMoney = json['accrued_money'];
    realRecieve = json['real_recieve'];
    memberFullName = json['member_full_name'];
    bankName = json['bank_name'];
    loanTypeDescription = json['loan_type_description'];
    loanInstallmentAmount = json['loan_installment_amount'];
    cCountColl = json['c_count_coll'];
    percentPay = json['percent_pay'];
    loanInterestRate = json['loan_interest_rate'];
    dropLoanemerStatus = json['drop_loanemer_status'];
    dropLoannormalStatus = json['drop_loannormal_status'];
    effactiveDate = json['effactive_date'];
    documentNo = json['document_no'];
    approveStatus = json['approve_status'];
    effactiveEnd = json['effactive_end'];
    remark = json['remark'];
    dropPaymentStatus = json['drop_payment_status'];
    loanObjectiveCode = json['loan_objective_code'];
    loanObjectiveDes = json['loan_objective_des'];
    dropPaymentStatusDesc = json['drop_payment_status_desc'];
    approveStatusDesc = json['approve_status_desc'];
    effectDate = json['effect_date'];
  }
  String? principalBalance;
  String? loanContractNo;
  String? beginingOfContract;
  String? loanApproveAmount;
  String? periodPaymentAmount;
  String? loanPaymentTypeCode;
  String? loanPaymentTypeDesc;
  dynamic lastPeriod;
  String? bankAccNo;
  String? loanType;
  String? accruedMoneyDisplay;
  String? loanApproveAmountDisplay;
  dynamic accruedMoney;
  String? realRecieve;
  String? memberFullName;
  String? bankName;
  String? loanTypeDescription;
  dynamic loanInstallmentAmount;
  dynamic cCountColl;
  String? percentPay;
  dynamic loanInterestRate;
  String? dropLoanemerStatus;
  String? dropLoannormalStatus;
  String? effactiveDate;
  String? documentNo;
  String? approveStatus;
  String? effactiveEnd;
  dynamic remark;
  String? dropPaymentStatus;
  String? loanObjectiveCode;
  String? loanObjectiveDes;
  String? dropPaymentStatusDesc;
  String? approveStatusDesc;
  String? effectDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['principal_balance'] = principalBalance;
    map['loan_contract_no'] = loanContractNo;
    map['begining_of_contract'] = beginingOfContract;
    map['loan_approve_amount'] = loanApproveAmount;
    map['period_payment_amount'] = periodPaymentAmount;
    map['loan_payment_type_code'] = loanPaymentTypeCode;
    map['loan_payment_type_desc'] = loanPaymentTypeDesc;
    map['last_period'] = lastPeriod;
    map['bank_acc_no'] = bankAccNo;
    map['loan_type'] = loanType;
    map['accrued_money_display'] = accruedMoneyDisplay;
    map['loan_approve_amount_display'] = loanApproveAmountDisplay;
    map['accrued_money'] = accruedMoney;
    map['real_recieve'] = realRecieve;
    map['member_full_name'] = memberFullName;
    map['bank_name'] = bankName;
    map['loan_type_description'] = loanTypeDescription;
    map['loan_installment_amount'] = loanInstallmentAmount;
    map['c_count_coll'] = cCountColl;
    map['percent_pay'] = percentPay;
    map['loan_interest_rate'] = loanInterestRate;
    map['drop_loanemer_status'] = dropLoanemerStatus;
    map['drop_loannormal_status'] = dropLoannormalStatus;
    map['effactive_date'] = effactiveDate;
    map['document_no'] = documentNo;
    map['approve_status'] = approveStatus;
    map['effactive_end'] = effactiveEnd;
    map['remark'] = remark;
    map['drop_payment_status'] = dropPaymentStatus;
    map['loan_objective_code'] = loanObjectiveCode;
    map['loan_objective_des'] = loanObjectiveDes;
    map['drop_payment_status_desc'] = dropPaymentStatusDesc;
    map['approve_status_desc'] = approveStatusDesc;
    map['effect_date'] = effectDate;
    return map;
  }

}