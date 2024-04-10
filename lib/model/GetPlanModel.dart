import 'dart:convert';
/// status : true
/// message : "Plan list"
/// data : [{"id":"17","title":"Business Startup Plan","date":"2 Day","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"19","fechar":["30+ Ready to Use Business Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing Offers + MorePost","Customer Support 24/7"],"insert_date":"2022-02-25 10:59:25","exp_sta":0},{"id":"18","title":"Business Startup Plan","date":"Weekly","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"59","fechar":["30+ Ready to Use Business Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing Offers + MorePost","Unlimited Download Post","Customer Support 24/7"],"insert_date":"2022-02-25 11:18:02","exp_sta":0},{"id":"19","title":"Business + Political Ultimate Plan","date":"Monthly","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"299","fechar":["30+ Ready to Use Business Frames","10+ Ready to Use Political Photo Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing Offers + MorePost","Unlimited Downl"],"insert_date":"2022-02-25 11:21:32","exp_sta":0},{"id":"20","title":"Business Startup Plan","date":"Monthly","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"199","fechar":["30+ Ready to Use Business Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing Offers + MorePost","Unlimited Download Post","Customer Support 24/7"],"insert_date":"2022-02-25 11:24:24","exp_sta":0},{"id":"21","title":"Business Startup Plan","date":"HALF YEALY","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"999","fechar":["30+ Ready to Use Business Frames","10+ Ready to Use Political Photo Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing Offers + MorePost","Unlimited Downl"],"insert_date":"2022-02-25 11:25:13","exp_sta":0},{"id":"22","title":"Business + Political economy Plan","date":"3 MANTH","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"499","fechar":["30+ Ready to Use Business Frames","10+ Ready to Use Political Photo Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing Offers + MorePost","Unlimited Downl"],"insert_date":"2022-02-25 11:26:24","exp_sta":0},{"id":"23","title":"Business Startup Plan","date":"YEALY","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"1199","fechar":["30+ Ready to Use Business Frames","10+ Ready to Use Political Photo Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing Offers + MorePost","Unlimited Downl"],"insert_date":"2022-02-25 11:26:53","exp_sta":0},{"id":"24","title":"Business + Political Ultimate Plan","date":"YEALY","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"1599","fechar":["30+ Ready to Use Business Frames","10+ Ready to Use Political Photo Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing Offers + MorePost","digital_marketing Eprofil"],"insert_date":"2022-02-25 11:27:56","exp_sta":0},{"id":"25","title":"Business + Political Deluxe Plan","date":"YEALY","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"3999","fechar":["1000","Bulk Sms Whatsapp 1 Credit","30+ Ready to Use Business Frames","10+ Ready to Use Political Photo Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing O"],"insert_date":"2022-02-25 11:28:40","exp_sta":0},{"id":"26","title":"POLITICAL CUSTOM PLAN","date":"YEALY","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"9999","fechar":["1000","Bulk Whatsapp SMS 2 Credit","30+ Ready to Use Business Frames","10+ Ready to Use Political Photo Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing O"],"insert_date":"2022-02-25 11:29:16","exp_sta":0},{"id":"29","title":"Demo","date":"2022-05-14","image":"http://sundhanetwark.com/Admin/api/uploads/business/","price":"100","fechar":["1000","Bulk Whatsapp SMS 2 Credit","1000","Bulk Sms Whatsapp 1 Credit","30+ Ready to Use Business Frames"],"insert_date":"2022-05-13 00:46:29","exp_sta":0}]

GetPlanModel getPlanModelFromJson(String str) => GetPlanModel.fromJson(json.decode(str));
String getPlanModelToJson(GetPlanModel data) => json.encode(data.toJson());
class GetPlanModel {
  GetPlanModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetPlanModel.fromJson(dynamic json) {
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
GetPlanModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => GetPlanModel(  status: status ?? _status,
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

/// id : "17"
/// title : "Business Startup Plan"
/// date : "2 Day"
/// image : "http://sundhanetwark.com/Admin/api/uploads/business/"
/// price : "19"
/// fechar : ["30+ Ready to Use Business Frames","All Festivals & Special post","Business Marketing Post","Motivational Image & Video Post","Trending Post","Special Person Post","Daily Post","Video Post","Wishing Offers + MorePost","Customer Support 24/7"]
/// insert_date : "2022-02-25 10:59:25"
/// exp_sta : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? title, 
      String? date, 
      String? image, 
      String? price, 
      List<String>? fechar, 
      String? insertDate, 
      int? expSta,}){
    _id = id;
    _title = title;
    _date = date;
    _image = image;
    _price = price;
    _fechar = fechar;
    _insertDate = insertDate;
    _expSta = expSta;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _date = json['date'];
    _image = json['image'];
    _price = json['price'];
    _fechar = json['fechar'] != null ? json['fechar'].cast<String>() : [];
    _insertDate = json['insert_date'];
    _expSta = json['exp_sta'];
  }
  String? _id;
  String? _title;
  String? _date;
  String? _image;
  String? _price;
  List<String>? _fechar;
  String? _insertDate;
  int? _expSta;
Data copyWith({  String? id,
  String? title,
  String? date,
  String? image,
  String? price,
  List<String>? fechar,
  String? insertDate,
  int? expSta,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  date: date ?? _date,
  image: image ?? _image,
  price: price ?? _price,
  fechar: fechar ?? _fechar,
  insertDate: insertDate ?? _insertDate,
  expSta: expSta ?? _expSta,
);
  String? get id => _id;
  String? get title => _title;
  String? get date => _date;
  String? get image => _image;
  String? get price => _price;
  List<String>? get fechar => _fechar;
  String? get insertDate => _insertDate;
  int? get expSta => _expSta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['date'] = _date;
    map['image'] = _image;
    map['price'] = _price;
    map['fechar'] = _fechar;
    map['insert_date'] = _insertDate;
    map['exp_sta'] = _expSta;
    return map;
  }

}