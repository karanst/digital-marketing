import 'dart:convert';
/// status : true
/// message : "Sub Category list"
/// data : [{"id":"1","title":"जिंदगी पर अनमोल विचार ","cat_type":"1","category_id":"1","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"1649314699life-quotes-in-hindi-16.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-06 23:58:19","update_date":"2022-04-06 23:58:19"},{"id":"2","title":"जिंदगी पर अनमोल विचार ","cat_type":"1","category_id":"1","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"1649314740Hindi-Life-Quotes-about-World-Dunya.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-06 23:59:00","update_date":"2022-04-06 23:59:00"},{"id":"3","title":"Motivational Quotes","cat_type":"1","category_id":"2","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"1649315256motivational-quotes-in-hindi1.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-07 00:07:36","update_date":"2022-04-07 00:07:36"},{"id":"4","title":"Motivational Quotes","cat_type":"2","category_id":"1","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"1649315481download86.jpg","date":"2022-04-07","status":"1","insert_date":"2022-04-07 00:11:21","update_date":"2022-04-08 07:51:43"},{"id":"5","title":"GOOD NIGHT","cat_type":"3","category_id":"4","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Video","post":"1649315953GoodNightFriends--Goodnightvideo--Goodnightstatus--GoodNightWhatsAppstatusvideo.mp4","date":"2022-04-07","status":"1","insert_date":"2022-04-07 00:19:13","update_date":"2022-04-07 00:19:13"},{"id":"6","title":"XYZ","cat_type":"1","category_id":"5","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"16494810862.jpg","date":"2022-04-09","status":"1","insert_date":"2022-04-08 22:11:26","update_date":"2022-04-08 22:11:26"},{"id":"7","title":"XTZ","cat_type":"1","category_id":"5","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"16494811833.jpg","date":"2022-04-09","status":"1","insert_date":"2022-04-08 22:13:03","update_date":"2022-04-08 22:13:03"},{"id":"11","title":"today","cat_type":"1","category_id":"1","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"16510339982.jpg","date":"2022-04-27","status":"1","insert_date":"2022-04-26 21:33:18","update_date":"2022-04-26 21:33:18"},{"id":"12","title":"test","cat_type":"1","category_id":"1","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"16511536209.jpg","date":"2022-04-27","status":"1","insert_date":"2022-04-28 06:47:00","update_date":"2022-04-28 06:47:00"},{"id":"14","title":"re test","cat_type":"1","category_id":"1","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"1651210850EN1.jpg","date":"2022-04-27","status":"1","insert_date":"2022-04-28 22:40:50","update_date":"2022-04-28 22:40:50"},{"id":"15","title":"","cat_type":"1","category_id":"62","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"1651213170GOODMORNINGEN1.jpg","date":"0000-00-00","status":"1","insert_date":"2022-04-28 23:19:30","update_date":"2022-04-28 23:19:30"},{"id":"16","title":"","cat_type":"1","category_id":"62","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"1651213191GOODMORNINGHI6.jpg","date":"0000-00-00","status":"1","insert_date":"2022-04-28 23:19:51","update_date":"2022-04-28 23:19:51"},{"id":"17","title":"","cat_type":"1","category_id":"62","sub_cat_id":"0","language_id":"1","user_id":"0","type":"Image","post":"1651213211GOODMORNINGHI20.jpg","date":"0000-00-00","status":"1","insert_date":"2022-04-28 23:20:11","update_date":"2022-04-28 23:20:11"}]
/// img_path : "https://sundhanetwark.com/Admin/uploads/post/"

ShowPostByLanguageIdModel showPostByLanguageIdModelFromJson(String str) => ShowPostByLanguageIdModel.fromJson(json.decode(str));
String showPostByLanguageIdModelToJson(ShowPostByLanguageIdModel data) => json.encode(data.toJson());
class ShowPostByLanguageIdModel {
  ShowPostByLanguageIdModel({
      bool? status, 
      String? message, 
      List<Data>? data, 
      String? imgPath,}){
    _status = status;
    _message = message;
    _data = data;
    _imgPath = imgPath;
}

  ShowPostByLanguageIdModel.fromJson(dynamic json) {
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
ShowPostByLanguageIdModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
  String? imgPath,
}) => ShowPostByLanguageIdModel(  status: status ?? _status,
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

/// id : "1"
/// title : "जिंदगी पर अनमोल विचार "
/// cat_type : "1"
/// category_id : "1"
/// sub_cat_id : "0"
/// language_id : "1"
/// user_id : "0"
/// type : "Image"
/// post : "1649314699life-quotes-in-hindi-16.jpg"
/// date : "2022-04-07"
/// status : "1"
/// insert_date : "2022-04-06 23:58:19"
/// update_date : "2022-04-06 23:58:19"

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