class InfoModel {
  InfoModel({
    this.membershipNo,
    this.memberFullName,
    this.dateOfBirth,
    this.ageOfBirth,
    this.dateOfApprove,
    this.ageOfApprove,
    this.ageOfRegisingation,
    this.marriagestatus,
    this.grouppaydes,
    this.idCard,
    this.sex,
    this.memStatus,
    this.memberGroupName,
    this.memberGroupPrename,
    this.resignationApproveDate,
    this.bankaccno,
    this.bankname,
    this.address,
    this.presentTelephone,
    this.presentMobile,
    this.memType,
    this.memberGroupNo,
    this.memTypeDesc,
    this.positionName,
    this.shareStock,
    this.salaryAmount,
    this.bloodDesc,
    this.phone,
  });

  InfoModel.fromJson(dynamic json) {
    membershipNo = json['membership_no'];
    memberFullName = json['member_full_name'];
    dateOfBirth = json['date_of_birth'];
    ageOfBirth = json['age_of_birth'];
    dateOfApprove = json['date_of_approve'];
    ageOfApprove = json['age_of_approve'];
    ageOfRegisingation = json['age_of_regisingation'];
    marriagestatus = json['MARRIAGE_STATUS'];
    grouppaydes = json['GROUP_PAY_DES'];
    idCard = json['id_card'];
    sex = json['sex'];
    memStatus = json['mem_status'];
    memberGroupName = json['member_group_name'];
    memberGroupPrename = json['member_group_prename'];
    resignationApproveDate = json['resignation_approve_date'];
    bankaccno = json['BANK_ACC_NO'];
    bankname = json['BANK_NAME'];
    address = json['address'];
    presentTelephone = json['present_telephone'];
    presentMobile = json['present_mobile'];
    memType = json['mem_type'];
    memberGroupNo = json['member_group_no'];
    memTypeDesc = json['mem_type_desc'];
    positionName = json['position_name'];
    shareStock = json['share_stock'];
    salaryAmount = json['salary_amount'];
    bloodDesc = json['blood_desc'];
    phone = json['PHONE_NO'];
  }
  String? membershipNo;
  String? memberFullName;
  String? dateOfBirth;
  String? ageOfBirth;
  String? dateOfApprove;
  String? ageOfApprove;
  String? ageOfRegisingation;
  String? marriagestatus;
  String? grouppaydes;
  String? idCard;
  String? sex;
  String? memStatus;
  String? memberGroupName;
  String? memberGroupPrename;
  dynamic resignationApproveDate;
  String? bankaccno;
  String? bankname;
  String? address;
  String? presentTelephone;
  String? presentMobile;
  String? memType;
  String? memberGroupNo;
  String? memTypeDesc;
  String? positionName;
  String? shareStock;
  String? salaryAmount;
  String? bloodDesc;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['membership_no'] = membershipNo;
    map['member_full_name'] = memberFullName;
    map['date_of_birth'] = dateOfBirth;
    map['age_of_birth'] = ageOfBirth;
    map['date_of_approve'] = dateOfApprove;
    map['age_of_approve'] = ageOfApprove;
    map['age_of_regisingation'] = ageOfRegisingation;
    map['MARRIAGE_STATUS'] = marriagestatus;
    map['GROUP_PAY_DES'] = grouppaydes;
    map['id_card'] = idCard;
    map['sex'] = sex;
    map['mem_status'] = memStatus;
    map['member_group_name'] = memberGroupName;
    map['member_group_prename'] = memberGroupPrename;
    map['resignation_approve_date'] = resignationApproveDate;
    map['BANK_ACC_NO'] = bankaccno;
    map['BANK_NAME'] = bankname;
    map['address'] = address;
    map['present_telephone'] = presentTelephone;
    map['present_mobile'] = presentMobile;
    map['mem_type'] = memType;
    map['member_group_no'] = memberGroupNo;
    map['mem_type_desc'] = memTypeDesc;
    map['position_name'] = positionName;
    map['share_stock'] = shareStock;
    map['salary_amount'] = salaryAmount;
    map['blood_desc'] = bloodDesc;
    map['PHONE_NO'] = phone;
    return map;
  }
}
