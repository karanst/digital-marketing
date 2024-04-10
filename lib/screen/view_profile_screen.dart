import 'package:animated_widgets/animated_widgets.dart';
import 'package:digital_marketing/screen/edit_profile_screen.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';

class ViewProfileScreen extends StatefulWidget {
  final userData;
  final String? name,phone;
  final bool? isSignup;
  const ViewProfileScreen({Key? key, this.userData,this.phone,this.name,this.isSignup}) : super(key: key);

  @override
  _ViewProfileScreenState createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController cPassController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController aadharController = new TextEditingController();
  TextEditingController addController = new TextEditingController();
  bool status = false;
  bool selected = false, enabled = false, edit1 = false;
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
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),

        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),

        ),
        backgroundColor:   AppColor().colorPrimary(),

      ),
      backgroundColor:AppColor().colorBg1(),
      body: SingleChildScrollView(
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
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(top: 18.h),
                width: 99.33.w,
                height:  72.05.h,
                child: firstSign(context),
              ),
              // Container(
              //   height: 17.89.h,
              //   width: 100.w,
              //   alignment: Alignment.topCenter,
              //   padding: EdgeInsets.only(top: 3.h),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(50.0),
              //           bottomRight: Radius.circular(50.0)),
              //     color: AppColor().colorPrimary()
              //   ),
              //   child:  Row(
              //       children: [
              //         Container(
              //             width: 6.38.w,
              //             height: 6.38.w,
              //             alignment: Alignment.centerLeft,
              //             margin: EdgeInsets.only(left: 7.91.w),
              //             child: InkWell(
              //                 onTap: () {
              //                   Navigator.pop(context);
              //                 },
              //                 child: Image.asset(
              //                   back,
              //                   height: 4.0.h,
              //                   width: 8.w,
              //                 ))),
              //         SizedBox(
              //           width: 2.08.h,
              //         ),
              //         Container(
              //           width: 65.w,
              //           child: text(
              //             "My Profile",
              //             textColor: Color(0xffffffff),
              //             fontSize: 14.sp,
              //             fontFamily: fontMedium,
              //             isCentered: true
              //           ),
              //         ),
              //       ],
              //     ),
              // ),
              Positioned(
                top: 10.49.h,
                child:  Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 14.66.h,
                      width: 14.66.h,
                      child: widget.userData.userImage != ""
                          ? CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://taskglare.in/Digital/Admin/api/uploads/user_upload/${widget.userData.userImage}"),
                      )
                          : Image(
                        image: AssetImage(editProfile),
                        fit: BoxFit.cover,
                        height: 14.66.h,
                        width: 14.66.h,
                      ),
                    ),
                  ],
                ),
              ),

            ],
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
        SizedBox(
          height: 9.92.h,
        ),
        Container(
          margin: EdgeInsets.only(
              left: 8.33.w, right: 8.33.w, bottom: 1.87.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(
                "User Name",
                textColor: Color(0xff8A8787),
                fontSize: 10.sp,
                fontFamily: fontRegular,
              ),
            widget.isSignup == true ? text(
              "${widget.name}",
              textColor: Color(0xff202442),
              fontSize: 10.sp,
              fontFamily: fontBold,
            ) : text(
                "${widget.userData.userFullname}",
                textColor: Color(0xff202442),
                fontSize: 10.sp,
                fontFamily: fontBold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.02.h,
        ),
     widget.userData.userEmail == null ? Container(
       margin: EdgeInsets.only(
           left: 8.33.w, right: 8.33.w, bottom: 1.87.h),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           text(
             "Email",
             textColor: Color(0xff8A8787),
             fontSize: 10.sp,
             fontFamily: fontRegular,
           ),
          Text("NO Email"),
         ],
       ),
     ) :  Container(
          margin: EdgeInsets.only(
              left: 8.33.w, right: 8.33.w, bottom: 1.87.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(
                "Email",
                textColor: Color(0xff8A8787),
                fontSize: 10.sp,
                fontFamily: fontRegular,
              ),
            text(
                "${widget.userData.userEmail == "" || widget.userData.userEmail == null   ? "No Email" :widget.userData.userEmail }",
                textColor: Color(0xff202442),
                fontSize: 10.sp,
                fontFamily: fontBold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.02.h,
        ),
        Container(
          margin: EdgeInsets.only(
              left: 8.33.w, right: 8.33.w, bottom: 1.87.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(
                "Mobile Number",
                textColor: Color(0xff8A8787),
                fontSize: 10.sp,
                fontFamily: fontRegular,
              ),
            widget.isSignup == true ?  text(
              "+91 ${widget.phone}",
              textColor: Color(0xff202442),
              fontSize: 10.sp,
              fontFamily: fontBold,
            ) :  text(
                "+91 ${widget.userData.userPhone}",
                textColor: Color(0xff202442),
                fontSize: 10.sp,
                fontFamily: fontBold,
              ),
            ],
          ),
        ),
    /*    SizedBox(
          height: 3.02.h,
        ),
        Container(
          margin: EdgeInsets.only(
              left: 8.33.w, right: 8.33.w, bottom: 1.87.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(
                "Password",
                textColor: Color(0xff8A8787),
                fontSize: 10.sp,
                fontFamily: fontRegular,
              ),
              text(
                "000000000",
                textColor: Color(0xff202442),
                fontSize: 10.sp,
                fontFamily: fontBold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.02.h,
        ),
        Container(
          margin: EdgeInsets.only(
              left: 8.33.w, right: 8.33.w, bottom: 1.87.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(
                "Aadhar Card No.",
                textColor: Color(0xff8A8787),
                fontSize: 10.sp,
                fontFamily: fontRegular,
              ),
              text(
                "623322114452",
                textColor: Color(0xff202442),
                fontSize: 10.sp,
                fontFamily: fontBold,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.02.h,
        ),
        Container(
          margin: EdgeInsets.only(
              left: 8.33.w, right: 8.33.w, bottom: 1.87.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(
                "Permanent Address",
                textColor: Color(0xff8A8787),
                fontSize: 10.sp,
                fontFamily: fontRegular,
              ),
              Container(
                width: 33.88.w,
                child: text(
                  "4 Weemala Avenue, Flyers Creek,New South Wales",
                  textColor: Color(0xff202442),
                  fontSize: 10.sp,
                    isEnd: true,

                    fontFamily: fontBold,
                  maxLine: 3
                ),
              ),
            ],
          ),
        ),*/
        SizedBox(
          height: 3.02.h,
        ),
        Center(
          child: Container(
            child: InkWell(
              onTap: () async {
                setState(() {
                  enabled = true;
                  selected = true;
                });
                await Future.delayed(Duration(milliseconds: 200));
                setState(() {
                  enabled = false;
                });

        var data = await  Navigator.push(context, PageTransition(child: EditProfileScreen(userData: widget.userData,), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 500),));
            if(data== true){
              Navigator.pop(context, true);
            }
            else{
            }
                },
              child: ScaleAnimatedWidget.tween(
                enabled: enabled,
                duration: Duration(milliseconds: 200),
                scaleDisabled: 1.0,
                scaleEnabled: 0.9,
                child: Container(
                  width: 86.66.w,
                  height: 6.46.h,
                  decoration: boxDecoration(
                      radius: 15.0, bgColor: AppColor().colorPrimaryDark()),
                  child: Center(
                    child: text(
                      "Update Profile",
                      textColor: Color(0xffffffff),
                      fontSize: 14.sp,
                      fontFamily: fontRegular,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1.46.h,
        ),

      ],
    );
  }

}
