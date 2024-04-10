import 'dart:io';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/update_user_model.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/profile_screen.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';


class EditProfileScreen extends StatefulWidget {
  final userData;

  const EditProfileScreen({Key? key, this.userData}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin {
  Common common = Common();
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
  File? finalImage;

  var opacity = .5;

  getImage(newUserId) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      cropImage(image.path, newUserId);
    } else {
      print("failed");
    }
  }

  cropImage(image, newUserId) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Crop',
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      common.toast("Uploading");
      setState(() {
        finalImage = croppedFile;
      });
      var userId = newUserId;
      var userName = nameController.text;
      var newEmail = emailController.text.isEmpty ? "email id" : emailController.text;
      var newImage = croppedFile.path;
      UpdateUserModel? model =
          await updateImage(userId, userName, newEmail, newImage);
      if(model!.status == true){
        setState(() {
          enabled = true;
          selected = true;
        });
        await Future.delayed(Duration(milliseconds: 200));
        setState(() {
          enabled = false;
        });
        Navigator.pop(context);
        Navigator.pop(context, true);
       // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),);
        common.toast(model.message.toString());
      }else{
        common.toast(model.message.toString());
      }

    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    changePage();
    nameController.text = widget.userData.userFullname;
    emailController.text = widget.userData.userEmail;
    phoneController.text = widget.userData.userPhone;
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
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
        ),
        backgroundColor:   AppColor().colorPrimary(),
      ),
      backgroundColor: AppColor().colorBg1(),
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
                width: 83.33.w,
                height: 46.32.h,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor().colorView().withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 1)
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0)),
                ),
                child: firstSign(context),
              ),

              Positioned(
                top: 10.49.h,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: 11.55.h,
                      width: 14.55.h,
                      child: finalImage != null
                          ? Opacity(
                            opacity: opacity,
                            child: CircleAvatar(
                              radius: 25,
                                backgroundImage:
                                    FileImage(File(finalImage!.path)),
                              ),
                          )
                          : widget.userData.userImage != ""
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://taskglare.in/Digital/Admin/api/uploads/user_upload/${widget.userData.userImage}"),
                                )
                              : CircleAvatar(
                        backgroundImage: AssetImage(editProfile),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        getImage(user.userId);
                      },
                      child: Container(
                        height: 4.39.h,
                        width: 4.39.h,
                        margin: EdgeInsets.only(right: 5.w, bottom: 1.h),
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
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 68.h, bottom: 8.h),
                  child: InkWell(
                    onTap: () async {

                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Updating profile, please wait..."),
                              SizedBox(
                                height: 10,
                              ),
                              CircularProgressIndicator(),
                            ],
                          ),
                        );
                      });
                      if (nameController.text.isNotEmpty &&
                          emailController.text.isNotEmpty) {
                        var userId = user.userId;
                        var userName = nameController.text;
                        var newEmail = emailController.text;
                        updateProfile(userId, userName, newEmail);

                        UpdateUserModel? model =
                            await updateProfile(userId, userName, newEmail);
                        print("this is model status ${model!.status}");

                        if(model.status == true){
                          Navigator.pop(context);
                          Navigator.pop(context, true);
                          setState(() {
                            enabled = true;
                            selected = true;
                          });
                          await Future.delayed(Duration(milliseconds: 200));
                          setState(() {
                            enabled = false;
                          });

                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()),);
                          common.toast(model.message.toString());
                        }else{
                          common.toast(model.message.toString());
                        }
                      }else{
                        common.toast("Fill all Details");
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
        Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                        labelText: 'User Name',
                        labelStyle: TextStyle(
                          color: AppColor().colorTextFour(),
                          fontSize: 10.sp,
                        ),
                        helperText: '',
                        counterText: '',
                        fillColor: AppColor().colorEdit(),
                        enabled: true,
                        filled: true,
                        prefixIcon: Container(
                          padding: EdgeInsets.all(3.5.w),
                          child: Image.asset(
                            person,
                            width: 1.04.w,
                            height: 1.04.w,
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
                          borderSide: BorderSide(
                              color: AppColor().colorEdit(), width: 5.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Container(
                    child: TextFormField(
                      cursorColor: Colors.red,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
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
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: AppColor().colorTextFour(),
                          fontSize: 10.sp,
                        ),
                        helperText: '',
                        counterText: '',
                        fillColor: AppColor().colorEdit(),
                        enabled: true,
                        filled: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(3.5.w),
                          child: Image.asset(
                            email,
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
                          borderSide: BorderSide(
                              color: AppColor().colorEdit(), width: 5.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  // Container(
                  //   width: 69.99.w,
                  //   height: 9.46.h,
                  //   child: TextFormField(
                  //     cursorColor: Colors.red,
                  //     keyboardType: TextInputType.phone,
                  //     controller: phoneController,
                  //     style: TextStyle(
                  //       color: AppColor().colorTextFour(),
                  //       fontSize: 10.sp,
                  //     ),
                  //     inputFormatters: [],
                  //     decoration: InputDecoration(
                  //       focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(
                  //             color: AppColor().colorEdit(),
                  //             width: 1.0,
                  //             style: BorderStyle.solid),
                  //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //       ),
                  //       labelText: 'Mobile Number',
                  //       labelStyle: TextStyle(
                  //         color: AppColor().colorTextFour(),
                  //         fontSize: 10.sp,
                  //       ),
                  //       helperText: '',
                  //       counterText: '',
                  //       fillColor: AppColor().colorEdit(),
                  //       enabled: true,
                  //       filled: true,
                  //       prefixIcon: Padding(
                  //         padding: EdgeInsets.all(3.5.w),
                  //         child: Image.asset(
                  //           phone,
                  //           width: 2.04.w,
                  //           height: 2.04.w,
                  //           fit: BoxFit.fill,
                  //         ),
                  //       ),
                  //       suffixIcon: phoneController.text.length == 10
                  //           ? Container(
                  //           width: 10.w,
                  //           alignment: Alignment.center,
                  //           child: FaIcon(
                  //             FontAwesomeIcons.check,
                  //             color: AppColor().colorPrimary(),
                  //             size: 10.sp,
                  //           ))
                  //           : SizedBox(),
                  //       enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(
                  //             color: AppColor().colorEdit(), width: 5.0),
                  //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
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
