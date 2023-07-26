class MemberRefModel {
  MemberRefModel({
    this.membershipNoRef,
    this.membershipNo,
    this.seqNo,
    this.memName,
    this.shareBal,
    this.loanBal,
    this.depBal,
    this.divBal,
  });

  String? membershipNoRef;
  String? membershipNo;
  int? seqNo;
  String? memName;
  String? shareBal;
  String? loanBal;
  String? depBal;
  String? divBal;

  MemberRefModel.fromJson(dynamic json) {
    membershipNoRef = json["membership_no_ref"];
    membershipNo = json["membership_no"];
    seqNo = json["seq_no"];
    memName = json["memname"];
    shareBal = json["share_bal"];
    loanBal = json["loan_bal"].toString();
    depBal = json["dep_bal"].toString();
    divBal = json["div_bal"].toString();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['membership_no_ref'] = membershipNoRef;
    map['membership_no'] = membershipNo;
    map['seq_no'] = seqNo;
    map['memname'] = memName;
    map['share_bal'] = shareBal;
    map['loan_bal'] = loanBal;
    map['dep_bal'] = depBal;
    map['div_bal'] = divBal;
    return map;
  }
}
