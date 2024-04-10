import 'dart:convert';
/// status : true
/// message : "Plan list"
/// data : [{"id":"8","user_id":"17","date":"2022-03-14 09:31:25","image":"http://sundhanetwark.com/Admin/uploads/post_image/"},{"id":"9","user_id":"17","date":"2022-03-14 10:29:19","image":"http://sundhanetwark.com/Admin/uploads/post_image/"},{"id":"10","user_id":"17","date":"2022-03-14 10:31:24","image":"http://sundhanetwark.com/Admin/uploads/post_image/"},{"id":"11","user_id":"17","date":"2022-03-14 10:35:15","image":"http://sundhanetwark.com/Admin/uploads/post_image/1647254115images.jpg"},{"id":"12","user_id":"17","date":"2022-03-14 10:36:52","image":"http://sundhanetwark.com/Admin/uploads/post_image/"},{"id":"13","user_id":"17","date":"2022-03-14 10:40:43","image":"http://sundhanetwark.com/Admin/uploads/post_image/"},{"id":"14","user_id":"17","date":"2022-03-14 10:41:41","image":"http://sundhanetwark.com/Admin/uploads/post_image/"},{"id":"15","user_id":"17","date":"2022-03-14 10:42:06","image":"http://sundhanetwark.com/Admin/uploads/post_image/1647254526loginlogo.png"},{"id":"18","user_id":"17","date":"2022-03-15 07:57:49","image":"http://sundhanetwark.com/Admin/uploads/post_image/"},{"id":"19","user_id":"17","date":"2022-03-15 08:12:29","image":"http://sundhanetwark.com/Admin/uploads/post_image/16473319491647331948020.png"}]

GetEditPostModel getEditPostModelFromJson(String str) => GetEditPostModel.fromJson(json.decode(str));
String getEditPostModelToJson(GetEditPostModel data) => json.encode(data.toJson());
class GetEditPostModel {
  GetEditPostModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetEditPostModel.fromJson(dynamic json) {
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

/// id : "8"
/// user_id : "17"
/// date : "2022-03-14 09:31:25"
/// image : "http://sundhanetwark.com/Admin/uploads/post_image/"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? userId, 
      String? date, 
      String? image,}){
    _id = id;
    _userId = userId;
    _date = date;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _date = json['date'];
    _image = json['image'];
  }
  String? _id;
  String? _userId;
  String? _date;
  String? _image;

  String? get id => _id;
  String? get userId => _userId;
  String? get date => _date;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['date'] = _date;
    map['image'] = _image;
    return map;
  }
}