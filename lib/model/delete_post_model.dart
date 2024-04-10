import 'dart:convert';
/// status : true
/// message : "post Delete successfully"

DeletePostModel deletePostModelFromJson(String str) => DeletePostModel.fromJson(json.decode(str));
String deletePostModelToJson(DeletePostModel data) => json.encode(data.toJson());
class DeletePostModel {
  DeletePostModel({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  DeletePostModel.fromJson(dynamic json) {
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