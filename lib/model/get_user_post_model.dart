import 'dart:convert';
/// status : true
/// message : "Get User Post "
/// data : [{"id":"42","category_id":"1","language_id":"3","user_id":"14","type":"image","post":"https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/user_upload/UPI1641409273.jpg","insert_date":"2022-01-05 19:01:13"}]

GetUserPostModel getUserPostModelFromJson(String str) => GetUserPostModel.fromJson(json.decode(str));
String getUserPostModelToJson(GetUserPostModel data) => json.encode(data.toJson());
class GetUserPostModel {
  GetUserPostModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetUserPostModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "42"
/// category_id : "1"
/// language_id : "3"
/// user_id : "14"
/// type : "image"
/// post : "https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/user_upload/UPI1641409273.jpg"
/// insert_date : "2022-01-05 19:01:13"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? categoryId, 
      String? languageId, 
      String? userId, 
      String? type, 
      String? post, 
      String? insertDate,}){
    _id = id;
    _categoryId = categoryId;
    _languageId = languageId;
    _userId = userId;
    _type = type;
    _post = post;
    _insertDate = insertDate;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _languageId = json['language_id'];
    _userId = json['user_id'];
    _type = json['type'];
    _post = json['post'];
    _insertDate = json['insert_date'];
  }
  String? _id;
  String? _categoryId;
  String? _languageId;
  String? _userId;
  String? _type;
  String? _post;
  String? _insertDate;

  String? get id => _id;
  String? get categoryId => _categoryId;
  String? get languageId => _languageId;
  String? get userId => _userId;
  String? get type => _type;
  String? get post => _post;
  String? get insertDate => _insertDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_id'] = _categoryId;
    map['language_id'] = _languageId;
    map['user_id'] = _userId;
    map['type'] = _type;
    map['post'] = _post;
    map['insert_date'] = _insertDate;
    return map;
  }

}