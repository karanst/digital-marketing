import 'dart:convert';
import 'package:digital_marketing/model/CheckOtpModel.dart';
import 'package:digital_marketing/model/GetCategoryModel.dart';
import 'package:digital_marketing/model/GetEditPostModel.dart';
import 'package:digital_marketing/model/GetPlanModel.dart';
import 'package:digital_marketing/model/PurchaseHistoryModel.dart';
import 'package:digital_marketing/model/PurchaseModel.dart';
import 'package:digital_marketing/model/SavePostModel.dart';
import 'package:digital_marketing/model/SearchCategoryModel.dart';
import 'package:digital_marketing/model/ShowPostByCatIdModel.dart';
import 'package:digital_marketing/model/ShowPostByLanguageIdModel.dart';
import 'package:digital_marketing/model/SubCategoryModel.dart';
import 'package:digital_marketing/model/SubCategoryPostModel.dart';
import 'package:digital_marketing/model/add_business_model.dart';
import 'package:digital_marketing/model/category_drop_down.dart';
import 'package:digital_marketing/model/create_post_model.dart';
import 'package:digital_marketing/model/delete_business_model.dart';
import 'package:digital_marketing/model/delete_post_model.dart';
import 'package:digital_marketing/model/delete_potical_model.dart';
import 'package:digital_marketing/model/get_banner_model.dart';
import 'package:digital_marketing/model/get_business_category_model.dart';
import 'package:digital_marketing/model/get_business_list_model.dart';
import 'package:digital_marketing/model/get_language_model.dart';
import 'package:digital_marketing/model/get_politica_list_model.dart';
import 'package:digital_marketing/model/get_user_post_model.dart';
import 'package:digital_marketing/model/get_user_profile_model.dart';
import 'package:digital_marketing/model/sign_in_model.dart';
import 'package:digital_marketing/model/sign_up_model.dart';
import 'package:digital_marketing/model/update_business.dart';
import 'package:digital_marketing/model/update_user_model.dart';
import 'package:http/http.dart' as http;

// final _url = "https://alphawizztest.tk/digital_marketing-marketing/Admin/api";
final _url = "https://taskglare.in/Digital/Admin/api";
    //"https://sundhanetwark.com/Admin/api";

Future<SignUpModel?> signUp(name, number, token, reffer) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/Authentication/registration'));
  request.fields.addAll({
    'user_fullname': '$name',
    'user_phone': '$number',
    'firebaseToken': '$token',
    "refferal_code": "$reffer"
  });

  print(request.fields);

  http.StreamedResponse response = await request.send();
  print(response.statusCode);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str);
    return SignUpModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<SignInModel?> signIn(phone, token) async {
  var request =
      http.MultipartRequest('POST', Uri.parse('$_url/Authentication/login'));
  request.fields.addAll({'mobile': '$phone', 'firebaseToken': '$token'});
  http.StreamedResponse response = await request.send();
  print(request.fields);
  print(response.statusCode);

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str);
    return SignInModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<CheckOtpModel?> checkOtp(mobile, otp) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://api.msg91.com/api/v5/otp/verify?otp=$otp&authkey=371628Az5hrQTS61d8185cP1&mobile=91$mobile'));
  print(request);
  print(request.fields);
  http.StreamedResponse response = await request.send();
  print(response.statusCode);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str);
    return CheckOtpModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<GetCategoryModel?> getCategory(langId, userId, id) async {
  var request =
      http.MultipartRequest('POST', Uri.parse('$_url/Products/Category'));
  request.fields.addAll({
    'language_id': '$langId',
    'type': 'image',
    'user_id': '$userId',
    "category_id": "$id",
  });

  print(request.fields);
  http.StreamedResponse response = await request.send();

  print(request.fields);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print("get category response------------------------------------> : $str");
    return GetCategoryModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<SubCategoryPostModel?> getSubCategoryPost(subCatId) async{
  var request = http.MultipartRequest('POST',
      Uri.parse('$_url/Products/get_post_by_cat_sub_id'));
  request.fields.addAll({
    'sub_cat_id': '$subCatId'
  });

  print(request);
  print("this si subcategory response ${request.fields}");

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print("SUB CATEGORY POST RESPONSE--------------------------> $str");
    return SubCategoryPostModel.fromJson(json.decode(str));
  }
  else {
    return null;
  }
}

