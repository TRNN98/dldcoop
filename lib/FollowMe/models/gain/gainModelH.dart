class GainModelH {
  GainModelH({
    this.typeAccount,
});

  GainModelH.fromJson(dynamic json) {
    typeAccount = json['typeaccount'];
  }
  String? typeAccount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['typeaccount'] = typeAccount;
    return map;
  }

}