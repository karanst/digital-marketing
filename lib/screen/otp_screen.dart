import 'package:animated_widgets/animated_widgets.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/CheckOtpModel.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/bottom_bar.dart';
import 'package:digital_marketing/screen/business_screen.dart';
import 'package:digital_marketing/screen/edit_profile_screen.dart';
import 'package:digital_marketing/screen/profile_screen.dart';
import 'package:digital_marketing/screen/view_profile_screen.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';

class OTPScreen extends StatefulWidget {
  final mobile;
  final userId;
  final isSignup;
  final String? name,otp;
  const OTPScreen({Key? key, this.mobile,this.otp ,this.userId,this.isSignup,this.name}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen>
    with SingleTickerProviderStateMixin {
  Common common = Common();
  late AnimationController _controller;
  final TextEditingController pinPutController = TextEditingController();
  final FocusNode pinPutFocusNode = FocusNode();

  BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      color: AppColor().colorBg1(),
      border: Border.all(color: AppColor().colorBg1().withOpacity(0.6)),
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: [
        BoxShadow(
            color: AppColor().colorView().withOpacity(0.3),
            blurRadius: 4,
            spreadRadius: 1)
      ],
    );
  }

  bool status = false;
  bool selected = false, enabled = false, edit = false;

  _saveUser(userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
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
    var user = Provider.of<UserProvider>(context);
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
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25) , bottomLeft: Radius.circular(25)),
                    color: AppColor().colorPrimary()),
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
                              //
                            ],
                          )),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(top: 6.4.h),
                  width: 69.58.w,
                  height: 27.89.h,
                  child: Image.asset(
                    otpIcon,
                    fit: BoxFit.fill,
                    width: 75.58.w,
                    height: 32.89.h,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 38.4.h),
                    child: firstSign(context)),
                SizedBox(
                  height: 3.67.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstSign(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        text(
          "OTP",
          textColor: AppColor().colorPrimary(),
          fontSize: 14.5.sp,
          fontFamily: fontMedium,
        ),
        SizedBox(
          height: 3.05.h,
        ),
        text(
          "ENTER YOUR 4 DIGIT CODE",
          textColor: AppColor().colorTextThird(),
          fontSize: 12.sp,
          fontFamily: fontMedium,
        ),
        SizedBox(
          height: 0.15.h,
        ),
        text(
          "Don't share it with any other",
          textColor: AppColor().colorTextSecondary(),
          fontSize: 10.5.sp,
          fontFamily: fontMedium,
        ),
        SizedBox(
          height: 3.05.h,
        ),
        Center(
          child: Container(
            width: 70.w,
            child: PinPut(
              fieldsCount: 4,
              eachFieldHeight: 12.36.w,
              eachFieldWidth: 12.36.w,
              textStyle: TextStyle(
                color: AppColor().colorPrimary(),
                fontSize: 10.5.sp,
              ),
              focusNode: pinPutFocusNode,
              controller: pinPutController,
              submittedFieldDecoration: pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(20.0),
              ),
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: AppColor().colorBg1().withOpacity(0.6),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4.75.h,
        ),
        InkWell(
          onTap: () async {
            setState(() {
              edit = true;
            });
            await Future.delayed(Duration(milliseconds: 200));
            setState(() {
              edit = false;
            });
          },
          child: ScaleAnimatedWidget.tween(
            enabled: edit,
            duration: Duration(milliseconds: 200),
            scaleDisabled: 1.0,
            scaleEnabled: 0.8,
            child: RichText(
              text: new TextSpan(
                text: "Didn't Got Code?  ",
                style: TextStyle(
                  color: Color(0xff171717),
                  fontSize: 10.sp,
                  fontFamily: fontBold,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: 'Resend',
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
        SizedBox(
          height: 4.75.h,
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
                      Text("Please wait..."),
                      SizedBox(height: 10,),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              });
              if (pinPutController.text.length == 4) {
                var mobile = "${widget.mobile}";
                var otp = "${pinPutController.text}";
                CheckOtpModel? model = await checkOtp(mobile, otp);
                if(model!.type == "success"){
                  _saveUser(widget.userId);
                  // common.toast(model.message.toString());
                  user.userId = widget.userId;
                  setState(() {
                    enabled = true;
                  });
                  await Future.delayed(Duration(milliseconds: 200));
                  setState(() {
                    enabled = false;
                  });
                  Navigator.of(context).pop();
                  Navigator.pushAndRemoveUntil(context, PageTransition(
                    // child: BottomBar(),
                    child: widget.isSignup == true ? BusinessScreen(form:widget.isSignup ,) : BottomBar(),
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 500),
                  ), (route) => false);
                }else{
                  print('hey');
                  common.toast(model.message.toString());
                }
              } else {
                common.toast("Enter OTP");
              }
              //Navigator.push(context, PageTransition(child: OTPScreen(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 500),));
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
                    "Submit",
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
