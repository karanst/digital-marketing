import 'dart:convert';
/// status : true
/// message : "Categories list"
/// data : [{"id":"1","title":"Festival Timeline","slug":"festival-timeline","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/Large_dib.jpg","status":"1","subcat_name":null,"subcat_status":"true"},{"id":"2","title":"Trending","slug":"trending","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/Motivational-Quotes-in-Hindi.jpg","status":"1","subcat_name":null,"subcat_status":"false"},{"id":"3","title":"Motivational Thoughts","slug":"motivational-thoughts","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/Hindi-Life-Quotes-about-World-Dunya.jpg","status":"1","subcat_name":null,"subcat_status":"false"},{"id":"61","title":"Good Thoughts ( Suvichar)","slug":"good-thoughts-suvichar","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/digital_marketing_Marketing1.png","status":"1","subcat_name":null,"subcat_status":"false"},{"id":"62","title":"Good Morning","slug":"good-morning","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/Desert1.jpg","status":"1","subcat_name":null,"subcat_status":"false"},{"id":"63","title":"Weekly Post (  वार  )","slug":"weekly-post-वर","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/15.jpg","status":"1","subcat_name":null,"subcat_status":"true"},{"id":"64","title":"COW ( गो रक्षा )","slug":"cow-ग-रकष","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/WhatsApp_Image_2022-04-26_at_10_56_40_AM.jpeg","status":"1","subcat_name":null,"subcat_status":"false"},{"id":"67","title":"Devotional","slug":"devotional","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/WhatsApp_Image_2022-04-26_at_10_56_40_AM3.jpeg","status":"1","subcat_name":null,"subcat_status":"false"},{"id":"68","title":"Indian Army","slug":"indian-army","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/digital_marketing_Seva_Emitra.png","status":"1","subcat_name":null,"subcat_status":"false"},{"id":"69","title":"Marwad Special","slug":"marwad-special","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/digital_marketing_Seva_Emitra_(1).png","status":"1","subcat_name":null,"subcat_status":"false"},{"id":"70","title":"Category","slug":"category","parent":"0","leval":"0","description":"","image":"http://sundhanetwark.com/Admin/uploads/category/digital_marketing_Seva_Emitra_(1)1.png","status":"1","subcat_name":null,"subcat_status":"false"}]

GetCategoryModel getCategoryModelFromJson(String str) => GetCategoryModel.fromJson(json.decode(str));
String getCategoryModelToJson(GetCategoryModel data) => json.encode(data.toJson());
class GetCategoryModel {
  GetCategoryModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetCategoryModel.fromJson(dynamic json) {
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
GetCategoryModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => GetCategoryModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
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
/// title : "Festival Timeline"
/// slug : "festival-timeline"
/// parent : "0"
/// leval : "0"
/// description : ""
/// image : "http://sundhanetwark.com/Admin/uploads/category/Large_dib.jpg"
/// status : "1"
/// subcat_name : null
/// subcat_status : "true"

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
      dynamic subcatName, 
      String? subcatStatus,}){
    _id = id;
    _title = title;
    _slug = slug;
    _parent = parent;
    _leval = leval;
    _description = description;
    _image = image;
    _status = status;
    _subcatName = subcatName;
    _subcatStatus = subcatStatus;
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
    _subcatStatus = json['subcat_status'];
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
  String? _subcatStatus;
Data copyWith({  String? id,
  String? title,
  String? slug,
  String? parent,
  String? leval,
  String? description,
  String? image,
  String? status,
  dynamic subcatName,
  String? subcatStatus,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  slug: slug ?? _slug,
  parent: parent ?? _parent,
  leval: leval ?? _leval,
  description: description ?? _description,
  image: image ?? _image,
  status: status ?? _status,
  subcatName: subcatName ?? _subcatName,
  subcatStatus: subcatStatus ?? _subcatStatus,
);
  String? get id => _id;
  String? get title => _title;
  String? get slug => _slug;
  String? get parent => _parent;
  String? get leval => _leval;
  String? get description => _description;
  String? get image => _image;
  String? get status => _status;
  dynamic get subcatName => _subcatName;
  String? get subcatStatus => _subcatStatus;

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
    map['subcat_status'] = _subcatStatus;
    return map;
  }

}