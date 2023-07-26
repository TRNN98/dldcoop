class NewsModel {
  NewsModel({
    this.question,
    this.note,
    this.nphoto,
    this.ndata,
    this.date,
  });

  NewsModel.fromJson(dynamic json) {
    question = json['question'];
    note = json['note'];
    nphoto = json['nphoto'];
    ndata = json['ndata'];
    date = json['date'];
  }
  String? question;
  String? note;
  String? nphoto;
  String? ndata;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question'] = question;
    map['note'] = note;
    map['nphoto'] = nphoto;
    map['ndata'] = ndata;
    map['date'] = date;
    return map;
  }
}
