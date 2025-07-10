
class SingleUserModel {
  dynamic userId;
  dynamic id;
  String? title;
  String? body;

  SingleUserModel({this.userId, this.id, this.title, this.body});

  SingleUserModel.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["id"] = id;
    _data["title"] = title;
    _data["body"] = body;
    return _data;
  }
}