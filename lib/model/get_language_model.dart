import 'dart:convert';
/// status : true
/// message : "Languages List."
/// data : [{"sub_cat_id":"1","cat_id":"2","subcat_name":"Hindi ","subcat_img":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/subcat/164119836563153.jpg","created_at":"2022-01-03 08:26:05","status":"1"},{"sub_cat_id":"2","cat_id":"5","subcat_name":"English Language","subcat_img":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/subcat/164120159645708.jpg","created_at":"2022-01-03 09:19:56","status":"1"},{"sub_cat_id":"3","cat_id":"4","subcat_name":"Gujarati language ","subcat_img":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/subcat/164120166784452.jpg","created_at":"2022-01-03 09:21:07","status":"1"},{"sub_cat_id":"4","cat_id":"1","subcat_name":"Marathi language","subcat_img":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/subcat/164120171838754.jpg","created_at":"2022-01-03 09:21:58","status":"1"}]

GetLanguageModel getLanguageModelFromJson(String str) => GetLanguageModel.fromJson(json.decode(str));
String getLanguageModelToJson(GetLanguageModel data) => json.encode(data.toJson());
class GetLanguageModel {
  GetLanguageModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetLanguageModel.fromJson(dynamic json) {
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

/// sub_cat_id : "1"
/// cat_id : "2"
/// subcat_name : "Hindi "
/// subcat_img : "https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/subcat/164119836563153.jpg"
/// created_at : "2022-01-03 08:26:05"
/// status : "1"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? subCatId, 
      String? catId, 
      String? subcatName, 
      String? subcatImg, 
      String? createdAt, 
      String? status,}){
    _subCatId = subCatId;
    _catId = catId;
    _subcatName = subcatName;
    _subcatImg = subcatImg;
    _createdAt = createdAt;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _subCatId = json['sub_cat_id'];
    _catId = json['cat_id'];
    _subcatName = json['subcat_name'];
    _subcatImg = json['subcat_img'];
    _createdAt = json['created_at'];
    _status = json['status'];
  }
  String? _subCatId;
  String? _catId;
  String? _subcatName;
  String? _subcatImg;
  String? _createdAt;
  String? _status;

  String? get subCatId => _subCatId;
  String? get catId => _catId;
  String? get subcatName => _subcatName;
  String? get subcatImg => _subcatImg;
  String? get createdAt => _createdAt;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_cat_id'] = _subCatId;
    map['cat_id'] = _catId;
    map['subcat_name'] = _subcatName;
    map['subcat_img'] = _subcatImg;
    map['created_at'] = _createdAt;
    map['status'] = _status;
    return map;
  }

}