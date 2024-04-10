import 'dart:convert';
/// status : true
/// otp : 5228
/// phone_number : "7049020363"
/// message : "User added successfully "
/// data : {"user_id":"488"}

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));
String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());
class SignUpModel {
  SignUpModel({
      bool? status, 
      int? otp, 
      String? phoneNumber, 
      String? message, 
      Data? data,}){
    _status = status;
    _otp = otp;
    _phoneNumber = phoneNumber;
    _message = message;
    _data = data;
}

  SignUpModel.fromJson(dynamic json) {
    _status = json['status'];
    _otp = json['otp'];
    _phoneNumber = json['phone_number'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  int? _otp;
  String? _phoneNumber;
  String? _message;
  Data? _data;

  bool? get status => _status;
  int? get otp => _otp;
  String? get phoneNumber => _phoneNumber;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['otp'] = _otp;
    map['phone_number'] = _phoneNumber;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user_id : "488"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? userId,}){
    _userId = userId;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
  }
  String? _userId;

  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    return map;
  }

}