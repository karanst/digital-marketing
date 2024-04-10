import 'dart:convert';
/// status : true
/// message : "Get User Post "
/// data : [{"id":"1","title":"Life Quotes","cat_type":"1","category_id":"1","language_id":"1","user_id":"0","type":"Image","post":"1649314699life-quotes-in-hindi-16.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-06 23:58:19","update_date":"2022-04-06 23:58:19","sub_cat_id":"1","cat_id":"1","subcat_name":"Hindi ","subcat_img":"164119836563153.jpg","created_at":"2022-02-27 04:12:08","slug":"life-quotes","parent":"0","leval":"0","description":"","image":"life-quotes-in-hindi-16.jpg"},{"id":"2","title":"Best Motivational Quotes","cat_type":"1","category_id":"1","language_id":"1","user_id":"0","type":"Image","post":"1649314699life-quotes-in-hindi-16.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-06 23:58:19","update_date":"2022-04-06 23:58:19","sub_cat_id":"1","cat_id":"1","subcat_name":"Hindi ","subcat_img":"164119836563153.jpg","created_at":"2022-02-27 04:12:08","slug":"best-motivational-quotes","parent":"0","leval":"0","description":"","image":"Motivational-Quotes-in-Hindi.jpg"},{"id":"1","title":"Life Quotes","cat_type":"1","category_id":"1","language_id":"1","user_id":"0","type":"Image","post":"1649314740Hindi-Life-Quotes-about-World-Dunya.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-06 23:59:00","update_date":"2022-04-06 23:59:00","sub_cat_id":"1","cat_id":"1","subcat_name":"Hindi ","subcat_img":"164119836563153.jpg","created_at":"2022-02-27 04:12:08","slug":"life-quotes","parent":"0","leval":"0","description":"","image":"life-quotes-in-hindi-16.jpg"},{"id":"2","title":"Best Motivational Quotes","cat_type":"1","category_id":"1","language_id":"1","user_id":"0","type":"Image","post":"1649314740Hindi-Life-Quotes-about-World-Dunya.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-06 23:59:00","update_date":"2022-04-06 23:59:00","sub_cat_id":"1","cat_id":"1","subcat_name":"Hindi ","subcat_img":"164119836563153.jpg","created_at":"2022-02-27 04:12:08","slug":"best-motivational-quotes","parent":"0","leval":"0","description":"","image":"Motivational-Quotes-in-Hindi.jpg"},{"id":"1","title":"Life Quotes","cat_type":"1","category_id":"1","language_id":"1","user_id":"0","type":"Image","post":"1649315481download86.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-07 00:11:21","update_date":"2022-04-07 00:11:46","sub_cat_id":"1","cat_id":"1","subcat_name":"Hindi ","subcat_img":"164119836563153.jpg","created_at":"2022-02-27 04:12:08","slug":"life-quotes","parent":"0","leval":"0","description":"","image":"life-quotes-in-hindi-16.jpg"},{"id":"2","title":"Best Motivational Quotes","cat_type":"1","category_id":"1","language_id":"1","user_id":"0","type":"Image","post":"1649315481download86.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-07 00:11:21","update_date":"2022-04-07 00:11:46","sub_cat_id":"1","cat_id":"1","subcat_name":"Hindi ","subcat_img":"164119836563153.jpg","created_at":"2022-02-27 04:12:08","slug":"best-motivational-quotes","parent":"0","leval":"0","description":"","image":"Motivational-Quotes-in-Hindi.jpg"}]
/// image_url : "http://sundhanetwark.com/Admin/api/uploads/user_upload/"

ShowPostByCatIdModel showPostByCatIdModelFromJson(String str) => ShowPostByCatIdModel.fromJson(json.decode(str));
String showPostByCatIdModelToJson(ShowPostByCatIdModel data) => json.encode(data.toJson());
class ShowPostByCatIdModel {
  ShowPostByCatIdModel({
      bool? status, 
      String? message, 
      List<Data>? data, 
      String? imageUrl,}){
    _status = status;
    _message = message;
    _data = data;
    _imageUrl = imageUrl;
}

  ShowPostByCatIdModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _imageUrl = json['image_url'];
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
  String? _imageUrl;
ShowPostByCatIdModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
  String? imageUrl,
}) => ShowPostByCatIdModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  imageUrl: imageUrl ?? _imageUrl,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['image_url'] = _imageUrl;
    return map;
  }

}

