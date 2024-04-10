import 'dart:convert';
/// status : true
/// message : "Updated Successfully."

UpdateBusiness updateBusinessFromJson(String str) => UpdateBusiness.fromJson(json.decode(str));
String updateBusinessToJson(UpdateBusiness data) => json.encode(data.toJson());
class UpdateBusiness {
  UpdateBusiness({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  UpdateBusiness.fromJson(dynamic json) {
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