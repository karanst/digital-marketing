import 'dart:convert';
/// status : true
/// message : "cat list"
/// data : [{"id":"1","cat_id":"0","title":"Good Morning","slug":"good-morning","parent":"0","leval":"0","description":"","image":"download_(22).jpg","status":"1"},{"id":"2","cat_id":"0","title":"Hindi Quotes","slug":"hindi-quotes","parent":"0","leval":"0","description":"","image":"images_(5).jpg","status":"1"},{"id":"3","cat_id":"0","title":"good night","slug":"good-night","parent":"0","leval":"0","description":"","image":"download_(23).jpg","status":"1"},{"id":"4","cat_id":"0","title":"Historical Places","slug":"historical-places","parent":"0","leval":"0","description":"","image":"download_(24).jpg","status":"1"},{"id":"5","cat_id":"0","title":"English Quotes","slug":"english-quotes","parent":"0","leval":"0","description":"","image":"download_(1).png","status":"1"},{"id":"7","cat_id":"0","title":"Electrical Services provider","slug":"electrical services provider","parent":"0","leval":"0","description":"","image":"orange_tshirt.jpg","status":"1"},{"id":"11","cat_id":"0","title":"sunrise","slug":"sunrise","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"14","cat_id":"0","title":"T Shirts","slug":"t-shirts","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"16","cat_id":"0","title":"Agriculture Business","slug":"agriculture business","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"17","cat_id":"0","title":"Automobile Consultant","slug":"automobile consultant","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"19","cat_id":"0","title":"Chemical","slug":"chemical","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"20","cat_id":"0","title":"Clinic Hospital","slug":"clinic hospital","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"21","cat_id":"0","title":"Education Business","slug":"education business","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"23","cat_id":"0","title":"Loan Finance","slug":"loan finance","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"24","cat_id":"0","title":"Fire safety","slug":"fire safety","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"26","cat_id":"0","title":"Electronics Shop","slug":"electronics shop","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"27","cat_id":"0","title":"Fruits & Vegetable","slug":"fruits & vegetable","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"29","cat_id":"0","title":"Graphics Designing","slug":"graphics designing","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"31","cat_id":"0","title":"Home Appliances","slug":"home appliances","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"32","cat_id":"0","title":"Home Automation","slug":"home automation","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"33","cat_id":"0","title":"Import&Export","slug":"import&export","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"34","cat_id":"0","title":"Interior Maker","slug":"interior maker","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"36","cat_id":"0","title":"Lighting Business","slug":"lighting business","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"37","cat_id":"0","title":"Pharmaceutical","slug":"pharmaceutical","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"39","cat_id":"0","title":"Printing press","slug":"printing press","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"41","cat_id":"0","title":"Social Activities","slug":"social activities","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"44","cat_id":"0","title":"Stationery Store","slug":"stationery store","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"45","cat_id":"0","title":"Steel & Aluminum","slug":"steel & aluminum","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"46","cat_id":"0","title":"Tailor","slug":"tailor","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"47","cat_id":"0","title":"Textile Industry","slug":"textile industry","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"48","cat_id":"0","title":"Gift Articles","slug":"gift articles","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"54","cat_id":"0","title":"Ayurvedic","slug":"ayurvedic","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"57","cat_id":"0","title":"Marketing Agency","slug":"marketing agency","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"58","cat_id":"0","title":"Paint Store Services","slug":"paint store services","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"60","cat_id":"0","title":"Transport Service","slug":"transport service","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"62","cat_id":"0","title":"Cement Lathi Business","slug":"cement lathi business","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"64","cat_id":"0","title":"Mobile Sales Repair","slug":"mobile sales repair","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"65","cat_id":"0","title":"Computer Sales And Service","slug":"computer sales and service","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"66","cat_id":"0","title":"IT & Software","slug":"it & software","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"68","cat_id":"0","title":"Electric Bikes","slug":"electric bikes","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"69","cat_id":"0","title":"Civil Contractor","slug":"civil contractor","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"72","cat_id":"0","title":"Housekeeping Cleaning","slug":"housekeeping cleaning","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"75","cat_id":"0","title":"Stock Market Advisor","slug":"stock market advisor","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"76","cat_id":"0","title":"Vehicle GPS Tracker","slug":"vehicle gps tracker","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"80","cat_id":"0","title":"digital_marketing Seva Emitra","slug":"digital_marketing seva emitra","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"81","cat_id":"0","title":"Water proofing","slug":"water proofing","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"82","cat_id":"0","title":"Industry Raw Material","slug":"industry raw material","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"83","cat_id":"0","title":"Kitchenware","slug":"kitchenware","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"},{"id":"84","cat_id":"0","title":"Paint Artist Art Academy","slug":"paint artist art academy","parent":"0","leval":"0","description":"","image":"orange_tshirt2.jpg","status":"1"}]

SearchCategoryModel searchCategoryModelFromJson(String str) => SearchCategoryModel.fromJson(json.decode(str));
String searchCategoryModelToJson(SearchCategoryModel data) => json.encode(data.toJson());
class SearchCategoryModel {
  SearchCategoryModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SearchCategoryModel.fromJson(dynamic json) {
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

/// id : "1"
/// cat_id : "0"
/// title : "Good Morning"
/// slug : "good-morning"
/// parent : "0"
/// leval : "0"
/// description : ""
/// image : "download_(22).jpg"
/// status : "1"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? catId, 
      String? title, 
      String? slug, 
      String? parent, 
      String? leval, 
      String? description, 
      String? image, 
      String? status,}){
    _id = id;
    _catId = catId;
    _title = title;
    _slug = slug;
    _parent = parent;
    _leval = leval;
    _description = description;
    _image = image;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _catId = json['cat_id'];
    _title = json['title'];
    _slug = json['slug'];
    _parent = json['parent'];
    _leval = json['leval'];
    _description = json['description'];
    _image = json['image'];
    _status = json['status'];
  }
  String? _id;
  String? _catId;
  String? _title;
  String? _slug;
  String? _parent;
  String? _leval;
  String? _description;
  String? _image;
  String? _status;

  String? get id => _id;
  String? get catId => _catId;
  String? get title => _title;
  String? get slug => _slug;
  String? get parent => _parent;
  String? get leval => _leval;
  String? get description => _description;
  String? get image => _image;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['title'] = _title;
    map['slug'] = _slug;
    map['parent'] = _parent;
    map['leval'] = _leval;
    map['description'] = _description;
    map['image'] = _image;
    map['status'] = _status;
    return map;
  }

}