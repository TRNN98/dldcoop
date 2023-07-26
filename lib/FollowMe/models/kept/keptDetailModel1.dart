class KeptDetailModel {
  KeptDetailModel({
      this.receiveYear, 
      this.receiveMonth, 
      this.deduteAmountReal, 
      this.salaryIn, 
      this.moneyAmountReal, 
      this.salaryInStatus, 
      this.receiptDate, 
      this.kepMethodRef, 
      this.receiptNo, 
      this.postingStatus, 
      this.countSeqno, 
      this.moneyAmount, 
      this.moneyAmountNot, 
      this.seqNo, 
      this.membershipNo,});

  KeptDetailModel.fromJson(dynamic json) {
    receiveYear = json['receive_year'];
    receiveMonth = json['receive_month'];
    deduteAmountReal = json['dedute_amount_real'];
    salaryIn = json['salary_in'];
    moneyAmountReal = json['money_amount_real'];
    salaryInStatus = json['salary_in_status'];
    receiptDate = json['receipt_date'];
    kepMethodRef = json['kep_method_ref'];
    receiptNo = json['receipt_no'];
    postingStatus = json['posting_status'];
    countSeqno = json['count_seqno'];
    moneyAmount = json['money_amount'];
    moneyAmountNot = json['money_amount_not'];
    seqNo = json['seq_no'];
    membershipNo = json['membership_no'];
  }
  int? receiveYear;
  int? receiveMonth;
  String? deduteAmountReal;
  String? salaryIn;
  String? moneyAmountReal;
  String? salaryInStatus;
  String? receiptDate;
  String? kepMethodRef;
  String? receiptNo;
  String? postingStatus;
  int? countSeqno;
  String? moneyAmount;
  String? moneyAmountNot;
  int? seqNo;
  String? membershipNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['receive_year'] = receiveYear;
    map['receive_month'] = receiveMonth;
    map['dedute_amount_real'] = deduteAmountReal;
    map['salary_in'] = salaryIn;
    map['money_amount_real'] = moneyAmountReal;
    map['salary_in_status'] = salaryInStatus;
    map['receipt_date'] = receiptDate;
    map['kep_method_ref'] = kepMethodRef;
    map['receipt_no'] = receiptNo;
    map['posting_status'] = postingStatus;
    map['count_seqno'] = countSeqno;
    map['money_amount'] = moneyAmount;
    map['money_amount_not'] = moneyAmountNot;
    map['seq_no'] = seqNo;
    map['membership_no'] = membershipNo;
    return map;
  }

}