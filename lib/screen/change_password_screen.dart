
import 'package:animated_widgets/animated_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:digital_marketing/screen/bottom_bar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({Key? key}) : super(key: key);

  @override
  _ChangeScreenState createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  bool selected = false, enabled = false, edit = false;
  @override
  Widget build(BuildContext context) {
    changeStatusBarColor(AppColor().colorPrimary());
    return Scaffold(
      backgroundColor: AppColor().colorBg1(),
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
                Container(
                  height: 9.92.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(profileBg),
                        fit: BoxFit.fill,
                      )),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 6.38.w,
                            height: 6.38.w,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 7.91.w),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  back,
                                  height: 4.0.h,
                                  width: 8.w,
                                ))),
                        SizedBox(
                          width: 2.08.h,
                        ),
                        Container(
                          width: 65.w,
                          child: text(
                            "Change Password",
                            textColor: Color(0xffffffff),
                            fontSize: 14.sp,
                            fontFamily: fontMedium,
                            isCentered: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.52.h,
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: 8.33.w, right: 8.33.w, bottom: 1.87.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.52.h,
                      ),
                      Container(
                        width: 83.33.w,
                        height: 6.79.h,
                        decoration: boxDecoration(
                          showShadow: true,
                          radius: 20.0,
                          bgColor: AppColor().colorBg1(),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          // controller: emailController,
                          style:TextStyle(
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelText: 'Enter Your Old Password',
                            labelStyle: TextStyle(
                              color: AppColor().colorTextFour(),
                              fontSize: 10.sp,
                            ),
                            prefixIcon:  Padding(
                              padding: EdgeInsets.all(4.0.w),
                              child: Image.asset(
                                lock,
                                width: 2.04.w,
                                height:  2.04.w,
                                color: Color(0xffF4B71E),
                                fit: BoxFit.fill,
                              ),
                            ),
                            fillColor: AppColor().colorBg1() ,
                            enabled: true,
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor().colorBg1(), width: 5.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.52.h,
                      ),
                      Container(
                        width: 83.33.w,
                        height: 6.79.h,
                        decoration: boxDecoration(
                          showShadow: true,
                          radius: 20.0,
                          bgColor: AppColor().colorBg1(),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          // controller: emailController,
                          style:TextStyle(
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelText: 'Enter New Password',
                            labelStyle: TextStyle(
                              color: AppColor().colorTextFour(),
                              fontSize: 10.sp,
                            ),
                            fillColor: AppColor().colorBg1() ,
                            enabled: true,
                            prefixIcon:  Padding(
                              padding: EdgeInsets.all(4.0.w),
                              child: Image.asset(
                                lock,
                                width: 2.04.w,
                                height:  2.04.w,
                                color: Color(0xffF4B71E),
                                fit: BoxFit.fill,
                              ),
                            ),
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor().colorBg1(), width: 5.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.52.h,
                      ),
                      Container(
                        width: 83.33.w,
                        height: 6.79.h,

                        child:text(
                          "Your New Password must be Different From Your Previous Passwords.",
                          textColor: Color(0xffFD531F),
                          fontSize: 10.sp,
                          fontFamily: fontSemibold,
                          maxLine: 2
                        ) ,
                      ),
                      SizedBox(
                        height: 1.52.h,
                      ),
                      Container(
                        width: 83.33.w,
                        height: 6.79.h,
                        decoration: boxDecoration(
                          showShadow: true,
                          radius: 20.0,
                          bgColor: AppColor().colorBg1(),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          // controller: emailController,
                          style:TextStyle(
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelText: 'Confirm New Password',
                            prefixIcon:  Padding(
                              padding: EdgeInsets.all(4.0.w),
                              child: Image.asset(
                                lock,
                                width: 2.04.w,
                                height:  2.04.w,
                                color: Color(0xffF4B71E),
                                fit: BoxFit.fill,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: AppColor().colorTextFour(),
                              fontSize: 10.sp,
                            ),
                            fillColor: AppColor().colorBg1() ,
                            enabled: true,
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColor().colorBg1(), width: 5.0),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                    ),

                SizedBox(
                  height: 3.02.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        enabled = true;
                      });
                      await Future.delayed(Duration(milliseconds: 200));
                      setState(() {
                        enabled = false;
                      });
                      Navigator.pop(context);
                      //    Navigator.push(context, PageTransition(child: LoginScreen(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 500),));

                    },
                    child: ScaleAnimatedWidget.tween(
                      enabled: enabled,
                      duration: Duration(milliseconds: 200),
                      scaleDisabled: 1.0,
                      scaleEnabled: 0.9,
                      child: Container(
                        width: 69.99.w,
                        height: 6.46.h,
                        decoration: boxDecoration(
                            radius: 15.0,
                            bgColor: AppColor().colorPrimaryDark()),
                        child: Center(
                          child: text(
                            "Save",
                            textColor: Color(0xffffffff),
                            fontSize: 14.sp,
                            fontFamily: fontRegular,
                          ),
                        ),


                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.02.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
