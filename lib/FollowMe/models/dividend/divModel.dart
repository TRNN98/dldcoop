class DivModel {
  DivModel({
    this.accountYear,
    this.membershipNo,
    this.totalPaid,
    this.dividend,
    this.averageReturn,
    this.totalSum,
    this.somtobAmount,
  });

  DivModel.fromJson(dynamic json) {
    accountYear = json['account_year'];
    membershipNo = json['membership_no'];
    totalPaid = json['total_sum'];
    dividend = json['dividend'];
    averageReturn = json['average_return'];
    totalSum = json['total_sum'];
    somtobAmount = json['somtob_amount'];
  }
  int? accountYear;
  String? membershipNo;
  String? totalPaid;
  String? dividend;
  String? averageReturn;
  String? totalSum;
  String? somtobAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_year'] = accountYear;
    map['membership_no'] = membershipNo;
    map['total_sum'] = totalPaid;
    map['dividend'] = dividend;
    map['average_return'] = averageReturn;
    map['total_sum'] = totalSum;
    map['somtob_amount'] = somtobAmount;
    return map;
  }
}
