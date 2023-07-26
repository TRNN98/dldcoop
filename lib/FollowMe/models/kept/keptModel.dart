class KeptModel {
  KeptModel({
    this.receiveYear,
    this.receiveMonth,
    this.deduteamountreal,
    this.salaryin,
    this.moneyamountreal,
    this.salaryinstatus,
    this.receiptDate,
    this.kepMethodRef,
    this.receiptNo,
    this.postRun,
    this.countSeqno,
    this.moneyAmount,
    this.addMoneyAmount,
    this.moneyAmountNot,
    this.seqNo,
    this.membershipNo,
    this.ppmDesc,
    this.status,
  });

  KeptModel.fromJson(dynamic json) {
    receiveYear = json['receive_year'];
    receiveMonth = json['receive_month'];
    deduteamountreal = json['DEDUTE_AMOUNT_REAL'];
    salaryin = json['SALARY_IN'];
    moneyamountreal = json['MONEY_AMOUNT_REAL'];
    salaryinstatus = json['SALARY_IN_STATUS'];
    receiptDate = json['receipt_date'];
    kepMethodRef = json['kep_method_ref'];
    receiptNo = json['receipt_no'];
    postRun = json['posted_run'];
    countSeqno = json['count_seqno'];
    moneyAmount = json['kep_method_amount'];
    addMoneyAmount = json['add_kep_method_amount'];
    moneyAmountNot = json['money_amount_not'];
    seqNo = json['seq_no'];
    membershipNo = json['membership_no'];
    ppmDesc = json['ppm_desc'];
    status = json['status'];
  }
  int? receiveYear;
  int? receiveMonth;
  String? deduteamountreal;
  dynamic salaryin;
  dynamic moneyamountreal;
  String? salaryinstatus;
  String? receiptDate;
  String? kepMethodRef;
  dynamic receiptNo;
  String? postRun;
  int? countSeqno;
  String? moneyAmount;
  String? addMoneyAmount;
  String? moneyAmountNot;
  int? seqNo;
  String? membershipNo;
  String? ppmDesc;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['receive_year'] = receiveYear;
    map['receive_month'] = receiveMonth;
    map['DEDUTE_AMOUNT_REAL'] = deduteamountreal;
    map['SALARY_IN'] = salaryin;
    map['MONEY_AMOUNT_REAL'] = moneyamountreal;
    map['SALARY_IN_STATUS'] = salaryinstatus;
    map['receipt_date'] = receiptDate;
    map['kep_method_ref'] = kepMethodRef;
    map['receipt_no'] = receiptNo;
    map['posted_run'] = postRun;
    map['count_seqno'] = countSeqno;
    map['kep_method_amount'] = moneyAmount;
    map['add_kep_method_amount'] = addMoneyAmount;
    map['money_amount_not'] = moneyAmountNot;
    map['seq_no'] = seqNo;
    map['membership_no'] = membershipNo;
    map['ppm_desc'] = ppmDesc;
    map['status'] = status;

    return map;
  }
}
