class MsgModel {
  MsgModel({
    this.seq,
    this.title,
    this.message,
    this.photoMobile,
    this.ndata,
    this.operateDate,
    this.status,
    this.type,
    this.memberRef,
  });

  MsgModel.fromJson(dynamic json) {
    seq = json['seq'];
    title = json['title'];
    message = json['message'];
    photoMobile = json['photoMobile'];
    ndata = json['ndata'];
    operateDate = json['operate_date'];
    status = json['status'];
    type = json['TYPE'];
    memberRef = json['member_ref'];
  }
  int? seq;
  String? title;
  String? message;
  String? photoMobile;
  String? ndata;
  String? operateDate;
  String? status;
  String? type;
  String? memberRef;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seq'] = seq;
    map['title'] = title;
    map['message'] = message;
    map['photoMobile'] = photoMobile;
    map['ndata'] = ndata;
    map['operate_date'] = operateDate;
    map['status'] = status;
    map['TYPE'] = type;
    map['member_ref'] = memberRef;
    return map;
  }
}
