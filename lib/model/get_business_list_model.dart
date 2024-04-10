import 'dart:convert';
/// status : true
/// message : "Categories list"
/// data : [{"id":"8","business_name":"test","business_mobile":"789645451","user_id":"4","business_mobile2":"78965412","business_email":"test@test.com","business_website":"test","business_address":"sdfasdf","business_category":"1","facebook_link":"dfsdf","link_twitter":"sdaf","link_instagram":"asdf","link_linkdin":"asdfds","link_youtube":"asadfs","logo":"https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641555674.png","watermark":"https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641555674.jpg"}]

GetBusinessListModel getBusinessListModelFromJson(String str) => GetBusinessListModel.fromJson(json.decode(str));
String getBusinessListModelToJson(GetBusinessListModel data) => json.encode(data.toJson());
class GetBusinessListModel {
  GetBusinessListModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetBusinessListModel.fromJson(dynamic json) {
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
/// business_name : "test"
/// business_mobile : "789645451"
/// user_id : "4"
/// business_mobile2 : "78965412"
/// business_email : "test@test.com"
/// business_website : "test"
/// business_address : "sdfasdf"
/// business_category : "1"
/// facebook_link : "dfsdf"
/// link_twitter : "sdaf"
/// link_instagram : "asdf"
/// link_linkdin : "asdfds"
/// link_youtube : "asadfs"
/// logo : "https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641555674.png"
/// watermark : "https://alphawizztest.tk/digital_marketing-marketing/Admin/api/uploads/business/UPI1641555674.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? businessName, 
      String? businessMobile, 
      String? userId, 
      String? businessMobile2, 
      String? businessEmail, 
      String? businessWebsite, 
      String? businessAddress, 
      String? businessCategory, 
      String? facebookLink, 
      String? linkTwitter, 
      String? linkInstagram, 
      String? linkLinkdin, 
      String? linkYoutube, 
      String? logo, 
      String? watermark,}){
    _id = id;
    _businessName = businessName;
    _businessMobile = businessMobile;
    _userId = userId;
    _businessMobile2 = businessMobile2;
    _businessEmail = businessEmail;
    _businessWebsite = businessWebsite;
    _businessAddress = businessAddress;
    _businessCategory = businessCategory;
    _facebookLink = facebookLink;
    _linkTwitter = linkTwitter;
    _linkInstagram = linkInstagram;
    _linkLinkdin = linkLinkdin;
    _linkYoutube = linkYoutube;
    _logo = logo;
    _watermark = watermark;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _businessName = json['business_name'];
    _businessMobile = json['business_mobile'];
    _userId = json['user_id'];
    _businessMobile2 = json['business_mobile2'];
    _businessEmail = json['business_email'];
    _businessWebsite = json['business_website'];
    _businessAddress = json['business_address'];
    _businessCategory = json['business_category'];
    _facebookLink = json['facebook_link'];
    _linkTwitter = json['link_twitter'];
    _linkInstagram = json['link_instagram'];
    _linkLinkdin = json['link_linkdin'];
    _linkYoutube = json['link_youtube'];
    _logo = json['logo'];
    _watermark = json['watermark'];
  }
  String? _id;
  String? _businessName;
  String? _businessMobile;
  String? _userId;
  String? _businessMobile2;
  String? _businessEmail;
  String? _businessWebsite;
  String? _businessAddress;
  String? _businessCategory;
  String? _facebookLink;
  String? _linkTwitter;
  String? _linkInstagram;
  String? _linkLinkdin;
  String? _linkYoutube;
  String? _logo;
  String? _watermark;

  String? get id => _id;
  String? get businessName => _businessName;
  String? get businessMobile => _businessMobile;
  String? get userId => _userId;
  String? get businessMobile2 => _businessMobile2;
  String? get businessEmail => _businessEmail;
  String? get businessWebsite => _businessWebsite;
  String? get businessAddress => _businessAddress;
  String? get businessCategory => _businessCategory;
  String? get facebookLink => _facebookLink;
  String? get linkTwitter => _linkTwitter;
  String? get linkInstagram => _linkInstagram;
  String? get linkLinkdin => _linkLinkdin;
  String? get linkYoutube => _linkYoutube;
  String? get logo => _logo;
  String? get watermark => _watermark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['business_name'] = _businessName;
    map['business_mobile'] = _businessMobile;
    map['user_id'] = _userId;
    map['business_mobile2'] = _businessMobile2;
    map['business_email'] = _businessEmail;
    map['business_website'] = _businessWebsite;
    map['business_address'] = _businessAddress;
    map['business_category'] = _businessCategory;
    map['facebook_link'] = _facebookLink;
    map['link_twitter'] = _linkTwitter;
    map['link_instagram'] = _linkInstagram;
    map['link_linkdin'] = _linkLinkdin;
    map['link_youtube'] = _linkYoutube;
    map['logo'] = _logo;
    map['watermark'] = _watermark;
    return map;
  }

}