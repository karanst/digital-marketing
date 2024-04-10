import 'dart:io';
import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/business_screen.dart';
import 'package:digital_marketing/screen/language_screen.dart';
import 'package:digital_marketing/screen/login_screen.dart';
import 'package:digital_marketing/screen/post_screen.dart';
import 'package:digital_marketing/screen/purchase_history.dart';
import 'package:digital_marketing/screen/refer_And_Earn.dart';
import 'package:digital_marketing/screen/view_profile_screen.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/app_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool selected = false, enabled = false, edit1 = false;
  final InAppReview _inAppReview = InAppReview.instance;
  String _phone = '9602200734';
  Common common = Common();

  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', "");
    await prefs.setString('planStatus', "");
    await prefs.remove("userId");
    await prefs.remove("planStatus");
    await prefs.clear();
  }

  Future<void> openStoreListing() => _inAppReview.openStoreListing(
    appStoreId: appStoreId,
    microsoftStoreId: 'microsoftStoreId',
  );



  @override
  Widget build(BuildContext context) {
    changeStatusBarColor(AppColor().colorPrimary());
    var user = Provider.of<UserProvider>(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Account"),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
          ),
          backgroundColor:   AppColor().colorPrimary(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              width: 100.w,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.0, -0.5),
                  colors: [
                    AppColor().colorBg1(),
                    AppColor().colorBg1(),
                  ],
                  radius: 0.8,
                ),
              ),
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                children: [
                  // MyappBarView(
                  //   myTitle: "My Account",
                  //   status: true,
                  //   action: SizedBox(),
                  // ),
                  FutureBuilder(
                      future: getUserProfile(user.userId),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data.data;
                          return snapshot.data.status?
                            InkWell(
                            onTap: () {
                              print("this is image url https://taskglare.in/Digital/Admin/api/uploads/user_upload/${data[0].userImage}");
                            var data1 =  Navigator.push(
                                  context,
                                  PageTransition(
                                    child: ViewProfileScreen(userData: data[0],),
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 500),
                                  ));
                            if(data1 == true){
                              getUserProfile(user.userId);
                            }
                            },
                            child: Container(
                                height: 11.40.h,
                                width: 82.91.w,
                                margin: EdgeInsets.only(
                                    left: 8.33.w,
                                    right: 8.33.w,
                                    bottom: 1.87.h,
                                    top: 1.87.h),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 9.76.h,
                                      width: 9.76.h,
                                      child: data[0].userImage != ""
                                          ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://taskglare.in/Digital/Admin/api/uploads/user_upload/${data[0].userImage}"),
                                      )
                                          : Image(
                                        image: AssetImage(editProfile),
                                        fit: BoxFit.cover,
                                        height: 14.66.h,
                                        width: 14.66.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.05.w,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: text("${data[0].userFullname}",
                                                  textColor: Color(0xff191919),
                                                  fontSize: 14.0.sp,
                                                  fontFamily: fontBold,
                                                  overFlow: true),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            Container(
                                              child: text(
                                                "${data[0].userEmail}",
                                                textColor: Color(0xff2a2a2a),
                                                fontSize: 10.sp,
                                                overFlow: true,
                                                fontFamily: fontRegular,
                                                maxLine: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.05.w,
                                    ),
                                    InkWell(
                                      onTap: () async{
                                       var result = await Navigator.push(
                                            context,
                                            PageTransition(
                                              child: ViewProfileScreen(userData: data[0],),
                                              type: PageTransitionType.rightToLeft,
                                              duration: Duration(milliseconds: 500),
                                            ));
                                       if(result){
                                        setState(() {
                                          getUserProfile(user.userId);
                                        });
                                       }
                                      },
                                      child: Container(
                                        height: 5.39.h,
                                        width: 5.39.h,
                                        decoration: boxDecoration(
                                            radius: 100,
                                            bgColor: AppColor().colorPrimary()),
                                        child: Center(
                                          child: Image.asset(
                                            edit,
                                            height: 2.26.h,
                                            width: 2.26.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ): Text("Unable to fetch User Data");
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                  // Container(
                  //   height: 13.81.h,
                  //   margin: EdgeInsets.only(
                  //       left: 8.33.w,
                  //       right: 8.33.w,
                  //       bottom: 1.87.h,
                  //   ),
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage(offer), fit: BoxFit.fill)),
                  //   child: Padding(
                  //     padding: EdgeInsets.only(
                  //       left: 16.33.w,
                  //       //right: 8.33.w,
                  //     ),
                  //     child: text("Up Grade Your Business\nTo Remove Watermark",
                  //       fontSize: 14.0.sp,
                  //       fontFamily: fontBold,
                  //       textColor: AppColor().colorBg1(),
                  //       isCentered: true
                  //     ),
                  //   ),
                  // ),
                  tabItem(context, 1, business, "My Business"),
                  tabItem(context, 2, lang, "Languages"),
                  tabItem(context, 3, post, "My Post"),
                  tabItem(context, 4, share, "Refer And Earn"),
                  tabItem(context, 5, rate, "Rate Us"),
                  tabItem(context, 6, support, "Help & Support"),
                  tabItem(context, 7, support, "Purchase History"),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        print("BEFORE LOGOUT");
                        print(user.userId);
                        print(user.planStatus);
                        setState(() {
                          edit1 = true;
                        });
                        await Future.delayed(Duration(milliseconds: 200));
                        setState(() {
                          edit1 = false;
                        });
                        _logout();
                        print("AFTER LOGOUT");
                        print(user.userId);
                        print(user.planStatus);
                        Navigator.pushAndRemoveUntil(context, PageTransition(
                          child: LoginScreen(),
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 500),
                        ), (route) => false);
                      },
                      child: ScaleAnimatedWidget.tween(
                        enabled: edit1,
                        duration: Duration(milliseconds: 200),
                        scaleDisabled: 1.0,
                        scaleEnabled: 0.9,
                        child: Container(
                          height: 7.09.h,
                          width: 42.63.w,
                          decoration: boxDecoration(
                              radius: 15.0,
                              bgColor: AppColor().colorPrimaryDark()),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Image.asset(
                                  logout,
                                  height: 3.82.h,
                                  width: 3.82.h,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              text(
                                "Log Out",
                                textColor: Color(0xffffffff),
                                fontSize: 10.sp,
                                fontFamily: fontRegular,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tabItem(BuildContext context, var pos, var icon, String title) {
    return InkWell(
      onTap: () {
        if (pos == 1) {
          Navigator.push(
              context,
              PageTransition(
                child: BusinessScreen(),
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 500),
              ));
        }
        if (pos == 2) {
          Navigator.push(
              context,
              PageTransition(
                child: LanguageScreen(),
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 500),
              ));
        }
        if (pos == 3) {
          Navigator.push(
              context,
              PageTransition(
                child: PostScreen(),
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 500),
              ));
        }
        if (pos == 4) {
          Navigator.push(
              context,
              PageTransition(
                child: ReferAndEarn(),
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 500),
              ));
        }


        /*if (pos == 4) {
          Navigator.push(
              context,
              PageTransition(
                child: MainCustomerSupport(),
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 500),
              ));
        }*/
        if (pos == 5) {
          openStoreListing();
        }
        if (pos == 6) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  width: 100.w,
                  height: 38.33.h,
                  padding: EdgeInsets.all(22),
                  decoration: boxDecoration(
                    radius: 30,
                    bgColor: AppColor().colorBg1(),
                    showShadow: true,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            text("Help & Support",
                                textColor: AppColor().colorTextThird(),
                                fontSize: 15.5.sp,
                                fontFamily: fontBold,
                                overFlow: true),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                close,
                                height: 2.26.h,
                                width: 2.26.h,
                                color: AppColor().colorTextPrimary(),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 3.98.h,),
                      SizedBox(height: 3.98.h,),
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              "images/call.png",
                              height: 3.26.h,
                              width: 3.26.h,
                              color: AppColor().colorTextPrimary(),
                            ),
                            SizedBox(width: 3.98.w,),
                            InkWell(
                              onTap: (){
                                _makePhoneCall(_phone);
                              },
                              child: text("Call Us : $_phone",
                                  textColor: AppColor().colorTextPrimary(),
                                  fontSize: 12.5.sp,
                                  fontFamily: fontBold,
                                  overFlow: true
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.98.h,),
                      Container(
                        child: InkWell(
                          onTap: (){
                            launchUrl(emailLaunchUri);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "images/mail.png",
                                height: 3.26.h,
                                width: 3.26.h,
                                color: AppColor().colorTextPrimary(),
                              ),
                              SizedBox(width: 3.98.w,),
                              text("Email Us",
                                  textColor: AppColor().colorTextPrimary(),
                                  fontSize: 12.5.sp,
                                  fontFamily: fontBold,
                                  overFlow: true),
                              SizedBox(width: 3.98.w,),
                              Expanded(child: Text("contact@sundhanetwark.com"))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 3.98.h,),
                      Container(
                        child: InkWell(
                          onTap: (){
                            openwhatsapp();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "images/whatsapp.png",
                                height: 3.26.h,
                                width: 3.26.h,
                                // color: AppColor().colorTextPrimary(),
                              ),
                              SizedBox(width: 3.98.w,),
                              text("Whatsapp : $_phone",
                                  textColor: AppColor().colorTextPrimary(),
                                  fontSize: 12.5.sp,
                                  fontFamily: fontBold,
                                  overFlow: true
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ) ,
                ),
              );
            },
          );
        }
        if (pos == 7) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PurchaseHistory()));
        }
      },
      child: Container(
          height: 11.25.h,
          width: 82.91.w,
          decoration: boxDecoration(
            showShadow: true,
            radius: 20.0,
            bgColor: AppColor().colorBg1(),
          ),
          margin: EdgeInsets.only(left: 8.33.w, right: 8.33.w, bottom: 1.87.h),
          padding: EdgeInsets.only(left: 6.05.w, right: 3.05.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 3.82.h,
                width: 3.82.h,
                child: Image(
                  image: AssetImage(icon),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                child: text(title,
                    textColor: Color(0xff191919),
                    fontSize: 10.5.sp,
                    fontFamily: fontBold,
                    overFlow: true),
              ),
              SizedBox(
                width: 1.05.w,
              ),
              Container(
                height: 6.32.h,
                width: 6.32.h,
                decoration: boxDecoration(
                    radius: 100,
                    bgColor: AppColor().colorPrimary().withOpacity(0.15)),
                child: Center(
                  child: Image(
                    image: AssetImage(arrowForward),
                    color: AppColor().colorPrimary(),
                    fit: BoxFit.fill,
                    height: 1.87.h,
                    width: 1.80.w,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'sundhadigital_marketingmarketing@gmail.com',
  );

  openwhatsapp() async{
    var whatsapp ="+91$_phone";
    var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
    var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if(Platform.isIOS){
      // for iOS phone only
      if( await canLaunch(whatappURL_ios)){
        await launch(whatappURL_ios, forceSafariVC: false);
      }else{
        common.toast("Whatsapp not installed");
      }
    }else{
      // android , web
      if( await canLaunch(whatsappURl_android)){
        await launch(whatsappURl_android);
      }else{
        common.toast("Whatsapp not installed");
      }
    }
  }
}