Future<SubCategoryModel?> subCategoryList(catId) async {
  var request = http.MultipartRequest('POST',
      Uri.parse('$_url/Products/get_subcat_by_cat_id'));
  request.fields.addAll({
    'cat_id': '$catId'
  });

  print(request);
  print('this is subcategory request${request.fields}');

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print("SUB CATEGORY RESPONSE--------------------------> $str");
    return SubCategoryModel.fromJson(json.decode(str));
  }
  else {
    return null;
  }
}

Future<GetUserProfileModel?> getUserProfile(userId) async {
  var request =
      http.Request('POST', Uri.parse('$_url/User_Dashboard/getUserProfile'));
  request.bodyFields = {'user_id': '$userId'};
  print("this is user profile ========>>>> ${request.bodyFields.toString()}");

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();

    return GetUserProfileModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<UpdateUserModel?> updateProfile(userId, userName, email) async {
  print("this is working ");
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/User_Dashboard/updateUserProfile'));
  request.fields
      .addAll({'name': '$userName', 'email': '$email', 'user_id': '$userId'});
  http.StreamedResponse response = await request.send();
  print("this uws request fields ${request.fields.toString()}");

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();

    return UpdateUserModel.fromJson(json.decode(str));

  } else {
    return null;
  }
}

Future<UpdateUserModel?> updateImage(userId, userName, email, image) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/User_Dashboard/updateUserProfile'));
  request.fields
      .addAll({'name': '$userName', 'email': '$email', 'user_id': '$userId'});
  request.files.add(await http.MultipartFile.fromPath('fileImage', image));

  http.StreamedResponse response = await request.send();
  print(request.fields);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str);
    return UpdateUserModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<GetLanguageModel?> getLanguage() async {
  var request = http.Request('POST', Uri.parse('$_url/Products/getLanguages'));

  http.StreamedResponse response = await request.send();
  print(request);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str.toString());
    return GetLanguageModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<CreatePostModel?> createPost(
    userId, catId, langId, type, newFile) async {
  var request =
      http.MultipartRequest('POST', Uri.parse('$_url/Products/addUserPost'));
  request.fields.addAll({
    'cat_id': catId,
    'language_id': langId,
    'user_id': userId,
    'type': type
  });
  request.files.add(await http.MultipartFile.fromPath('fileImage', newFile));

  http.StreamedResponse response = await request.send();
  print(request.fields);
  print(request.files[0].filename);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return createPostModelFromJson(str);
  } else {
    return null;
  }
}

Future<GetUserPostModel?> getUserPost(type, userId) async {
  var request =
      http.MultipartRequest('POST', Uri.parse('$_url/Products/getUserPost'));
  request.fields.addAll({'type': '$type', 'user_id': '$userId'});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str);
    return getUserPostModelFromJson(str);
  } else {
    return null;
  }
}

