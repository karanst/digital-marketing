import 'package:animated_widgets/animated_widgets.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/sign_in_model.dart';
import 'package:digital_marketing/screen/bottom_bar.dart';

import 'package:digital_marketing/screen/otp_screen.dart';
import 'package:digital_marketing/screen/signup_screen.dart';
import 'package:digital_marketing/utils/PushNotificationService.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Common common = Common();

  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  bool status = false;
  bool selected = false, enabled = false, edit = false;

  _handleSignIn() async {
    try {
      if (phoneController.text.isNotEmpty) {
        var phoneNo = phoneController.text;
      SignInModel? model = await signIn(phoneNo, fcmToken);
      if(model!.status == true){
        common.toast("OTP Send Successfully");

        Fluttertoast.showToast(msg: model.data!.otp.toString());
        setState(() {
          enabled = true;
        });
        await Future.delayed(Duration(milliseconds: 200));
        setState(() {
          enabled = false;
        });
        print(model.data!.userId);
        Navigator.of(context).pop();
        Navigator.push(
            context,
            PageTransition(
              child: OTPScreen( otp:model.data!.otp.toString() ,mobile: phoneController.text, userId: model.data!.userId,),
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 500),
            ));
      }else{
        common.toast("${model.message}");
      }
      } else {
        common.toast("Please Enter Phone Number");
      }
    } catch (e) {
      common.toast(e.toString());
    }
  }

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25) , bottomLeft: Radius.circular(25)),
                        color:  AppColor().colorPrimary(), ),
                    child: Column(
                      children: [
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(top: 6.4.h),
                    width: 75.58.w,
                    height: 32.89.h,
                    child: Column(
                      children: [
                        Image.asset(
                          signIcon,
                          fit: BoxFit.fill,
                          width: 69.58.w,
                          height: 27.89.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 38.4.h),
                      child: firstSign(context)),
                  SizedBox(
                    height: 3.67.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 74.84.h),
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
                              child: SignUpScreen(),
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
                            text: "Don't Have An Account? ",
                            style: TextStyle(
                              color: Color(0xff171717),
                              fontSize: 10.sp,
                              fontFamily: fontBold,
                            ),
                            children: <TextSpan>[
                              new TextSpan(
                                text: 'SignUp',
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
      ),
    );
  }

  Widget firstSign(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        text(
          "Sign In",
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
          height: 5.75.h,
        ),
        Center(
          child: InkWell(
            onTap: () async {
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Signing, please wait..."),
                      SizedBox(height: 8,),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              });
              _handleSignIn();
              // Navigator.push(context, PageTransition(child: LoginScreen(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 500),));
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
                  child: text(
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
}
