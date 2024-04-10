import 'dart:convert';
/// message : "OTP verified success"
/// type : "success"

CheckOtpModel checkOtpModelFromJson(String str) => CheckOtpModel.fromJson(json.decode(str));
String checkOtpModelToJson(CheckOtpModel data) => json.encode(data.toJson());
class CheckOtpModel {
  CheckOtpModel({
      String? message, 
      String? type,}){
    _message = message;
    _type = type;
}

  CheckOtpModel.fromJson(dynamic json) {
    _message = json['message'];
    _type = json['type'];
  }
  String? _message;
  String? _type;
CheckOtpModel copyWith({  String? message,
  String? type,
}) => CheckOtpModel(  message: message ?? _message,
  type: type ?? _type,
);
  String? get message => _message;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['type'] = _type;
    return map;
  }

}