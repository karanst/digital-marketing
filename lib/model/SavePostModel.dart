import 'dart:convert';
/// status : true
/// message : "User Post Added Successfully"

SavePostModel savePostModelFromJson(String str) => SavePostModel.fromJson(json.decode(str));
String savePostModelToJson(SavePostModel data) => json.encode(data.toJson());
class SavePostModel {
  SavePostModel({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  SavePostModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  bool? _status;
  String? _message;

  bool? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}