/// id : "1"
/// title : "Life Quotes"
/// cat_type : "1"
/// category_id : "1"
/// language_id : "1"
/// user_id : "0"
/// type : "Image"
/// post : "1649314699life-quotes-in-hindi-16.jpg"
/// date : "2022-04-07"
/// status : "1"
/// insert_date : "2022-04-06 23:58:19"
/// update_date : "2022-04-06 23:58:19"
/// sub_cat_id : "1"
/// cat_id : "1"
/// subcat_name : "Hindi "
/// subcat_img : "164119836563153.jpg"
/// created_at : "2022-02-27 04:12:08"
/// slug : "life-quotes"
/// parent : "0"
/// leval : "0"
/// description : ""
/// image : "life-quotes-in-hindi-16.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? title, 
      String? catType, 
      String? categoryId, 
      String? languageId, 
      String? userId, 
      String? type, 
      String? post, 
      String? date, 
      String? status, 
      String? insertDate, 
      String? updateDate, 
      String? subCatId, 
      String? catId, 
      String? subcatName, 
      String? subcatImg, 
      String? createdAt, 
      String? slug, 
      String? parent, 
      String? leval, 
      String? description, 
      String? image,}){
    _id = id;
    _title = title;
    _catType = catType;
    _categoryId = categoryId;
    _languageId = languageId;
    _userId = userId;
    _type = type;
    _post = post;
    _date = date;
    _status = status;
    _insertDate = insertDate;
    _updateDate = updateDate;
    _subCatId = subCatId;
    _catId = catId;
    _subcatName = subcatName;
    _subcatImg = subcatImg;
    _createdAt = createdAt;
    _slug = slug;
    _parent = parent;
    _leval = leval;
    _description = description;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _catType = json['cat_type'];
    _categoryId = json['category_id'];
    _languageId = json['language_id'];
    _userId = json['user_id'];
    _type = json['type'];
    _post = json['post'];
    _date = json['date'];
    _status = json['status'];
    _insertDate = json['insert_date'];
    _updateDate = json['update_date'];
    _subCatId = json['sub_cat_id'];
    _catId = json['cat_id'];
    _subcatName = json['subcat_name'];
    _subcatImg = json['subcat_img'];
    _createdAt = json['created_at'];
    _slug = json['slug'];
    _parent = json['parent'];
    _leval = json['leval'];
    _description = json['description'];
    _image = json['image'];
  }
  String? _id;
  String? _title;
  String? _catType;
  String? _categoryId;
  String? _languageId;
  String? _userId;
  String? _type;
  String? _post;
  String? _date;
  String? _status;
  String? _insertDate;
  String? _updateDate;
  String? _subCatId;
  String? _catId;
  String? _subcatName;
  String? _subcatImg;
  String? _createdAt;
  String? _slug;
  String? _parent;
  String? _leval;
  String? _description;
  String? _image;
Data copyWith({  String? id,
  String? title,
  String? catType,
  String? categoryId,
  String? languageId,
  String? userId,
  String? type,
  String? post,
  String? date,
  String? status,
  String? insertDate,
  String? updateDate,
  String? subCatId,
  String? catId,
  String? subcatName,
  String? subcatImg,
  String? createdAt,
  String? slug,
  String? parent,
  String? leval,
  String? description,
  String? image,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  catType: catType ?? _catType,
  categoryId: categoryId ?? _categoryId,
  languageId: languageId ?? _languageId,
  userId: userId ?? _userId,
  type: type ?? _type,
  post: post ?? _post,
  date: date ?? _date,
  status: status ?? _status,
  insertDate: insertDate ?? _insertDate,
  updateDate: updateDate ?? _updateDate,
  subCatId: subCatId ?? _subCatId,
  catId: catId ?? _catId,
  subcatName: subcatName ?? _subcatName,
  subcatImg: subcatImg ?? _subcatImg,
  createdAt: createdAt ?? _createdAt,
  slug: slug ?? _slug,
  parent: parent ?? _parent,
  leval: leval ?? _leval,
  description: description ?? _description,
  image: image ?? _image,
);
  String? get id => _id;
  String? get title => _title;
  String? get catType => _catType;
  String? get categoryId => _categoryId;
  String? get languageId => _languageId;
  String? get userId => _userId;
  String? get type => _type;
  String? get post => _post;
  String? get date => _date;
  String? get status => _status;
  String? get insertDate => _insertDate;
  String? get updateDate => _updateDate;
  String? get subCatId => _subCatId;
  String? get catId => _catId;
  String? get subcatName => _subcatName;
  String? get subcatImg => _subcatImg;
  String? get createdAt => _createdAt;
  String? get slug => _slug;
  String? get parent => _parent;
  String? get leval => _leval;
  String? get description => _description;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['cat_type'] = _catType;
    map['category_id'] = _categoryId;
    map['language_id'] = _languageId;
    map['user_id'] = _userId;
    map['type'] = _type;
    map['post'] = _post;
    map['date'] = _date;
    map['status'] = _status;
    map['insert_date'] = _insertDate;
    map['update_date'] = _updateDate;
    map['sub_cat_id'] = _subCatId;
    map['cat_id'] = _catId;
    map['subcat_name'] = _subcatName;
    map['subcat_img'] = _subcatImg;
    map['created_at'] = _createdAt;
    map['slug'] = _slug;
    map['parent'] = _parent;
    map['leval'] = _leval;
    map['description'] = _description;
    map['image'] = _image;
    return map;
  }

}