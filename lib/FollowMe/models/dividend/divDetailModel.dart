class DivDetailModel {
  DivDetailModel(
      {this.accountYear,
      this.dividend,
      this.dividenPercent,
      this.totalInterest,
      this.averageReturn,
      this.averagePercent,
      this.totalReward,
      this.groupPayCode,
      this.postStatus,
      this.bankCode,
      this.groupPayDesMem,
      this.bankAccNo,
      this.paidDate,
      this.dropDividend,
      this.dropAverage,
      this.endingBalance,
      this.dividendFp,
      this.averageReturnFp,
      this.itemAmount,
      this.remark,
      this.paidedAmount,
      this.waitReturn,
      this.waitReturnDate,
      this.seqNo,
      this.bankName,
      this.extStatus});

  DivDetailModel.fromJson(dynamic json) {
    accountYear = json['account_year'];
    dividend = json['dividend'];
    dividenPercent = json['dividen_percent'];
    totalInterest = json['total_interest'];
    averageReturn = json['average_return'];
    averagePercent = json['average_percent'];
    totalReward = json['total_reward'];
    groupPayCode = json['group_pay_code'];
    postStatus = json['post_status'];
    bankCode = json['bank_code'];
    groupPayDesMem = json['group_pay_des_mem'];
    bankAccNo = json['bank_acc_no'];
    paidDate = json['paid_date'];
    dropDividend = json['drop_dividend'];
    dropAverage = json['drop_average'];
    endingBalance = json['ending_balance'];
    dividendFp = json['dividend_fp'];
    averageReturnFp = json['average_return_fp'];
    itemAmount = json['item_amount'];
    remark = json['remark'];
    paidedAmount = json['paided_amount'];
    waitReturn = json['wait_return'];
    waitReturnDate = json['wait_return_date'];
    seqNo = json['seq_no'];
    bankName = json['bank_name'];
    extStatus = json['ext_status'];
  }
  int? accountYear;
  String? dividend;
  String? dividenPercent;
  String? totalInterest;
  String? averageReturn;
  String? averagePercent;
  String? totalReward;
  String? groupPayCode;
  String? postStatus;
  dynamic bankCode;
  String? groupPayDesMem;
  String? bankAccNo;
  String? paidDate;
  String? dropDividend;
  String? dropAverage;
  String? endingBalance;
  String? dividendFp;
  String? averageReturnFp;
  String? itemAmount;
  dynamic remark;
  String? paidedAmount;
  String? waitReturn;
  dynamic waitReturnDate;
  int? seqNo;
  String? bankName;
  String? extStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_year'] = accountYear;
    map['dividend'] = dividend;
    map['dividen_percent'] = dividenPercent;
    map['total_interest'] = totalInterest;
    map['average_return'] = averageReturn;
    map['average_percent'] = averagePercent;
    map['total_reward'] = totalReward;
    map['group_pay_code'] = groupPayCode;
    map['post_status'] = postStatus;
    map['bank_code'] = bankCode;
    map['group_pay_des_mem'] = groupPayDesMem;
    map['bank_acc_no'] = bankAccNo;
    map['paid_date'] = paidDate;
    map['drop_dividend'] = dropDividend;
    map['drop_average'] = dropAverage;
    map['ending_balance'] = endingBalance;
    map['dividend_fp'] = dividendFp;
    map['average_return_fp'] = averageReturnFp;
    map['item_amount'] = itemAmount;
    map['remark'] = remark;
    map['paided_amount'] = paidedAmount;
    map['wait_return'] = waitReturn;
    map['wait_return_date'] = waitReturnDate;
    map['seq_no'] = seqNo;
    map['bank_name'] = bankName;
    map['ext_status'] = extStatus;
    return map;
  }
}
