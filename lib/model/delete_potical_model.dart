import 'dart:convert';
/// status : true
/// message : "Business Delete successfully"

DeletePoticalModel deletePoticalModelFromJson(String str) => DeletePoticalModel.fromJson(json.decode(str));
String deletePoticalModelToJson(DeletePoticalModel data) => json.encode(data.toJson());
class DeletePoticalModel {
  DeletePoticalModel({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  DeletePoticalModel.fromJson(dynamic json) {
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