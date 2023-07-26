class GuaranteeModel {
  GuaranteeModel({
    this.loanContractNo,
    this.usedAmount,
    this.loanName,
    this.membershipNo,
    this.principalBalance,
    this.collateraldescription,
    this.beginingofcontract,
    this.loanapproveamount,
  });

  GuaranteeModel.fromJson(dynamic json) {
    loanContractNo = json['loan_contract_no'];
    usedAmount = json['used_amount'];
    loanName = json['loan_name'];
    membershipNo = json['membership_no'];
    principalBalance = json['principal_balance'];
    collateraldescription = json['COLLATERAL_DESCRIPTION'];
    beginingofcontract = json['BEGINING_OF_CONTRACT'];
    loanapproveamount = json['LOAN_APPROVE_AMOUNT'];
  }
  String? loanContractNo;
  String? usedAmount;
  String? loanName;
  String? membershipNo;
  String? principalBalance;
  String? collateraldescription;
  String? beginingofcontract;
  String? loanapproveamount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['loan_contract_no'] = loanContractNo;
    map['used_amount'] = usedAmount;
    map['loan_name'] = loanName;
    map['membership_no'] = membershipNo;
    map['principal_balance'] = principalBalance;
    map['COLLATERAL_DESCRIPTION'] = collateraldescription;
    map['BEGINING_OF_CONTRACT'] = beginingofcontract;
    map['LOAN_APPROVE_AMOUNT'] = loanapproveamount;
    return map;
  }
}
