import 'dart:convert';
/// status : true
/// message : "Plan Purchase Successfully"

PurchaseModel purchaseModelFromJson(String str) => PurchaseModel.fromJson(json.decode(str));
String purchaseModelToJson(PurchaseModel data) => json.encode(data.toJson());
class PurchaseModel {
  PurchaseModel({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  PurchaseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  bool? _status;
  String? _message;
PurchaseModel copyWith({  bool? status,
  String? message,
}) => PurchaseModel(  status: status ?? _status,
  message: message ?? _message,
);
  bool? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}