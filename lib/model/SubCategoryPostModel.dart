import 'dart:convert';
/// status : true
/// message : "Sub Category list"
/// data : [{"id":"18","title":"Navaratri  26 September","cat_type":"1","category_id":"1","sub_cat_id":"2","language_id":"3","user_id":"0","type":"Image","post":"1652282466sharad-navratri.jpg","date":"2022-05-11","status":"1","insert_date":"2022-05-11 08:21:06","update_date":"2022-05-11 22:53:51"}]
/// img_path : "https://sundhanetwark.com/Admin/uploads/post/"

SubCategoryPostModel subCategoryPostModelFromJson(String str) => SubCategoryPostModel.fromJson(json.decode(str));
String subCategoryPostModelToJson(SubCategoryPostModel data) => json.encode(data.toJson());
class SubCategoryPostModel {
  SubCategoryPostModel({
      bool? status, 
      String? message, 
      List<Data>? data, 
      String? imgPath,}){
    _status = status;
    _message = message;
    _data = data;
    _imgPath = imgPath;
}

  SubCategoryPostModel.fromJson(dynamic json) {
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
SubCategoryPostModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
  String? imgPath,
}) => SubCategoryPostModel(  status: status ?? _status,
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

/// id : "18"
/// title : "Navaratri  26 September"
/// cat_type : "1"
/// category_id : "1"
/// sub_cat_id : "2"
/// language_id : "3"
/// user_id : "0"
/// type : "Image"
/// post : "1652282466sharad-navratri.jpg"
/// date : "2022-05-11"
/// status : "1"
/// insert_date : "2022-05-11 08:21:06"
/// update_date : "2022-05-11 22:53:51"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? title, 
      String? catType, 
      String? categoryId, 
      String? subCatId, 
      String? languageId, 
      String? userId, 
      String? type, 
      String? post, 
      String? date, 
      String? status, 
      String? insertDate, 
      String? updateDate,}){
    _id = id;
    _title = title;
    _catType = catType;
    _categoryId = categoryId;
    _subCatId = subCatId;
    _languageId = languageId;
    _userId = userId;
    _type = type;
    _post = post;
    _date = date;
    _status = status;
    _insertDate = insertDate;
    _updateDate = updateDate;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _catType = json['cat_type'];
    _categoryId = json['category_id'];
    _subCatId = json['sub_cat_id'];
    _languageId = json['language_id'];
    _userId = json['user_id'];
    _type = json['type'];
    _post = json['post'];
    _date = json['date'];
    _status = json['status'];
    _insertDate = json['insert_date'];
    _updateDate = json['update_date'];
  }
  String? _id;
  String? _title;
  String? _catType;
  String? _categoryId;
  String? _subCatId;
  String? _languageId;
  String? _userId;
  String? _type;
  String? _post;
  String? _date;
  String? _status;
  String? _insertDate;
  String? _updateDate;
Data copyWith({  String? id,
  String? title,
  String? catType,
  String? categoryId,
  String? subCatId,
  String? languageId,
  String? userId,
  String? type,
  String? post,
  String? date,
  String? status,
  String? insertDate,
  String? updateDate,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  catType: catType ?? _catType,
  categoryId: categoryId ?? _categoryId,
  subCatId: subCatId ?? _subCatId,
  languageId: languageId ?? _languageId,
  userId: userId ?? _userId,
  type: type ?? _type,
  post: post ?? _post,
  date: date ?? _date,
  status: status ?? _status,
  insertDate: insertDate ?? _insertDate,
  updateDate: updateDate ?? _updateDate,
);
  String? get id => _id;
  String? get title => _title;
  String? get catType => _catType;
  String? get categoryId => _categoryId;
  String? get subCatId => _subCatId;
  String? get languageId => _languageId;
  String? get userId => _userId;
  String? get type => _type;
  String? get post => _post;
  String? get date => _date;
  String? get status => _status;
  String? get insertDate => _insertDate;
  String? get updateDate => _updateDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['cat_type'] = _catType;
    map['category_id'] = _categoryId;
    map['sub_cat_id'] = _subCatId;
    map['language_id'] = _languageId;
    map['user_id'] = _userId;
    map['type'] = _type;
    map['post'] = _post;
    map['date'] = _date;
    map['status'] = _status;
    map['insert_date'] = _insertDate;
    map['update_date'] = _updateDate;
    return map;
  }

}