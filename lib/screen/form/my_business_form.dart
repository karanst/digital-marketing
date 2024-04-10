import 'dart:io';

import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/add_business_model.dart';
import 'package:digital_marketing/model/update_business.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/business_screen.dart';
import 'package:digital_marketing/utility_widget/myappbar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyBusinessForm extends StatefulWidget {
  final selected;
  final edit;
  final editData;

  const MyBusinessForm({Key? key, this.selected, this.edit, this.editData})
      : super(key: key);

  @override
  State<MyBusinessForm> createState() => _MyBusinessFormState();
}

class _MyBusinessFormState extends State<MyBusinessForm> {
  Common _common = Common();

  File? finalImage;
  File? finalImage1;
  File? finalImage2;
  File? finalImage3;

  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var mobile1Controller = TextEditingController();
  var emailController = TextEditingController();
  var websiteController = TextEditingController();
  var addressController = TextEditingController();
  var politicalController = TextEditingController();

  var newBusinessId;

  var facebookController = TextEditingController();
  var instaController = TextEditingController();
  var twitterController = TextEditingController();
  var linkdinController = TextEditingController();
  var youtubeController = TextEditingController();
  bool load = false;

  getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      cropImage(image.path);
    } else {
      print("failed");
    }
  }

  cropImage(image) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop',
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      setState(() {
        if (widget.edit) {
          if (widget.selected) {
            _common.toast("Uploading");
            finalImage = croppedFile;
            _updateBusinessImage("logo", finalImage!.path);
          } else {
            _common.toast("Uploading");
            finalImage = croppedFile;
            _updatePoliticsImage("logo", finalImage!.path);
          }
        } else {
          setState(() {
            finalImage = croppedFile;
          });
        }
      });
    }
  }

  getImage1() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      cropImage1(image.path);
    } else {
      print("failed");
    }
  }

  cropImage1(image) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop',
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      setState(() {
        if (widget.edit) {
          if (widget.selected) {
            _common.toast("Uploading");
            print("Business");
            finalImage1 = croppedFile;
            _updateBusinessImage("watermark", finalImage1!.path);
          } else {
            _common.toast("Uploading");
            print("Politics W");
            finalImage1 = croppedFile;
            _updatePoliticsImage("watermark", finalImage1!.path);
          }
        } else {
          setState(() {
            finalImage1 = croppedFile;
          });
        }
      });
    }
  }

  getImage2() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      cropImage2(image.path);
    } else {
      print("failed");
    }
  }

  cropImage2(image) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop',
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      setState(() {
        if (widget.edit) {
          if (widget.selected) {
            // _common.toast("Uploading");
            print("Business");
            finalImage2 = croppedFile;
            // _updateBusinessImage("left_side", finalImage1!.path);
          } else {
            _common.toast("Uploading");
            print("Politics L");
            finalImage2 = croppedFile;
            _updatePoliticsImage("left_side", finalImage2!.path);
          }
        } else {
          setState(() {
            finalImage2 = croppedFile;
          });
        }
      });
    }
  }

  getImage3() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      cropImage3(image.path);
    } else {
      print("failed");
    }
  }

  cropImage3(image) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop',
            toolbarColor: Colors.blueAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      setState(() {
        if (widget.edit) {
          if (widget.selected) {
            // _common.toast("Uploading");
            print("Business");
            // finalImage3 = croppedFile;
            // _updateBusinessImage("watermark", finalImage1!.path);
          } else {
            _common.toast("Uploading");
            print("Politics R");
            finalImage3 = croppedFile;
            _updatePoliticsImage("right_side", finalImage3!.path);
          }
        } else {
          setState(() {
            finalImage3 = croppedFile;
          });
        }
      });
    }
  }

  createBusiness(user) async {
    if (_formKey.currentState!.validate() &&
        finalImage != null &&
        // finalImage1 != null &&
        newBusinessId != null) {
      try {
        var userId = "$user";
        var bName = nameController.text;
        var bMobile = mobileController.text;
        var bMobile2 = mobile1Controller.text;
        var bEmail = emailController.text;
        var bWebsite = websiteController.text;
        var bAddress = addressController.text;
        var bCategoryId = newBusinessId;
        var bTwitter = twitterController.text;
        var bInstagram = instaController.text;
        var bLinkdin = linkdinController.text;
        var bYoutube = youtubeController.text;
        var bFacebook = facebookController.text;
        var logo = finalImage!.path;
         // var waterMark = finalImage1!.path;
        // var waterMark = "" ;
        AddBusinessModel? model = await addBusiness(
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
          //  waterMark
        );
        if (model!.status == true) {
          setState(() {
            load = false;
          });
          Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessScreen()));
          _common.toast(model.message.toString());
        } else {
          setState(() {
            load = false;
          });
          _common.toast(model.message.toString());
        }
      } catch (e) {
        print(e);
      }
    } else {
      _common.toast("Please Provide the Mandatory Details");
    }
  }

  createPolitical(user) async {
    print("Inside createPolitical method.");
    if (_formKey.currentState!.validate() &&
        finalImage != null &&
        finalImage1 != null &&
        finalImage2 != null &&
        finalImage3 != null &&
        newBusinessId != null) {
      final userId = user;
      final bCat = "$newBusinessId";
      final bName = nameController.text;
      final bDesignation = politicalController.text;
      final bMobile = mobileController.text;
      final bMobile1 = mobile1Controller.text;
      final bFace = facebookController.text;
      final bTwi = twitterController.text;
      final bInsta = instaController.text;
      final bLink = linkdinController.text;
      final bYou = youtubeController.text;
      final logo = finalImage!.path;
      final waterMark = finalImage1!.path;
      final left = finalImage2!.path;
      final right = finalImage3!.path;
      AddBusinessModel? model = await createPoliticalBusiness(
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
          right);
      print("working here!");
      if (model!.status == true) {
        print("working here! 123");
        setState(() {
          load = false;
        });
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BusinessScreen()));
        _common.toast(model.message.toString());
      } else {
        setState(() {
          load = false;
        });
        _common.toast(model.message.toString());
      }
    }
  }

  _updateBusiness(userId) async {
    try {
      var data = widget.editData;
      var id = "${data.id}";
      var bName = nameController.text;
      var bPhone = mobileController.text;
      var bPhone1 = mobile1Controller.text;
      var bEmail = emailController.text;
      var bWebsite = websiteController.text;
      var bAddress = addressController.text;
      var bCategory = newBusinessId ?? "${data.businessCategory}";
      var bTwitter = twitterController.text;
      var bInstagram = instaController.text;
      var bLinkdin = linkdinController.text;
      var bYoutube = youtubeController.text;
      var bFacebook = facebookController.text;
      UpdateBusiness? model = await updateBusiness(
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
          false,
          "",
          "");
      print("this is model status 12345 ${model!.status}");
      if (model.status == true) {
        setState(() {
          load = false;
        });
        Navigator.pop(context, true);
        Navigator.of(context).pop();
        _common.toast(model.message.toString());
      } else {
        setState(() {
          load = false;
        });
        _common.toast(model.message.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  _updatePolitics(userId) async {
    try {
      var id = "${widget.editData.id}";
      var bCat = newBusinessId ?? "${widget.editData.businessCategory}";
      var bName = nameController.text;
      var bDes = politicalController.text;
      var bPhone = mobileController.text;
      // var bPhone1 = mobile1Controller.text;
      var bFacebook = facebookController.text;
      var bTwitter = twitterController.text;
      var bInstagram = instaController.text;
      var bLinkdin = linkdinController.text;
      var bYoutube = youtubeController.text;
      UpdateBusiness? model = await updatePolitics(
          id,
          userId,
          bCat,
          bName,
          bDes,
          bPhone,

          bFacebook,
          bTwitter,
          bInstagram,
          bLinkdin,
          bYoutube , false , "" ,"");
      if (model!.status == true) {
        Navigator.pop(context, true);
        Navigator.of(context).pop();
        _common.toast(model.message.toString());
      } else {
        _common.toast(model.message.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  _updateBusinessImage(type, image) async {
    try {
      var data = widget.editData;
      var id = "${data.id}";
      var userId = "${data.userId}";
      var bName = nameController.text;
      var bPhone = mobileController.text;
      var bPhone1 = mobile1Controller.text;
      var bEmail = emailController.text;
      var bWebsite = websiteController.text;
      var bAddress = addressController.text;
      var bCategory = newBusinessId ?? "${data.businessCategory}";
      var bTwitter = twitterController.text;
      var bInstagram = instaController.text;
      var bLinkdin = linkdinController.text;
      var bYoutube = youtubeController.text;
      var bFacebook = facebookController.text;
      UpdateBusiness? model = await updateBusiness(
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
          true,
          type,
          image);
      if (model!.status == true) {
         // Navigator.pop(context, true);
         // Navigator.pop(context, true);
        _common.toast(model.message.toString());
      } else {
        _common.toast(model.message.toString());
      }
    } catch (e) {
      print(e);
    }
  }
  
  _updatePoliticsImage(type , image)async{
    var data = widget.editData;
    try {
      var id = "${widget.editData.id}";
      var userId = "${data.userId}";
      var bCat = newBusinessId ?? "${widget.editData.businessCategory}";
      var bName = nameController.text;
      var bDes = politicalController.text;
      var bPhone = mobileController.text;
      // var bPhone1 = mobile1Controller.text;
      var bFacebook = facebookController.text;
      var bTwitter = twitterController.text;
      var bInstagram = instaController.text;
      var bLinkdin = linkdinController.text;
      var bYoutube = youtubeController.text;
      UpdateBusiness? model = await updatePolitics(
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
          bYoutube , true , type ,image);
      if (model!.status == true) {
        _common.toast(model.message.toString());
      } else {
        _common.toast(model.message.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var imageData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.edit && widget.selected) {
      nameController.text = widget.editData.businessName;
      mobileController.text = widget.editData.businessMobile;
      mobile1Controller.text = widget.editData.businessMobile2;
      emailController.text = widget.editData.businessEmail;
      websiteController.text = widget.editData.businessWebsite;
      addressController.text = widget.editData.businessAddress;
      facebookController.text = widget.editData.facebookLink;
      instaController.text = widget.editData.linkInstagram;
      twitterController.text = widget.editData.linkTwitter;
      linkdinController.text = widget.editData.linkLinkdin;
      youtubeController.text = widget.editData.linkYoutube;
      imageData = widget.editData;
    }

    if (widget.edit && widget.selected == false) {
      nameController.text = widget.editData.politicalName;
      politicalController.text = widget.editData.politicalDesgination;
      mobileController.text = widget.editData.politicalMobile;
      mobile1Controller.text = widget.editData.politicalMobile2;
      facebookController.text = widget.editData.facebookLink;
      instaController.text = widget.editData.instagramLink;
      twitterController.text = widget.editData.teitterLink;
      linkdinController.text = widget.editData.linkdinLink;
      youtubeController.text = widget.editData.youtubeLink;
      imageData = widget.editData;
    }
  }
  bool loading = false;
  @override
  Widget build(BuildContext context) {

    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyappBarView(
                myTitle: "My Business",
                status: true,
                action: Container(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          finalImage != null
                              ? Expanded(
                                  child: Card(
                                      elevation: 4,
                                      child:
                                          Image.file(File(finalImage!.path))))
                              : imageData != null
                                  ? Expanded(
                                      child: InkWell(
                                      onTap: () {
                                        getImage();
                                      },
                                      child: Card(
                                          elevation: 4,
                                          child: commonImage(widget.selected
                                              ? "${imageData.logo}"
                                              : "${imageData.businessLogo}")),
                                    ))
                                  : Expanded(
                                      child: InkWell(
                                        child: Card(
                                          child: Column(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    getImage();
                                                  },
                                                  icon: Icon(Icons.add)),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text("Add Logo"),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                          finalImage1 != null
                              ? Expanded(
                                  child: Card(
                                      elevation: 4,
                                      child:
                                          Image.file(File(finalImage1!.path))))
                              : imageData != null
                                  ? Expanded(
                                      child: InkWell(
                                      onTap: () {
                                        getImage1();
                                      },
                                      child: Card(
                                          elevation: 4,
                                          child: commonImage(
                                              "${imageData.watermark}")),
                                    ))
                                  : widget.selected == true ? SizedBox.shrink() : Expanded(
                                      child: Card(
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                getImage1();
                                              },
                                              icon: Icon(Icons.add)),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Profile Logo"),
                                          )
                                        ],
                                      ),
                                    )),
                        ],
                      ),
                      widget.selected
                          ? Container()
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                finalImage2 != null
                                    ? Expanded(
                                    child: Card(
                                        elevation: 4,
                                        child:
                                        Image.file(File(finalImage2!.path))))
                                    : imageData != null
                                    ? Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        getImage2();
                                      },
                                      child: Card(
                                          elevation: 4,
                                          child: commonImage(
                                              "${imageData.leftSide}")),
                                    ))
                                    : Expanded(
                                    child: Card(
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                getImage2();
                                              },
                                              icon: Icon(Icons.add)),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Left Side"),
                                          )
                                        ],
                                      ),
                                    )),
                               /* imageData != null
                                    ? Expanded(
                                        child: Card(
                                            elevation: 4,
                                            child: commonImage(
                                                "${imageData.leftSide}")))
                                    : finalImage2 == null
                                        ? Expanded(
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        getImage2();
                                                      },
                                                      icon: Icon(Icons.add)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        "Add Left Side Image"),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : Expanded(
                                            child: Card(
                                                elevation: 4,
                                                child: Image.file(
                                                    File(finalImage2!.path)))),*/
                                /*imageData != null
                                    ? Expanded(
                                        child: Card(
                                            elevation: 4,
                                            child: commonImage(
                                                "${imageData.rightSide}")))
                                    : finalImage3 == null
                                        ? Expanded(
                                            child: Card(
                                            child: Column(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      getImage3();
                                                    },
                                                    icon: Icon(Icons.add)),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      "Add Right Side Image"),
                                                )
                                              ],
                                            ),
                                          ))
                                        : Expanded(
                                            child: Card(
                                                elevation: 4,
                                                child: Image.file(
                                                    File(finalImage3!.path)))),*/
                                finalImage3 != null
                                    ? Expanded(
                                    child: Card(
                                        elevation: 4,
                                        child:
                                        Image.file(File(finalImage3!.path))))
                                    : imageData != null
                                    ? Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        getImage3();
                                      },
                                      child: Card(
                                          elevation: 4,
                                          child: commonImage(
                                              "${imageData.rightSide}")),
                                    ))
                                    : Expanded(
                                    child: Card(
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                getImage3();
                                              },
                                              icon: Icon(Icons.add)),
                                          const  Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("Right Side"),
                                          )
                                        ],
                                      ),
                                    )
                                ),
                              ],
                            ),
                      CustomTextField(
                        check: true,
                        controller: nameController,
                        maxLength: 24,
                        label: widget.selected
                            ? "Enter Your Business Name"
                            : "Enter Political Name",
                      ),
                      widget.selected
                          ? Container()
                          : CustomTextField(
                              check: true,
                              controller: politicalController,
                              label: "Enter Your Political Designation",
                            ),
                      CustomTextField(
                          check: true,
                          keyBoardType: TextInputType.number,
                          controller: mobileController,
                          label: "Enter Your Business Mobile 1"),
                      // CustomTextField(
                      //     check: false,
                      //     keyBoardType: TextInputType.number,
                      //     controller: mobile1Controller,
                      //     label: "Mobile 2 (Optional)"),
                      widget.selected
                          ? Column(
                              children: [
                                CustomTextField(
                                  keyBoardType: TextInputType.emailAddress,
                                  check: widget.selected,
                                  maxLength: 33,
                                  controller: emailController,
                                  label: "Enter your Business Email",
                                ),
                                CustomTextField(
                                  check: false,
                                  controller: websiteController,
                                  label: "Enter your Business Website",
                                ),
                                CustomTextField(
                                  check: true,
                                  maxLength: 40,
                                  controller: addressController,
                                  label: "Enter your Business Address",
                                ),
                              ],
                            )
                          : Container(),
                      FutureBuilder(
                          future: getBusinessCategory(
                              widget.selected ? "business" : "political"),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List businessName = snapshot.data.data
                                  .map((e) => e.title)
                                  .toList();
                              List businessId =
                                  snapshot.data.data.map((e) => e.id).toList();
                              return snapshot.data.status
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 4),
                                      child: SizedBox(
                                        height: 40,
                                        child: DropdownSearch<dynamic>(
                                            showSearchBox: true,
                                            mode: Mode.DIALOG,
                                             items: snapshot.data.data
                                                .map((e) => e.title)
                                                .toList(),
                                            label: "Business Category",
                                            onChanged: (value) {
                                              newBusinessId = businessId[
                                                  businessName.indexOf(value)];
                                            },
                                            selectedItem: "Select"),
                                      ),
                                    )
                                  : Text("Error");
                            } else if (snapshot.hasError) {
                              return Icon(Icons.error_outline);
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                      CustomTextField(
                          check: false,
                          controller: facebookController,
                          label: "Enter Facebook Page Name"),
                      CustomTextField(
                          check: false,
                          controller: instaController,
                          label: "Enter Instagram Page Name"),
                      CustomTextField(
                          check: false,
                          controller: twitterController,
                          label: "Enter Twitter Page Name"),
                      CustomTextField(
                          check: false,
                          controller: linkdinController,
                          label: "Enter Linkdin Page Name"),
                      CustomTextField(
                          check: false,
                          controller: youtubeController,
                          label: "Enter Youtube Page Name"),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19),
                        child:
                        //loading?Center(child: CircularProgressIndicator(),):
                        CustomButton(
                          onTap: () async {
                            setState(() {
                              load = true;
                            });
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Adding business, please wait..."),
                                    SizedBox(height: 10,),
                                    CircularProgressIndicator(),
                                  ],
                                ),
                              );
                            });
                            if (widget.edit == false) {
                              widget.selected
                                  ? createBusiness(user.userId)
                                  : createPolitical(user.userId);
                            }
                            widget.edit && widget.selected
                                ? _updateBusiness(user.userId)
                                : print("hey");
                            widget.edit && widget.selected == false
                                ? _updatePolitics(user.userId)
                                : print("nothing");
                          },
                          btnTitle: "Finish",
                           show: load,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final controller;
  final label;
  final check;
  final keyBoardType;
  final maxLength;
  const CustomTextField(
      {Key? key, this.controller, @required this.label, this.check, this.keyBoardType,this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextFormField(
        keyboardType: keyBoardType,
        controller: controller,
        maxLength: maxLength,
        validator: check
            ? (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }
            : (value) {
                print(value);
              },
        decoration: InputDecoration(
            fillColor: Colors.grey.shade100, filled: true, label: Text(label)),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final onTap;
  final btnTitle;
  final bool? show;

  const CustomButton({Key? key, this.onTap, this.btnTitle, this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ScaleAnimatedWidget.tween(
        enabled: false,
        duration: Duration(milliseconds: 200),
        scaleDisabled: 1.0,
        scaleEnabled: 0.9,
        child: Container(
          width: 66.66.w,
          height: 5.87.h,
          decoration: boxDecoration(
              radius: 30.0, bgColor: AppColor().colorPrimaryDark()),
          child:
           show! ?
          Center(child: Container(
            width: 30,
              height: 30,
              child: CircularProgressIndicator(color: Colors.white,)))
         :  Center(
            child: text(
              "$btnTitle",
              textColor: AppColor().colorBg1(),
              fontSize: 14.5.sp,
              fontFamily: fontRegular,
            ),
          )

        ),
      ),
    );
  }
}
