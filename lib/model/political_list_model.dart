import 'dart:convert';
/// status : true
/// message : "Categories list"
/// data : [{"id":"4","user_id":"15","business_category":"3","political_name":"Bhai ki party","political_desgination":"AKELA ","political_mobile":"7049202362","political_mobile2":"","facebook_link":"","teitter_link":"","instagram_link":"","linkdin_link":"","youtube_link":"","business_logo":"https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641561708.jpg","watermark":"https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641561708.jpg","left_side":"https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641561708.jpg","right_side":"https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641561708.jpg"}]

PoliticalListModel politicalListModelFromJson(String str) => PoliticalListModel.fromJson(json.decode(str));
String politicalListModelToJson(PoliticalListModel data) => json.encode(data.toJson());
class PoliticalListModel {
  PoliticalListModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PoliticalListModel.fromJson(dynamic json) {
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

/// id : "4"
/// user_id : "15"
/// business_category : "3"
/// political_name : "Bhai ki party"
/// political_desgination : "AKELA "
/// political_mobile : "7049202362"
/// political_mobile2 : ""
/// facebook_link : ""
/// teitter_link : ""
/// instagram_link : ""
/// linkdin_link : ""
/// youtube_link : ""
/// business_logo : "https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641561708.jpg"
/// watermark : "https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641561708.jpg"
/// left_side : "https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641561708.jpg"
/// right_side : "https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641561708.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? userId, 
      String? businessCategory, 
      String? politicalName, 
      String? politicalDesgination, 
      String? politicalMobile, 
      String? politicalMobile2, 
      String? facebookLink, 
      String? teitterLink, 
      String? instagramLink, 
      String? linkdinLink, 
      String? youtubeLink, 
      String? businessLogo, 
      String? watermark, 
      String? leftSide, 
      String? rightSide,}){
    _id = id;
    _userId = userId;
    _businessCategory = businessCategory;
    _politicalName = politicalName;
    _politicalDesgination = politicalDesgination;
    _politicalMobile = politicalMobile;
    _politicalMobile2 = politicalMobile2;
    _facebookLink = facebookLink;
    _teitterLink = teitterLink;
    _instagramLink = instagramLink;
    _linkdinLink = linkdinLink;
    _youtubeLink = youtubeLink;
    _businessLogo = businessLogo;
    _watermark = watermark;
    _leftSide = leftSide;
    _rightSide = rightSide;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _businessCategory = json['business_category'];
    _politicalName = json['political_name'];
    _politicalDesgination = json['political_desgination'];
    _politicalMobile = json['political_mobile'];
    _politicalMobile2 = json['political_mobile2'];
    _facebookLink = json['facebook_link'];
    _teitterLink = json['teitter_link'];
    _instagramLink = json['instagram_link'];
    _linkdinLink = json['linkdin_link'];
    _youtubeLink = json['youtube_link'];
    _businessLogo = json['business_logo'];
    _watermark = json['watermark'];
    _leftSide = json['left_side'];
    _rightSide = json['right_side'];
  }
  String? _id;
  String? _userId;
  String? _businessCategory;
  String? _politicalName;
  String? _politicalDesgination;
  String? _politicalMobile;
  String? _politicalMobile2;
  String? _facebookLink;
  String? _teitterLink;
  String? _instagramLink;
  String? _linkdinLink;
  String? _youtubeLink;
  String? _businessLogo;
  String? _watermark;
  String? _leftSide;
  String? _rightSide;

  String? get id => _id;
  String? get userId => _userId;
  String? get businessCategory => _businessCategory;
  String? get politicalName => _politicalName;
  String? get politicalDesgination => _politicalDesgination;
  String? get politicalMobile => _politicalMobile;
  String? get politicalMobile2 => _politicalMobile2;
  String? get facebookLink => _facebookLink;
  String? get teitterLink => _teitterLink;
  String? get instagramLink => _instagramLink;
  String? get linkdinLink => _linkdinLink;
  String? get youtubeLink => _youtubeLink;
  String? get businessLogo => _businessLogo;
  String? get watermark => _watermark;
  String? get leftSide => _leftSide;
  String? get rightSide => _rightSide;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['business_category'] = _businessCategory;
    map['political_name'] = _politicalName;
    map['political_desgination'] = _politicalDesgination;
    map['political_mobile'] = _politicalMobile;
    map['political_mobile2'] = _politicalMobile2;
    map['facebook_link'] = _facebookLink;
    map['teitter_link'] = _teitterLink;
    map['instagram_link'] = _instagramLink;
    map['linkdin_link'] = _linkdinLink;
    map['youtube_link'] = _youtubeLink;
    map['business_logo'] = _businessLogo;
    map['watermark'] = _watermark;
    map['left_side'] = _leftSide;
    map['right_side'] = _rightSide;
    return map;
  }

}