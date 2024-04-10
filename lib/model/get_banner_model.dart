import 'dart:convert';
/// status : true
/// message : "Banner Images"
/// data : [{"id":"5","slider_title":"a","slider_image":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/sliders/Steel_Aluminum_.jpg","slider_status":"1","highlights":"banner1","category_id":"1","sub_cat":"0","child_cat_id":"0","product_id":"0"},{"id":"3","slider_title":"Tshiirt","slider_image":"https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/sliders/orange_tshirt_2.jpg","slider_status":"1","highlights":"banner1","category_id":"1","sub_cat":"0","child_cat_id":"0","product_id":"0"}]

GetBannerModel getBannerModelFromJson(String str) => GetBannerModel.fromJson(json.decode(str));
String getBannerModelToJson(GetBannerModel data) => json.encode(data.toJson());
class GetBannerModel {
  GetBannerModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetBannerModel.fromJson(dynamic json) {
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

/// id : "5"
/// slider_title : "a"
/// slider_image : "https://alphawizztest.tk/digital_marketing-marketing/Admin/uploads/sliders/Steel_Aluminum_.jpg"
/// slider_status : "1"
/// highlights : "banner1"
/// category_id : "1"
/// sub_cat : "0"
/// child_cat_id : "0"
/// product_id : "0"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? sliderTitle, 
      String? sliderImage, 
      String? sliderStatus, 
      String? highlights, 
      String? categoryId, 
      String? subCat, 
      String? childCatId, 
      String? productId,}){
    _id = id;
    _sliderTitle = sliderTitle;
    _sliderImage = sliderImage;
    _sliderStatus = sliderStatus;
    _highlights = highlights;
    _categoryId = categoryId;
    _subCat = subCat;
    _childCatId = childCatId;
    _productId = productId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _sliderTitle = json['slider_title'];
    _sliderImage = json['slider_image'];
    _sliderStatus = json['slider_status'];
    _highlights = json['highlights'];
    _categoryId = json['category_id'];
    _subCat = json['sub_cat'];
    _childCatId = json['child_cat_id'];
    _productId = json['product_id'];
  }
  String? _id;
  String? _sliderTitle;
  String? _sliderImage;
  String? _sliderStatus;
  String? _highlights;
  String? _categoryId;
  String? _subCat;
  String? _childCatId;
  String? _productId;

  String? get id => _id;
  String? get sliderTitle => _sliderTitle;
  String? get sliderImage => _sliderImage;
  String? get sliderStatus => _sliderStatus;
  String? get highlights => _highlights;
  String? get categoryId => _categoryId;
  String? get subCat => _subCat;
  String? get childCatId => _childCatId;
  String? get productId => _productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['slider_title'] = _sliderTitle;
    map['slider_image'] = _sliderImage;
    map['slider_status'] = _sliderStatus;
    map['highlights'] = _highlights;
    map['category_id'] = _categoryId;
    map['sub_cat'] = _subCat;
    map['child_cat_id'] = _childCatId;
    map['product_id'] = _productId;
    return map;
  }

}