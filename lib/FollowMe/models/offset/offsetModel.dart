class OffsetModel {
  OffsetModel({
      this.receiptNo, 
      this.receiptDate, 
      this.membershipNo, 
      this.receptAmount, 
      this.loanContractNoNew, 
      this.beginingOfContract, 
      this.loanRequestAmount, 
      this.periodPaymentAmount, 
      this.bankAccNo, 
      this.bankName, 
      this.receiveMonth, 
      this.receiveYear, 
      this.thaiReceiptDate, 
      this.receiveMonthFp, 
      this.countSeqno,});

  OffsetModel.fromJson(dynamic json) {
    receiptNo = json['receipt_no'];
    receiptDate = json['receipt_date'];
    membershipNo = json['membership_no'];
    receptAmount = json['recept_amount'];
    loanContractNoNew = json['loan_contract_no_new'];
    beginingOfContract = json['begining_of_contract'];
    loanRequestAmount = json['loan_request_amount'];
    periodPaymentAmount = json['period_payment_amount'];
    bankAccNo = json['bank_acc_no'];
    bankName = json['bank_name'];
    receiveMonth = json['receive_month'];
    receiveYear = json['receive_year'];
    thaiReceiptDate = json['thai_receipt_date'];
    receiveMonthFp = json['receive_month_fp'];
    countSeqno = json['count_seqno'];
  }
  String? receiptNo;
  String? receiptDate;
  String? membershipNo;
  String? receptAmount;
  String? loanContractNoNew;
  String? beginingOfContract;
  String? loanRequestAmount;
  String? periodPaymentAmount;
  String? bankAccNo;
  dynamic bankName;
  int? receiveMonth;
  int? receiveYear;
  String? thaiReceiptDate;
  String? receiveMonthFp;
  int? countSeqno;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['receipt_no'] = receiptNo;
    map['receipt_date'] = receiptDate;
    map['membership_no'] = membershipNo;
    map['recept_amount'] = receptAmount;
    map['loan_contract_no_new'] = loanContractNoNew;
    map['begining_of_contract'] = beginingOfContract;
    map['loan_request_amount'] = loanRequestAmount;
    map['period_payment_amount'] = periodPaymentAmount;
    map['bank_acc_no'] = bankAccNo;
    map['bank_name'] = bankName;
    map['receive_month'] = receiveMonth;
    map['receive_year'] = receiveYear;
    map['thai_receipt_date'] = thaiReceiptDate;
    map['receive_month_fp'] = receiveMonthFp;
    map['count_seqno'] = countSeqno;
    return map;
  }

}