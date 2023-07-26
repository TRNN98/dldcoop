class DepModelH {
  DepModelH({
      this.depositBalance, 
      this.membershipNo, 
      this.depositAccountName,});

  DepModelH.fromJson(dynamic json) {
    depositBalance = json['deposit_balance'];
    membershipNo = json['membership_no'];
    depositAccountName = json['deposit_account_name'];
  }
  String? depositBalance;
  String? membershipNo;
  String? depositAccountName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deposit_balance'] = depositBalance;
    map['membership_no'] = membershipNo;
    map['deposit_account_name'] = depositAccountName;
    return map;
  }

}