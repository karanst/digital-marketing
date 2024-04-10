import 'package:animated_widgets/animated_widgets.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/sign_up_model.dart';
import 'package:digital_marketing/screen/bottom_bar.dart';

import 'package:digital_marketing/screen/login_screen.dart';
import 'package:digital_marketing/screen/otp_screen.dart';
import 'package:digital_marketing/screen/signup_screen.dart';
import 'package:digital_marketing/utils/PushNotificationService.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {

  bool isSignup = false;

  late AnimationController _controller;
  Common common = Common();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  bool status = false;
  bool selected = false, enabled = false, edit = false;

  var referralController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    changePage();
  }

  changePage() async {
    await Future.delayed(Duration(milliseconds: 2000));
    setState(() {
      status = true;
    });
  }


  Future initialise() async {
    // iOSPermission();
    messaging.getToken().then((token) async {
      fcmToken = token.toString();
      print(fcmToken);
    });
  }

  _handleSignUp() async {
    try {
      if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
        var name = nameController.text;
        var number = phoneController.text;
        var refer = referralController.text;
        SignUpModel? model = await signUp(name, number, fcmToken ,refer );
        if(model!.status == true){
          setState(() {
            enabled = true;
          });
          await Future.delayed(Duration(milliseconds: 200));

          Fluttertoast.showToast(msg: model.otp.toString());
          // common.toast(model.otp.toString());
          setState(() {
            enabled = false;
            isSignup = true;
            loading = false;
          });
          Navigator.push(
              context,
              PageTransition(
                child: OTPScreen(name:nameController.text, mobile: phoneController.text, userId: model.data!.userId,isSignup: isSignup,),
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 500),
              ));
        }else{
          setState(() {

            loading = false;
          });
          common.toast(model.message.toString());
        }
      } else {
        common.toast("Fill All Details");
      }
    } catch (e) {
      common.toast(e.toString());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 10.31.h,
        width: 100.w,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(flag), fit: BoxFit.fill)),
        child: text(
          "MADE IN INDIA",
          fontSize: 10.5.sp,
          fontFamily: fontBold,
          textColor: AppColor().colorPrimary(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            width: 100.w,
            //height: 100.h,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.0, -0.1),
                colors: [
                  AppColor().colorBg1(),
                  AppColor().colorBg2(),
                ],
                radius: 0.8,
              ),
            ),
            padding: MediaQuery.of(context).viewInsets,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 20.23.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25) ,
                          bottomLeft: Radius.circular(25)),
                      color:  AppColor().colorPrimary(), ),
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //   image: AssetImage(loginBg),
                  //   fit: BoxFit.fill,
                  // )),
                  child: Column(
                    children: [
                      Container(
                          width: 100.w,
                          height: 4.0.h,
                          alignment: Alignment.centerLeft,
                          margin:
                              EdgeInsets.only(left: 5.w, top: 1.h, right: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                    back,
                                    height: 4.0.h,
                                    width: 6.0.w,
                                  )),
                              // InkWell(
                              //     onTap: () {
                              //       Navigator.pop(context);
                              //     },
                              //     child: Image.asset(
                              //       close,
                              //       height: 3.5.w,
                              //       width: 3.5.w,
                              //     )),
                            ],
                          )),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(top: 6.4.h),
                  width: 75.58.w,
                  height: 32.89.h,
                  child: Image.asset(
                    loginIcon,
                    fit: BoxFit.fill,
                    // width: 69.58.w,
                    // height: 27.89.h,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 38.4.h),
                    child: firstSign(context)),
                // SizedBox(
                //   height: 3.67.h,
                // ),
                Container(
                  margin: EdgeInsets.only(top: 80.57.h),
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        edit = true;
                      });
                      await Future.delayed(Duration(milliseconds: 200));
                      setState(() {
                        edit = false;
                      });
                      Navigator.push(
                          context,
                          PageTransition(
                            child: LoginScreen(),
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 500),
                          ));
                    },
                    child: ScaleAnimatedWidget.tween(
                      enabled: edit,
                      duration: Duration(milliseconds: 200),
                      scaleDisabled: 1.0,
                      scaleEnabled: 0.8,
                      child: RichText(
                        text: new TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Color(0xff171717),
                            fontSize: 10.sp,
                            fontFamily: fontBold,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                              text: 'SignIn',
                              style: TextStyle(
                                color: AppColor().colorTextThird(),
                                fontSize: 10.sp,
                                fontFamily: fontBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstSign(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        text(
          "Sign Up",
          textColor: AppColor().colorPrimary(),
          fontSize: 14.5.sp,
          fontFamily: fontMedium,
        ),
        SizedBox(
          height: 3.05.h,
        ),
        Center(
          child: Container(
            width: 86.66.w,
            height: 6.76.h,
            child: TextFormField(
              cursorColor: Colors.red,
              keyboardType: TextInputType.name,
              controller: nameController,
              style: TextStyle(
                color: AppColor().colorTextFour(),
                fontSize: 10.sp,
              ),
              inputFormatters: [],
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor().colorEdit(),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                labelText: 'Enter Your Name',
                labelStyle: TextStyle(
                  color: AppColor().colorTextFour(),
                  fontSize: 10.sp,
                ),
                counterText: '',
                fillColor: AppColor().colorEdit(),
                enabled: true,
                filled: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(4.0.w),
                  child: Image.asset(
                    person,
                    width: 2.04.w,
                    height: 2.04.w,
                    fit: BoxFit.fill,
                  ),
                ),
                suffixIcon: phoneController.text.length == 10
                    ? Container(
                        width: 10.w,
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.check,
                          color: AppColor().colorPrimary(),
                          size: 10.sp,
                        ))
                    : SizedBox(),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor().colorEdit(), width: 5.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.8.h,
        ),
        Center(
          child: Container(
            width: 86.66.w,
            height: 6.76.h,
            child: TextFormField(
              cursorColor: Colors.red,
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: phoneController,
              style: TextStyle(
                color: AppColor().colorTextFour(),
                fontSize: 10.sp,
              ),
              inputFormatters: [],
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor().colorEdit(),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: AppColor().colorTextFour(),
                  fontSize: 10.sp,
                ),
                counterText: '',
                fillColor: AppColor().colorEdit(),
                enabled: true,
                filled: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(4.0.w),
                  child: Image.asset(
                    phone,
                    width: 2.04.w,
                    height: 2.04.w,
                    fit: BoxFit.fill,
                  ),
                ),
                suffixIcon: phoneController.text.length == 10
                    ? Container(
                        width: 10.w,
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.check,
                          color: AppColor().colorPrimary(),
                          size: 10.sp,
                        ))
                    : SizedBox(),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor().colorEdit(), width: 5.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.8.h,
        ),
        Center(
          child: Container(
            width: 86.66.w,
            height: 6.76.h,
            child: TextFormField(
              cursorColor: Colors.red,
              maxLength: 10,
              keyboardType: TextInputType.number,
              controller: referralController,
              style: TextStyle(
                color: AppColor().colorTextFour(),
                fontSize: 10.sp,
              ),
              inputFormatters: [],
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor().colorEdit(),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                labelText: 'Referral Code (Optional)',
                labelStyle: TextStyle(
                  color: AppColor().colorTextFour(),
                  fontSize: 10.sp,
                ),
                counterText: '',
                fillColor: AppColor().colorEdit(),
                enabled: true,
                filled: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(4.0.w),
                  child: Icon(Icons.room_preferences_rounded),
                ),
                suffixIcon: phoneController.text.length == 10
                    ? Container(
                    width: 10.w,
                    alignment: Alignment.center,
                    child: FaIcon(
                      FontAwesomeIcons.check,
                      color: AppColor().colorPrimary(),
                      size: 10.sp,
                    ))
                    : SizedBox(),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: AppColor().colorEdit(), width: 5.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.8.h,
        ),
        Center(
          child: InkWell(
            onTap: () async {

              if(!loading){
                setState(() {
                  loading = true;
                });
                _handleSignUp();
              }

              // Navigator.push(context, PageTransition(child: SignUpScreen(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 500),));
            },
            child: ScaleAnimatedWidget.tween(
              enabled: enabled,
              duration: Duration(milliseconds: 200),
              scaleDisabled: 1.0,
              scaleEnabled: 0.9,
              child: Container(
                width: 86.66.w,
                height: 6.87.h,
                decoration: boxDecoration(
                    radius: 15.0, bgColor: AppColor().colorPrimaryDark()),
                child: Center(
                  child:loading? CircularProgressIndicator(
                    color: Colors.white,
                  ):text(
                    "Next",
                    textColor: AppColor().colorBg1(),
                    fontSize: 14.5.sp,
                    fontFamily: fontRegular,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  bool loading= false;
}
