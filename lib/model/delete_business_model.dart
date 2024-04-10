import 'dart:convert';
/// status : true
/// message : "Business Delete successfully"

DeleteBusinessModel deleteBusinessModelFromJson(String str) => DeleteBusinessModel.fromJson(json.decode(str));
String deleteBusinessModelToJson(DeleteBusinessModel data) => json.encode(data.toJson());
class DeleteBusinessModel {
  DeleteBusinessModel({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  DeleteBusinessModel.fromJson(dynamic json) {
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