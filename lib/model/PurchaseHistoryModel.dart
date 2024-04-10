import 'dart:convert';
/// status : true
/// message : "Your Order."
/// data : [{"sale_id":"14","plan_id":"17","plan_name":"Business Startup Plan","type":"business","price":"19","cat_id":"30+ Ready to Use Business Frames,All Festivals & Special post,Business Marketing Post,Motivational Image & Video Post,Trending Post,Special Person Post,Daily Post,Video Post,Wishing Offers + MorePost,Customer Support 24/7","user_id":"30","on_date":"2022-05-18","payment_method":"online","plan_expire":"expire","plan_expire_date":"2022-05-20","exp_sta":0},{"sale_id":"15","plan_id":"18","plan_name":"Business Startup Plan","type":"business","price":"59","cat_id":"30+ Ready to Use Business Frames,All Festivals & Special post,Business Marketing Post,Motivational Image & Video Post,Trending Post,Special Person Post,Daily Post,Video Post,Wishing Offers + MorePost,Unlimited Download Post,Customer Support 24/7","user_id":"30","on_date":"2022-05-18","payment_method":"online","plan_expire":"expire","plan_expire_date":"1970-01-01","exp_sta":0},{"sale_id":"17","plan_id":"26","plan_name":"POLITICAL CUSTOM PLAN","type":"business","price":"9999","cat_id":"1000,Bulk Whatsapp SMS 2 Credit,30+ Ready to Use Business Frames,10+ Ready to Use Political Photo Frames,All Festivals & Special post,Business Marketing Post,Motivational Image & Video Post,Trending Post,Special Person Post,Daily Post,Video Post,Wishing O","user_id":"30","on_date":"2022-05-18","payment_method":"online","plan_expire":"expire","plan_expire_date":"1970-01-01","exp_sta":0}]

PurchaseHistoryModel purchaseHistoryModelFromJson(String str) => PurchaseHistoryModel.fromJson(json.decode(str));
String purchaseHistoryModelToJson(PurchaseHistoryModel data) => json.encode(data.toJson());
class PurchaseHistoryModel {
  PurchaseHistoryModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PurchaseHistoryModel.fromJson(dynamic json) {
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
PurchaseHistoryModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => PurchaseHistoryModel(  status: status ?? _status,
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

/// sale_id : "14"
/// plan_id : "17"
/// plan_name : "Business Startup Plan"
/// type : "business"
/// price : "19"
/// cat_id : "30+ Ready to Use Business Frames,All Festivals & Special post,Business Marketing Post,Motivational Image & Video Post,Trending Post,Special Person Post,Daily Post,Video Post,Wishing Offers + MorePost,Customer Support 24/7"
/// user_id : "30"
/// on_date : "2022-05-18"
/// payment_method : "online"
/// plan_expire : "expire"
/// plan_expire_date : "2022-05-20"
/// exp_sta : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? saleId, 
      String? planId, 
      String? planName, 
      String? type, 
      String? price, 
      String? catId, 
      String? userId, 
      String? onDate, 
      String? paymentMethod, 
      String? planExpire, 
      String? planExpireDate, 
      int? expSta,}){
    _saleId = saleId;
    _planId = planId;
    _planName = planName;
    _type = type;
    _price = price;
    _catId = catId;
    _userId = userId;
    _onDate = onDate;
    _paymentMethod = paymentMethod;
    _planExpire = planExpire;
    _planExpireDate = planExpireDate;
    _expSta = expSta;
}

  Data.fromJson(dynamic json) {
    _saleId = json['sale_id'];
    _planId = json['plan_id'];
    _planName = json['plan_name'];
    _type = json['type'];
    _price = json['price'];
    _catId = json['cat_id'];
    _userId = json['user_id'];
    _onDate = json['on_date'];
    _paymentMethod = json['payment_method'];
    _planExpire = json['plan_expire'];
    _planExpireDate = json['plan_expire_date'];
    _expSta = json['exp_sta'];
  }
  String? _saleId;
  String? _planId;
  String? _planName;
  String? _type;
  String? _price;
  String? _catId;
  String? _userId;
  String? _onDate;
  String? _paymentMethod;
  String? _planExpire;
  String? _planExpireDate;
  int? _expSta;
Data copyWith({  String? saleId,
  String? planId,
  String? planName,
  String? type,
  String? price,
  String? catId,
  String? userId,
  String? onDate,
  String? paymentMethod,
  String? planExpire,
  String? planExpireDate,
  int? expSta,
}) => Data(  saleId: saleId ?? _saleId,
  planId: planId ?? _planId,
  planName: planName ?? _planName,
  type: type ?? _type,
  price: price ?? _price,
  catId: catId ?? _catId,
  userId: userId ?? _userId,
  onDate: onDate ?? _onDate,
  paymentMethod: paymentMethod ?? _paymentMethod,
  planExpire: planExpire ?? _planExpire,
  planExpireDate: planExpireDate ?? _planExpireDate,
  expSta: expSta ?? _expSta,
);
  String? get saleId => _saleId;
  String? get planId => _planId;
  String? get planName => _planName;
  String? get type => _type;
  String? get price => _price;
  String? get catId => _catId;
  String? get userId => _userId;
  String? get onDate => _onDate;
  String? get paymentMethod => _paymentMethod;
  String? get planExpire => _planExpire;
  String? get planExpireDate => _planExpireDate;
  int? get expSta => _expSta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sale_id'] = _saleId;
    map['plan_id'] = _planId;
    map['plan_name'] = _planName;
    map['type'] = _type;
    map['price'] = _price;
    map['cat_id'] = _catId;
    map['user_id'] = _userId;
    map['on_date'] = _onDate;
    map['payment_method'] = _paymentMethod;
    map['plan_expire'] = _planExpire;
    map['plan_expire_date'] = _planExpireDate;
    map['exp_sta'] = _expSta;
    return map;
  }

}