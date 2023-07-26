class LoanRequest {
  String? loanTypeDescription;
  String? approveStatus;
  String? loanRequestmentNo;
  String? requestmentDate;
  String? membershipNo;
  String? approveDate;
  String? memRequestAmount;
  String? loanApproveAmount;
  String? moneyTypeName;
  String? bankName;
  String? bankAccNo;
  String? smsDate;
  String? smsMessage;
  String? smsDesc;

  LoanRequest({
    this.loanTypeDescription,
    this.approveStatus,
    this.loanRequestmentNo,
    this.requestmentDate,
    this.membershipNo,
    this.approveDate,
    this.memRequestAmount,
    this.loanApproveAmount,
    this.moneyTypeName,
    this.bankName,
    this.bankAccNo,
    this.smsDate,
    this.smsMessage,
    this.smsDesc,
  });

  LoanRequest.fromJson(dynamic json) {
    loanTypeDescription = json['loan_type_description'];
    approveStatus = json['approve_status'];
    loanRequestmentNo = json['loan_requestment_no'];
    requestmentDate = json['requestment_date'];
    membershipNo = json['membership_no'];
    approveDate = json['approve_date'];
    memRequestAmount = json['mem_request_amount'];
    loanApproveAmount = json['loan_rapprove_amount'];
    moneyTypeName = json['money_type_name'];
    bankName = json['bank_name'];
    bankAccNo = json['bank_acc_no'];
    smsDate = json['sms_date'];
    smsMessage = json['sms_message'];
    smsDesc = json['sms_desc'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loan_type_description'] = loanTypeDescription;
    map['approve_status'] = approveStatus;
    map['loan_requestment_no'] = loanRequestmentNo;
    map['requestment_date'] = requestmentDate;
    map['membership_no'] = membershipNo;
    map['loan_requestment_no'] = loanRequestmentNo;
    map['approve_date'] = approveDate;
    map['mem_request_amount'] = memRequestAmount;
    map['loan_rapprove_amount'] = loanApproveAmount;
    map['money_type_name'] = moneyTypeName;
    map['bank_name'] = bankName;
    map['bank_acc_no'] = bankAccNo;
    map['sms_date'] = smsDate;
    map['sms_message'] = smsMessage;
    map['sms_desc'] = smsDesc;
    return map;
  }
}
