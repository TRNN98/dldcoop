class AddressModel {
  AddressModel({
    this.address,
    this.email,
    this.email2,
    this.fax,
    this.numberPhone1,
    this.txtPhone1,
    this.numberPhone2,
    this.txtPhone2,
    this.numberPhone3,
    this.txtPhone3,
    this.line,
    this.website,
    this.facebook,
    this.map,
  });

  String? address;
  String? email;
  String? email2;
  String? fax;
  String? numberPhone1;
  String? txtPhone1;
  String? numberPhone2;
  String? txtPhone2;
  String? numberPhone3;
  String? txtPhone3;
  String? line;
  String? website;
  String? facebook;
  String? map;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        address: json["address"],
        email: json["email"],
        email2: json["email2"],
        fax: json["fax"],
        numberPhone1: json["number_phone1"],
        txtPhone1: json["txt_phone1"],
        numberPhone2: json["number_phone2"],
        txtPhone2: json["txt_phone2"],
        numberPhone3: json["number_phone3"],
        txtPhone3: json["txt_phone3"],
        line: json["line"],
        website: json["website"],
        facebook: json["facebook"],
        map: json["map"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "email2": email2,
        "fax": fax,
        "number_phone1": numberPhone1,
        "txt_phone1": txtPhone1,
        "number_phone2": numberPhone2,
        "txt_phone2": txtPhone2,
        "number_phone3": numberPhone3,
        "txt_phone3": txtPhone3,
        "line": line,
        "website": website,
        "facebook": facebook,
        "map": map,
      };
}