Future<CategoryDropDown?> categoryDropDown() async {
  var request =
      http.Request('GET', Uri.parse('$_url/Products/CategoryDropdun'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return CategoryDropDown.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<ShowPostByCatIdModel?> showPostByCatId(catType, catId) async {
  var request = http.MultipartRequest('POST', Uri.parse('$_url/Products/getAllPost'));
  request.fields.addAll({'cat_type': '$catType', 'cat_id': '$catId'});
  print('this is subct api --->>> $_url/Products/getAllPost adn${request.fields.toString()}');

  http.StreamedResponse response = await request.send();
  print(request.fields);
  print(request);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str);
    return ShowPostByCatIdModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<DeletePostModel?> deletePost(postId) async {
  var request =
      http.MultipartRequest('POST', Uri.parse('$_url/Products/DeletePost'));
  request.fields.addAll({'post_id': '$postId'});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return DeletePostModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<AddBusinessModel?> addBusiness(
    userId,
    bName,
    bMobile,
    bMobile2,
    bEmail,
    bWebsite,
    bAddress,
    bCategoryId,
    bTwitter,
    bInstagram,
    bLinkdin,
    bYoutube,
    bFacebook,
    logo,
    //waterMark
    ) async {
  var headers = {
    'Cookie': 'ekart_security_cookie=0940e8f2e8eb03d798f261792def1efa'
  };
  var request =
      http.MultipartRequest('POST', Uri.parse('$_url/Products/addMyBusiness'));
  request.fields.addAll({
    'business_name': '$bName',
    'business_mobile': '$bMobile',
    'user_id': '$userId',
    'business_mobile2': '$bMobile2',
    'business_email': '$bEmail',
    'business_website': '$bWebsite',
    'business_address': '$bAddress',
    'business_category': '$bCategoryId',
    'link_twitter': '$bTwitter',
    'link_instagram': '$bInstagram',
    'link_linkdin': '$bLinkdin',
    'link_youtube': '$bYoutube',
    'facebook_link': '$bFacebook'
  });
  request.files.add(await http.MultipartFile.fromPath('logo', '$logo'));
 // waterMark == null ? '' : request.files
 //      .add(await http.MultipartFile.fromPath('watermark', '$waterMark'));
  request.headers.addAll(headers);
  print(request.fields);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return AddBusinessModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<GetBusinessCategoryModel?>   getBusinessCategory(type) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/Products/business_category'));
  request.fields.addAll({'type': '$type'});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return GetBusinessCategoryModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}
GetBusinessListModel? model;
Future<GetBusinessListModel?> getBusinessList(userId) async {
  var request =
      http.MultipartRequest('POST', Uri.parse('$_url/Products/getMyBusiness'));
  request.fields.addAll({'user_id': '$userId'});

  http.StreamedResponse response = await request.send();
  print(request);
  print(request.fields);

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str);
    return GetBusinessListModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<DeleteBusinessModel?> deleteBusiness(id) async {
  var request =
      http.MultipartRequest('POST', Uri.parse('$_url/Products/DeleteBusiness'));
  request.fields.addAll({'id': '$id'});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return DeleteBusinessModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<AddBusinessModel?> createPoliticalBusiness(
    userId,
    bCat,
    bName,
    bDesignation,
    bMobile,
    bMobile1,
    bFace,
    bTwi,
    bInsta,
    bLink,
    bYou,
    logo,
    waterMark,
    left,
    right) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/Products/addPoliticalBusiness'));
  request.fields.addAll({
    'user_id': '$userId',
    'business_category': '$bCat',
    'political_name': '$bName',
    'political_desgination': '$bDesignation',
    'political_mobile': '$bMobile',
    'political_mobile2': '$bMobile1',
    'facebook_link': '$bFace',
    'teitter_link': '$bTwi',
    'instagram_link': '$bInsta',
    'linkdin_link': '$bLink',
    'youtube_link': '$bYou'
  });
  request.files.add(await http.MultipartFile.fromPath('logo', '$logo'));
  request.files
      .add(await http.MultipartFile.fromPath('watermark', '$waterMark'));
  request.files.add(await http.MultipartFile.fromPath('left_side', '$left'));
  request.files.add(await http.MultipartFile.fromPath('right_side', '$right'));

  http.StreamedResponse response = await request.send();
  print(request.fields);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return AddBusinessModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<GetPoliticaListModel?> getPoliticalList(userId) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/Products/getpoliticalBusiness'));
  request.fields.addAll({'user_id': '$userId'});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return GetPoliticaListModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<DeletePoticalModel?> deletePolitical(id) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/Products/DeletePoliticalBusiness'));
  request.fields.addAll({'id': '$id'});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return DeletePoticalModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<UpdateBusiness?> updateBusiness(
    id,
    bName,
    bPhone,
    userId,
    bPhone1,
    bEmail,
    bWebsite,
    bAddress,
    bCategory,
    bTwitter,
    bInstagram,
    bLinkdin,
    bYoutube,
    bFacebook,
    updateImage,
    type,
    image) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/Products/updateMyBusiness'));
  request.fields.addAll({
    'business_name': '$bName',
    'business_mobile': '$bPhone',
    'user_id': '$userId',
    'business_mobile2': '$bPhone1',
    'business_email': '$bEmail',
    'business_website': '$bWebsite',
    'business_address': '$bAddress',
    'business_category': '$bCategory',
    'link_twitter': '$bTwitter',
    'link_instagram': '$bInstagram',
    'link_linkdin': '$bLinkdin',
    'link_youtube': '$bYoutube',
    'link_facebook': '$bFacebook',
    'id': '$id'
  });
  if (updateImage) {
    request.files.add(await http.MultipartFile.fromPath('$type', '$image'));
  }

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return UpdateBusiness.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<UpdateBusiness?> updatePolitics(
    id,
    userId,
    bCat,
    bName,
    bDes,
    bPhone,
    // bPhone1,
    bFacebook,
    bTwitter,
    bInstagram,
    bLinkdin,
    bYoutube,
    updateImage,
    type,
    image) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/Products/UpdatePoliticalBusiness'));
  request.fields.addAll({
    'user_id': '$userId',
    'business_category': '$bCat',
    'political_name': "$bName",
    'political_desgination': '$bDes',
    'political_mobile': '$bPhone',
    // 'political_mobile2': '$bPhone1',
    'facebook_link': '$bFacebook',
    'teitter_link': '$bTwitter',
    'instagram_link': '$bInstagram',
    'linkdin_link': '$bLinkdin',
    'youtube_link': '$bYoutube',
    'id': '$id'
  });

  if (updateImage) {
    request.files.add(await http.MultipartFile.fromPath('$type', '$image'));
  }

  http.StreamedResponse response = await request.send();
  print(request.fields);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return UpdateBusiness.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<GetBannerModel?> getBanner() async {
  var request =
      http.MultipartRequest('GET', Uri.parse('$_url/Products/Banner'));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return GetBannerModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<SearchCategoryModel?> searchCategory(cat) async {
  var request = http.MultipartRequest('POST',
      Uri.parse('$_url/products/search_cat'));
  request.fields.addAll({'category': '$cat'});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return SearchCategoryModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<GetPlanModel?> getPlan(userId) async {
  var request = http.MultipartRequest('POST', Uri.parse('$_url/products/get_plan'));
  request.fields.addAll({
    'user_id': '$userId'
  });

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    final JsonResponse = GetPlanModel.fromJson(json.decode(str));

    return GetPlanModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<SavePostModel?> savePost(userId, image) async {
  var request = http.MultipartRequest('POST',
      Uri.parse('$_url/products/user_post_save'));
  request.fields.addAll({'user_id': '$userId'});
  request.files.add(await http.MultipartFile.fromPath('post_image', image));
  http.StreamedResponse response = await request.send();
  print(request.files[0].field);
  print(request.fields);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str);
    return SavePostModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<GetEditPostModel?> getEditImage(userId) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          '$_url/products/get_user_postdata'));
  request.fields.addAll({'user_id': '$userId'});

  http.StreamedResponse response = await request.send();
  print(request.fields);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str);
    return GetEditPostModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<PurchaseModel?> purchase(
    planTime, transaction, userId, amount, planId) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('$_url/payment/Billing'));
  request.fields.addAll({
    'plan_time': '$planTime',
    'paymenttype': 'online',
    'transection_id': '$transaction',
    'device_id': '123456',
    'user_id': '$userId',
    'subtotal': '$amount',
    'plan_id': '$planId'
  });

  http.StreamedResponse response = await request.send();
  print(request.fields);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return PurchaseModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future<PurchaseHistoryModel?> purchaseHistory(userId) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          '$_url/payment/get_purchase_plan'));
  request.fields.addAll({'User_id': '$userId'});

  http.StreamedResponse response = await request.send();
  print(request);
  print(request.fields);
  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    return PurchaseHistoryModel.fromJson(json.decode(str));
  } else {
    return null;
  }
}

Future showPostByLanguageId(langId,catId,subCatId) async{
  var request = http.MultipartRequest('POST',
      Uri.parse('$_url/Products/get_post_by_lang_id'));
  request.fields.addAll({
    'language_id': '$langId',
    'cat_id': '$catId',
    'sub_cat_id': '$subCatId'
  });
  print(request);
  print(request.fields);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final str = await response.stream.bytesToString();
    print(str.toString());
    return ShowPostByLanguageIdModel.fromJson(json.decode(str));
  }
  else {
  return null;
  }
}