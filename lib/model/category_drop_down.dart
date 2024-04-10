import 'dart:convert';
/// status : true
/// message : "Categories list"
/// data : [{"id":"1","title":"Good Morning","slug":"good-morning","parent":"0","leval":"0","description":"","image":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/category/download_(22).jpg","status":"1","subcat_name":null},{"id":"2","title":"Hindi Quotes","slug":"hindi-quotes","parent":"0","leval":"0","description":"","image":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/category/images_(5).jpg","status":"1","subcat_name":"Hindi "},{"id":"3","title":"good night","slug":"good-night","parent":"0","leval":"0","description":"","image":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/category/download_(23).jpg","status":"1","subcat_name":null},{"id":"4","title":"Historical Places","slug":"historical-places","parent":"0","leval":"0","description":"","image":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/category/download_(24).jpg","status":"1","subcat_name":null},{"id":"5","title":"English Quotes","slug":"english-quotes","parent":"0","leval":"0","description":"","image":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/category/download_(1).png","status":"1","subcat_name":null},{"id":"8","title":"Fastival","slug":"fastival","parent":"0","leval":"0","description":"","image":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/category/IMG_20210818_101530518.jpg","status":"1","subcat_name":null}]

CategoryDropDown categoryDropDownFromJson(String str) => CategoryDropDown.fromJson(json.decode(str));
String categoryDropDownToJson(CategoryDropDown data) => json.encode(data.toJson());
class CategoryDropDown {
  CategoryDropDown({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CategoryDropDown.fromJson(dynamic json) {
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
/// title : "Good Morning"
/// slug : "good-morning"
/// parent : "0"
/// leval : "0"
/// description : ""
/// image : "https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/category/download_(22).jpg"
/// status : "1"
/// subcat_name : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? title, 
      String? slug, 
      String? parent, 
      String? leval, 
      String? description, 
      String? image, 
      String? status, 
      dynamic subcatName,}){
    _id = id;
    _title = title;
    _slug = slug;
    _parent = parent;
    _leval = leval;
    _description = description;
    _image = image;
    _status = status;
    _subcatName = subcatName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _parent = json['parent'];
    _leval = json['leval'];
    _description = json['description'];
    _image = json['image'];
    _status = json['status'];
    _subcatName = json['subcat_name'];
  }
  String? _id;
  String? _title;
  String? _slug;
  String? _parent;
  String? _leval;
  String? _description;
  String? _image;
  String? _status;
  dynamic _subcatName;

  String? get id => _id;
  String? get title => _title;
  String? get slug => _slug;
  String? get parent => _parent;
  String? get leval => _leval;
  String? get description => _description;
  String? get image => _image;
  String? get status => _status;
  dynamic get subcatName => _subcatName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['parent'] = _parent;
    map['leval'] = _leval;
    map['description'] = _description;
    map['image'] = _image;
    map['status'] = _status;
    map['subcat_name'] = _subcatName;
    return map;
  }

}