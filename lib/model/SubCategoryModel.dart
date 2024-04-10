import 'dart:convert';
/// status : true
/// message : "Post list"
/// data : [{"id":"2","cat_id":"1","subcat_title":"Rakhabandhan","slug":"rakhabandhan","subcat_img":"raksha-bandhan-12.jpg","date":"2022-05-22","status":"0","created_at":"2022-05-11 20:11:48"},{"id":"3","cat_id":"1","subcat_title":"Sharad Navratri","slug":"sharad-navratri","subcat_img":"sharad-navratri.jpg","date":"0000-00-00","status":"0","created_at":"2022-05-11 20:13:28"},{"id":"9","cat_id":"1","subcat_title":"Jagannath Rath Yatra","slug":"jagannath-rath-yatra","subcat_img":"376809-jaganath-rath-yatra-preparatioin-jpg710x400xt.jpg","date":"2022-07-01","status":"0","created_at":"2022-05-18 11:23:16"}]
/// img_path : "https://sundhanetwark.com/Admin/uploads/category/"

SubCategoryModel subCategoryModelFromJson(String str) => SubCategoryModel.fromJson(json.decode(str));
String subCategoryModelToJson(SubCategoryModel data) => json.encode(data.toJson());
class SubCategoryModel {
  SubCategoryModel({
      bool? status, 
      String? message, 
      List<Data>? data, 
      String? imgPath,}){
    _status = status;
    _message = message;
    _data = data;
    _imgPath = imgPath;
}

  SubCategoryModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _imgPath = json['img_path'];
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
  String? _imgPath;
SubCategoryModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
  String? imgPath,
}) => SubCategoryModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  imgPath: imgPath ?? _imgPath,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;
  String? get imgPath => _imgPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['img_path'] = _imgPath;
    return map;
  }

}

/// id : "2"
/// cat_id : "1"
/// subcat_title : "Rakhabandhan"
/// slug : "rakhabandhan"
/// subcat_img : "raksha-bandhan-12.jpg"
/// date : "2022-05-22"
/// status : "0"
/// created_at : "2022-05-11 20:11:48"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? catId, 
      String? subcatTitle, 
      String? slug, 
      String? subcatImg, 
      String? date, 
      String? status, 
      String? createdAt,}){
    _id = id;
    _catId = catId;
    _subcatTitle = subcatTitle;
    _slug = slug;
    _subcatImg = subcatImg;
    _date = date;
    _status = status;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _catId = json['cat_id'];
    _subcatTitle = json['subcat_title'];
    _slug = json['slug'];
    _subcatImg = json['subcat_img'];
    _date = json['date'];
    _status = json['status'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _catId;
  String? _subcatTitle;
  String? _slug;
  String? _subcatImg;
  String? _date;
  String? _status;
  String? _createdAt;
Data copyWith({  String? id,
  String? catId,
  String? subcatTitle,
  String? slug,
  String? subcatImg,
  String? date,
  String? status,
  String? createdAt,
}) => Data(  id: id ?? _id,
  catId: catId ?? _catId,
  subcatTitle: subcatTitle ?? _subcatTitle,
  slug: slug ?? _slug,
  subcatImg: subcatImg ?? _subcatImg,
  date: date ?? _date,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get catId => _catId;
  String? get subcatTitle => _subcatTitle;
  String? get slug => _slug;
  String? get subcatImg => _subcatImg;
  String? get date => _date;
  String? get status => _status;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cat_id'] = _catId;
    map['subcat_title'] = _subcatTitle;
    map['slug'] = _slug;
    map['subcat_img'] = _subcatImg;
    map['date'] = _date;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    return map;
  }

}