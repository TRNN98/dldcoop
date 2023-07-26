class InterestModel {
  InterestModel({
    this.interestStep,
    this.interestRate,
    this.lOANTYPE,
    this.loanStep,
    this.loanInterestRate,
    this.IntereststepMin,
    this.DepositType,
  });

  InterestModel.fromJson(dynamic json) {
    interestStep = json[0]['interest_step'];
    interestRate = json[0]['interest_rate'];
    lOANTYPE = json[0]['LOAN_TYPE'];
    loanStep = json[0]['loan_step'];
    loanInterestRate = json[0]['loan_interest_rate'];
    IntereststepMin = json[0]['interest_step_min'];
    DepositType = json[0]['deposit_type'];
  }
  String? interestStep;
  String? interestRate;
  String? lOANTYPE;
  String? loanStep;
  String? loanInterestRate;
  String? IntereststepMin;
  String? DepositType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['interest_step'] = interestStep;
    map[0]['interest_rate'] = interestRate;
    map[0]['LOAN_TYPE'] = lOANTYPE;
    map[0]['loan_step'] = loanStep;
    map[0]['loan_interest_rate'] = loanInterestRate;
    map[0]['interest_step_min'] = IntereststepMin;
    map[0]['deposit_type'] = DepositType;

    return map;
  }
}
