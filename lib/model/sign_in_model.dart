import 'dart:convert';
/// status : true
/// message : "User Login Successfully"
/// data : {"user_id":"489","user_phone":"7049202363","firstname":"","lastname":"","user_fullname":"Deepak Min","user_email":"","user_bdate":"","user_password":"","user_city":"","varification_code":"kmlNW3PpEoir","user_image":"","pincode":"0","socity_id":"0","house_no":"","mobile_verified":"0","user_gcm_code":"asdasdasd","user_ios_token":"","varified_token":"","status":"1","reg_code":"0","wallet":"0.00","rewards":"0","created":"2021-12-31 07:37:58","modified":"2021-12-31 07:37:58","otp":"1532","otp_status":"1","social":"0","facebookID":"","is_email_verified":"0","email_verification_token":"","last_login_time":"","confirmpassword":"","address":""}

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));
String signInModelToJson(SignInModel data) => json.encode(data.toJson());
class SignInModel {
  SignInModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SignInModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user_id : "489"
/// user_phone : "7049202363"
/// firstname : ""
/// lastname : ""
/// user_fullname : "Deepak Min"
/// user_email : ""
/// user_bdate : ""
/// user_password : ""
/// user_city : ""
/// varification_code : "kmlNW3PpEoir"
/// user_image : ""
/// pincode : "0"
/// socity_id : "0"
/// house_no : ""
/// mobile_verified : "0"
/// user_gcm_code : "asdasdasd"
/// user_ios_token : ""
/// varified_token : ""
/// status : "1"
/// reg_code : "0"
/// wallet : "0.00"
/// rewards : "0"
/// created : "2021-12-31 07:37:58"
/// modified : "2021-12-31 07:37:58"
/// otp : "1532"
/// otp_status : "1"
/// social : "0"
/// facebookID : ""
/// is_email_verified : "0"
/// email_verification_token : ""
/// last_login_time : ""
/// confirmpassword : ""
/// address : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? userId, 
      String? userPhone, 
      String? firstname, 
      String? lastname, 
      String? userFullname, 
      String? userEmail, 
      String? userBdate, 
      String? userPassword, 
      String? userCity, 
      String? varificationCode, 
      String? userImage, 
      String? pincode, 
      String? socityId, 
      String? houseNo, 
      String? mobileVerified, 
      String? userGcmCode, 
      String? userIosToken, 
      String? varifiedToken, 
      String? status, 
      String? regCode, 
      String? wallet, 
      String? rewards, 
      String? created, 
      String? modified, 
      String? otp, 
      String? otpStatus, 
      String? social, 
      String? facebookID, 
      String? isEmailVerified, 
      String? emailVerificationToken, 
      String? lastLoginTime, 
      String? confirmpassword, 
      String? address,}){
    _userId = userId;
    _userPhone = userPhone;
    _firstname = firstname;
    _lastname = lastname;
    _userFullname = userFullname;
    _userEmail = userEmail;
    _userBdate = userBdate;
    _userPassword = userPassword;
    _userCity = userCity;
    _varificationCode = varificationCode;
    _userImage = userImage;
    _pincode = pincode;
    _socityId = socityId;
    _houseNo = houseNo;
    _mobileVerified = mobileVerified;
    _userGcmCode = userGcmCode;
    _userIosToken = userIosToken;
    _varifiedToken = varifiedToken;
    _status = status;
    _regCode = regCode;
    _wallet = wallet;
    _rewards = rewards;
    _created = created;
    _modified = modified;
    _otp = otp;
    _otpStatus = otpStatus;
    _social = social;
    _facebookID = facebookID;
    _isEmailVerified = isEmailVerified;
    _emailVerificationToken = emailVerificationToken;
    _lastLoginTime = lastLoginTime;
    _confirmpassword = confirmpassword;
    _address = address;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _userPhone = json['user_phone'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _userFullname = json['user_fullname'];
    _userEmail = json['user_email'];
    _userBdate = json['user_bdate'];
    _userPassword = json['user_password'];
    _userCity = json['user_city'];
    _varificationCode = json['varification_code'];
    _userImage = json['user_image'];
    _pincode = json['pincode'];
    _socityId = json['socity_id'];
    _houseNo = json['house_no'];
    _mobileVerified = json['mobile_verified'];
    _userGcmCode = json['user_gcm_code'];
    _userIosToken = json['user_ios_token'];
    _varifiedToken = json['varified_token'];
    _status = json['status'];
    _regCode = json['reg_code'];
    _wallet = json['wallet'];
    _rewards = json['rewards'];
    _created = json['created'];
    _modified = json['modified'];
    _otp = json['otp'];
    _otpStatus = json['otp_status'];
    _social = json['social'];
    _facebookID = json['facebookID'];
    _isEmailVerified = json['is_email_verified'];
    _emailVerificationToken = json['email_verification_token'];
    _lastLoginTime = json['last_login_time'];
    _confirmpassword = json['confirmpassword'];
    _address = json['address'];
  }
  String? _userId;
  String? _userPhone;
  String? _firstname;
  String? _lastname;
  String? _userFullname;
  String? _userEmail;
  String? _userBdate;
  String? _userPassword;
  String? _userCity;
  String? _varificationCode;
  String? _userImage;
  String? _pincode;
  String? _socityId;
  String? _houseNo;
  String? _mobileVerified;
  String? _userGcmCode;
  String? _userIosToken;
  String? _varifiedToken;
  String? _status;
  String? _regCode;
  String? _wallet;
  String? _rewards;
  String? _created;
  String? _modified;
  String? _otp;
  String? _otpStatus;
  String? _social;
  String? _facebookID;
  String? _isEmailVerified;
  String? _emailVerificationToken;
  String? _lastLoginTime;
  String? _confirmpassword;
  String? _address;

  String? get userId => _userId;
  String? get userPhone => _userPhone;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get userFullname => _userFullname;
  String? get userEmail => _userEmail;
  String? get userBdate => _userBdate;
  String? get userPassword => _userPassword;
  String? get userCity => _userCity;
  String? get varificationCode => _varificationCode;
  String? get userImage => _userImage;
  String? get pincode => _pincode;
  String? get socityId => _socityId;
  String? get houseNo => _houseNo;
  String? get mobileVerified => _mobileVerified;
  String? get userGcmCode => _userGcmCode;
  String? get userIosToken => _userIosToken;
  String? get varifiedToken => _varifiedToken;
  String? get status => _status;
  String? get regCode => _regCode;
  String? get wallet => _wallet;
  String? get rewards => _rewards;
  String? get created => _created;
  String? get modified => _modified;
  String? get otp => _otp;
  String? get otpStatus => _otpStatus;
  String? get social => _social;
  String? get facebookID => _facebookID;
  String? get isEmailVerified => _isEmailVerified;
  String? get emailVerificationToken => _emailVerificationToken;
  String? get lastLoginTime => _lastLoginTime;
  String? get confirmpassword => _confirmpassword;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['user_phone'] = _userPhone;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['user_fullname'] = _userFullname;
    map['user_email'] = _userEmail;
    map['user_bdate'] = _userBdate;
    map['user_password'] = _userPassword;
    map['user_city'] = _userCity;
    map['varification_code'] = _varificationCode;
    map['user_image'] = _userImage;
    map['pincode'] = _pincode;
    map['socity_id'] = _socityId;
    map['house_no'] = _houseNo;
    map['mobile_verified'] = _mobileVerified;
    map['user_gcm_code'] = _userGcmCode;
    map['user_ios_token'] = _userIosToken;
    map['varified_token'] = _varifiedToken;
    map['status'] = _status;
    map['reg_code'] = _regCode;
    map['wallet'] = _wallet;
    map['rewards'] = _rewards;
    map['created'] = _created;
    map['modified'] = _modified;
    map['otp'] = _otp;
    map['otp_status'] = _otpStatus;
    map['social'] = _social;
    map['facebookID'] = _facebookID;
    map['is_email_verified'] = _isEmailVerified;
    map['email_verification_token'] = _emailVerificationToken;
    map['last_login_time'] = _lastLoginTime;
    map['confirmpassword'] = _confirmpassword;
    map['address'] = _address;
    return map;
  }

}