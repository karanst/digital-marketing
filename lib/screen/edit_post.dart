import 'dart:convert';

import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/frame_model.dart';
import 'package:digital_marketing/model/get_politica_list_model.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/save_image.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../model/PurchaseHistoryModel.dart';
import '../model/get_business_list_model.dart';
import 'package:http/http.dart' as http;

class EditPostPage extends StatefulWidget {
  final image;
  const EditPostPage({Key? key, this.image}) : super(key: key);

  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  Uint8List? _imageFile;
  ScreenshotController screenshotController = ScreenshotController();
  List<FrameModel> frameModel = [];
  int frameIndex = 0;
  PurchaseHistoryModel? historyModel;
  var user;
  String name = "",
      logo = "",
      leftLogo = "",
      rightLogo = "",
      waterMarkLogo = "",
      number = "",
      optionalContactNo = "",
      email = "",
      address = "",
      designation = "";


  @override
  void initState() {
    super.initState();
    getBusiness();
    getPolitical();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      planHistory();
    });
    _tabController = TabController(length: 6, vsync: this);
    addBusinessPlanFrames();
    // bottom: 2.5.h,
    // right: 62.w,
    // Frame 1
  }

  GetBusinessListModel? model;
  getBusiness() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://taskglare.in/Digital/Admin/api/Products/getMyBusiness'));
    request.fields.addAll({'user_id': pref.getString("userId")!});

    http.StreamedResponse response = await request.send();
    print(request);
    print(request.fields);

    if (response.statusCode == 200) {
      final str = await response.stream.bytesToString();
      print(str);
      setState(() {
        model = GetBusinessListModel.fromJson(json.decode(str));
      });
    } else {
      return null;
    }
  }

  GetPoliticaListModel? model1;
  getPolitical() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://taskglare.in/Digital/Admin/api/Products/getpoliticalBusiness'));
    request.fields.addAll({'user_id': pref.getString("userId")!});

    http.StreamedResponse response = await request.send();
    print(request);
    print(request.fields);

    if (response.statusCode == 200) {
      final str = await response.stream.bytesToString();
      print(str);
      setState(() {
        model1 = GetPoliticaListModel.fromJson(json.decode(str));
      });
    } else {
      return null;
    }
  }

  // business frames list
  addBusinessPlanFrames() {
    frameModel = [];

    frameModel.add(
      FrameModel(
        "images/frame/1.png",
        {
          //Logo
          "show": true,
          "color": Colors.transparent,
          "size": 8.w,
          "AxisX": 1.w,
          "AxisY": 1.h,
        },
        {
          //Email
          "show": true,
          "size": 8.sp,
          "color": Colors.black,
          "AxisX": 1.5.w,
          "AxisY": 2.8.h,
        },
        {
          //contact
          "show": true,
          "size": 8.sp,
          "color": Colors.white,
          "AxisX": 2.w,
          "AxisY": 2.8.h,
          "align": "left"
        },
        {
          // address
          "show": true,
          "size": 10.sp,
          "color": Colors.white,
          "AxisX": 30.w,
          "AxisY": 0.2.h,
          "center": true
        },
        {
          "show": true,
          "size": 10.sp,
          "color": Colors.black,
          "AxisX": 2.w,
          "AxisY": 5.h,
          "align": "left",
          "alignVertical": "bottom"
        },
        {
          "show": true,
          "color": Colors.black,
          "size": 10.sp,
          "AxisX": 2.w,
          "AxisY": 5.h,
        },
        optionalContactNo: {
          //contact
          "show": true,
          "size": 8.sp,
          "color": Colors.white,
          "AxisX": null,
          "AxisY": 2.8.h,
          "align": "left"
        },
      ),
    );
    // Frame 2
    frameModel.add(
      FrameModel("images/frame/2.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 1.5.w,
        "AxisY": 0.27.h,
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 10.w,
        "AxisY": 2.9.h,
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 0.6.h,
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 2.w,
        "AxisY": 3.2.h,
        "alignVertical": "bottom",
        "align": "left"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 5.h,
      }),
    );
    // Frame 3
    frameModel.add(
      FrameModel("images/frame/3.png", {
        // Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 2.4.h,
        "align": "right"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 0.5.h,
        "align": "right"
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 2.w,
        "AxisY": 4.5.h,
        "alignVertical": "bottom",
        "align": "left"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 5.h,
      }, optionalContactNo: {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 0.3.h,
        "align": "left"
      }),
    );
    // Frame 4
    frameModel.add(
      FrameModel("images/frame/4.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 6.6.sp,
        "color": Colors.black,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 11.5.w,
        "AxisY": 3.2.h,
        "align": "right"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "align": "left",
        "AxisY": 0.2.h,
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 2.w,
        "AxisY": 5.2.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 5.h,
      }),
    );
    // Frame 5
    frameModel.add(
      FrameModel("images/frame/5.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 0.2.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 2.w,

        "AxisY": 2.0.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 15.w,
        "AxisY": 1.8.h,
        "align": "right"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 2.w,
        "AxisY": 4.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 4.h,
      }),
    );
    //frame 6
    frameModel.add(
      FrameModel("images/frame/business1.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 2.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 8.w,
        "AxisY": 6.5.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 0.2.h,
        "align": "left"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 6.5.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 8.sp,
        "AxisX": 42.w,
        "AxisY": 6.5.h,
        // "direction":"vertical",
      }),
    );
    //frame 7
    frameModel.add(
      FrameModel("images/frame/business2.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 2.5.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 2.w,
        "AxisY": 1.5.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 0.5.h,
        "align": "left"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 6.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 8.sp,
        "AxisX": 2.w,
        "AxisY": 6.h,
        "direction": "vertical",
      }),
    );
    //frame 8
    frameModel.add(
      FrameModel("images/frame/business3.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 5.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 10.w,
        "AxisY": 9.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 35.w,
        "AxisY": 1.h,
        "align": "left"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 9.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.white,
        "size": 8.sp,
        "AxisX": 2.w,
        "AxisY": 5.h,
        "direction": "vertical",
      }),
    );
    //frame 9
    frameModel.add(
      FrameModel("images/frame/business4.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 7.w,
        "AxisY": 5.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 10.w,
        "AxisY": 9.5.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 35.w,
        "AxisY": 1.3.h,
        "align": "left"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 9.5.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.white,
        "size": 8.sp,
        "AxisX": 5.w,
        "AxisY": 5.8.h,
        "direction": "vertical",
      }),
    );
    //frame 10
    frameModel.add(
      FrameModel("images/frame/business5.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 5.w,
        "AxisY": 1.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 18.w,
        "AxisY": 5.5.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 58.w,
        "AxisY": 1.h,
        "align": "left"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 10.w,
        "AxisY": 5.5.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 8.sp,
        "AxisX": 3.w,
        "AxisY": 10.h,
        "direction": "vertical",
      }),
    );
//frame 11
    frameModel.add(
      FrameModel("images/frame/business6.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 5.h,

        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 10.w,
        "AxisY": 8.7.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 1.h,
        "align": "left"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 8.7.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.white,
        "size": 8.sp,
        "AxisX": 3.w,
        "AxisY": 5.h,
        "direction": "vertical",
      }),
    );
    //frame 12
    frameModel.add(
      FrameModel("images/frame/business7.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 6.h,

        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 75.w,
        "AxisY": 10.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 1.h,
        "align": "left"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 34.w,
        "AxisY": 10.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 0.5.w,
        "AxisY": 11.5.h,
      }),
    );

    //frame 13
    frameModel.add(
      FrameModel("images/frame/business8.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 3.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 12.5.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 0.5.h,

        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 7.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.white,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 7.h,
        "direction": "vertical"
      }),
    );
    //frame 14
    frameModel.add(
      FrameModel("images/frame/business9.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 30.w,
        "AxisY": 4.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 0.w,
        "AxisY": 7.5.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 35.w,
        "AxisY": 1.h,

        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 27.w,
        "AxisY": 7.5.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.white,
        "size": 10.sp,
        "AxisX": 80.w,
        "AxisY": 3.h,
      }),
    );
    //frame 15
    frameModel.add(
      FrameModel("images/frame/business10.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 30.w,
        "AxisY": 4.7.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 75.w,
        "AxisY": 4.7.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 1.h,

        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 8.3.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 5.w,
        "AxisY": 12.h,
        "direction": "vertical"
      }),
    );
    //frame 16
    frameModel.add(
      FrameModel("images/frame/business11.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 3.w,
        "AxisY": 4.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 76.w,
        "AxisY": 11.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 3.w,
        "AxisY": 1.h,
        "align": "left"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 3.w,
        "AxisY": 7.8.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 8.h,
        "direction": "vertical"
      }),
    );
    //frame 17
    frameModel.add(
      FrameModel("images/frame/business12.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 15.w,
        "AxisY": 4.0.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 70.w,
        "AxisY": 7.5.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 15.w,
        "AxisY": 1.0.h,
        "align": "left"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 5.w,
        "AxisY": 11.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.white,
        "size": 10.sp,
        "AxisX": 5.w,
        "AxisY": 7.5.h,
        "direction": "vertical"
      }),
    );
    //frame 18
    frameModel.add(
      FrameModel("images/frame/business13.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 1.h,

        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 5.w,
        "AxisY": 4.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 6.w,
        "AxisY": 1.h,
        "align": "right"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 4.3.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 0.5.w,
        "AxisY": 8.5.h,
        "direction": "vertical"
      }),
    );
    //frame 19
    frameModel.add(
      FrameModel("images/frame/business14.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 3.h,

        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 25.w,
        "AxisY": 6.0.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 0.5.h,

        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 6.0.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 0.5.w,
        "AxisY": 10.5.h,
      }),
    );
    //frame 20
    frameModel.add(
      FrameModel("images/frame/business15.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 25.w,
        "AxisY": 5.5.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 0.2.w,
        "AxisY": 5.5.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 35.w,
        "AxisY": 1.5.h,

        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 25.w,
        "AxisY": 9.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 75.w,
        "AxisY": 1.h,
      }),
    );
  }

  // political business frames list
  addPoliticalPlanFrames() {
    frameModel = [];
    frameModel.add(
      FrameModel("images/frame/political1.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 30.w,
        "AxisY": 1.2.h,
        "text": "\n",
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 35.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 5.5.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.white,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 5.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 3.w,
        "AxisY": 1.2.h,
        "align": 'left'
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 25.w,
        "AxisX": 0.w,
        "AxisY": 0.5.h,
        'align': "left"
      }),
    );
    // Frame 2
    // commented
    frameModel.add(
      FrameModel("images/frame/political2.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 1.5.w,
        "AxisY": 2.9.h,
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 34.w,
        "AxisY": 1.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 9.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 0.6.h,
        // "center": true
      }, {
        //name
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 34.w,
        "AxisY": 5.5.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 11.sp,
        "AxisX": 2.w,
        "AxisY": 5.h,
      }, designation: {
        // address
        "show": true,
        "size": 9.sp,
        "color": Colors.black,
        "AxisX": 2.w,
        "AxisY": 1.h,
        "align": "left",
        // "AxisY": 0.6.h,
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );

    // Frame 3
    // commented

    frameModel.add(
      FrameModel("images/frame/political3.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 1.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 22.w,
        "AxisY": 1.h,
        "text": "/",
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 0.5.w,
        "AxisY": 1.45.h,
        "align": "right"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 16.w,
        "AxisY": 5.3.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": false,
        "color": Colors.white,
        "size": 9.sp,
        "AxisX": 82.w,
        "AxisY": 0.6.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "align": "left",
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 80.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 4
    frameModel.add(
      FrameModel("images/frame/political4.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 22.w,
        "text": "/",
        "AxisY": 1.2.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 29.w,
        "AxisY": 5.6.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 11.sp,
        "AxisX": 1.2.w,
        "AxisY": 5.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 10.w,
        "AxisY": 1.h,
        'align': "left",
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 5
    frameModel.add(
      FrameModel("images/frame/political5.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 2.0.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": null,
        "AxisY": 1.7.h,
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 0.5.w,
        "AxisY": 1.8.h,
        "align": "right"
        // "center": true
      }, {
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 30.w,
        "AxisY": 6.2.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 5.8.h,
      }, designation: {
        // address
        "show": true,
        "size": 9.sp,
        "color": Colors.black,
        "AxisX": 2.w,
        "AxisY": 1.7.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 6
    // commented
    frameModel.add(
      FrameModel("images/frame/political6.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 2.0.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 28.w,
        "AxisY": 0.6.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 0.5.w,
        "AxisY": 1.8.h,
        "align": "right"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 5.3.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 8.w,
        "AxisY": 0.6.h,
        'align': "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 7
    frameModel.add(
      FrameModel("images/frame/political7.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 0.4.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 73.w,
        "AxisY": 1.h,
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 0.5.w,
        "AxisY": 1.54.h,
        "align": "right"
        // "center": true
      }, {
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 2.2.w,
        "AxisY": 6.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 22.w,
        "AxisY": 6.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 22.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 80.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 8
    frameModel.add(
      FrameModel("images/frame/political8.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 6.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 18.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 15.w,
        "AxisY": 1.h,
        "align": "left",
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 9
    frameModel.add(
      FrameModel("images/frame/political9(1).png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 5.5.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 9.sp,
        "color": Colors.white,
        "AxisX": 5.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 10
    frameModel.add(
      FrameModel("images/frame/political10.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 6.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.white,
        "size": 10.sp,
        "AxisX": 1.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 9.sp,
        "color": Colors.black,
        "AxisX": 5.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 11
    frameModel.add(
      FrameModel("images/frame/political11.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": -70.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "right"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.2.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 6.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 3.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 12
    frameModel.add(
      FrameModel("images/frame/political12.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 5.2.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 4.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 10.w,
        "AxisY": 1.h,
        "align": "left",
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 13
    // commented
    frameModel.add(
      FrameModel("images/frame/political13.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 50.w,
        "AxisY": 1.h,
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 20.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 5.2.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 6.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 8.w,
        "AxisY": 0.6.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );

    // Frame 14
    frameModel.add(
      FrameModel("images/frame/political14.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 22.w,
        "AxisY": 1.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 8.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 5.7.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 4.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 9.sp,
        "color": Colors.black,
        "AxisX": 17.5.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 15
    frameModel.add(
      FrameModel("images/frame/political15.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 5.4.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 5.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 5.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );

    // Frame 16
    frameModel.add(
      FrameModel("images/frame/political16.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "text": "/",
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 5.4.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 8.sp,
        "AxisX": 2.w,
        "AxisY": 6.9.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 1.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 17
    frameModel.add(
      FrameModel("images/frame/political17.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "text": "/",
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 5.4.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 2.w,
        "AxisY": 5.5.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 15.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 18
    frameModel.add(
      FrameModel("images/frame/political18.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": -60.w,
        "AxisY": 1.h,
        "align": "right",
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        // "AxisX": 70.w,
        // "AxisY": 2.8.h,
        "AxisX": 2.w,
        "AxisY": 0.4.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 27.w,
        "AxisY": 1.h,
        "text": "/",
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 0.5.w,
        "AxisY": 1.45.h,
        "align": "right"
        // "center": true
      }, {
        "show": true,
        "size": 9.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 5.3.h,
        "align": "Right",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.white,
        "size": 10.sp,
        "AxisX": 62.w,
        "AxisY": 5.2.h,
      }, designation: {
        // address
        "show": true,
        "size": 9.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 80.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 19
    frameModel.add(
      FrameModel("images/frame/political19.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 23.w,
        "AxisY": 1.h,
        "text": "/",
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 10.sp,
        "color": Colors.black,
        "AxisX": 23.w,
        "AxisY": 5.3.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 10.w,
        "AxisY": 5.2.h,
      }, designation: {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 17.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
    // Frame 20
    // commented
    frameModel.add(
      FrameModel("images/frame/political20.png", {
        //Logo
        "show": true,
        "color": Colors.transparent,
        "size": 8.w,
        "AxisX": 1.w,
        "AxisY": 1.h,
      }, {
        //Email
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 2.w,
        "AxisY": 2.8.h,
        "align": "left"
      }, {
        //contact
        "show": true,
        "size": 8.sp,
        "color": Colors.white,
        "AxisX": 25.w,
        "text": "/",
        "AxisY": 1.h,
        "align": "left"
      }, {
        // address
        "show": true,
        "size": 10.sp,
        "color": Colors.white,
        "AxisX": 30.w,
        "AxisY": 0.2.h,
        "center": true
      }, {
        // name
        "show": true,
        "size": 9.sp,
        "color": Colors.black,
        "AxisX": 24.w,
        "AxisY": 5.3.h,
        "align": "left",
        "alignVertical": "bottom"
      }, {
        "show": true,
        "color": Colors.black,
        "size": 10.sp,
        "AxisX": 3.w,
        "AxisY": 5.h,
      }, designation: {
        // address
        "show": true,
        "size": 9.sp,
        "color": Colors.white,
        "AxisX": 1.w,
        "AxisY": 1.h,
        "align": "left"
      }, watermark: {
        "show": true,
        "size": 20.w,
        "height": 27.w,
        "AxisX": 0.w,
        "AxisY": 0.h,
      }),
    );
  }

  changeColor(color1, index) async {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Change Color"),
            children: [
              ColorPicker(
                  paletteType: PaletteType.hueWheel,
                  pickerColor: color1,
                  onColorChanged: (Color color) {
                    if (index == 1) {
                      setState(() {
                        frameModel[frameIndex].contact['color'] = color;
                      });
                    }
                    if (index == 2) {
                      setState(() {
                        frameModel[frameIndex].email['color'] = color;
                      });
                    }
                    if (index == 3) {
                      setState(() {
                        frameModel[frameIndex].address['color'] = color;
                      });
                    }
                    if (index == 4) {
                      setState(() {
                        frameModel[frameIndex].name['color'] = color;
                      });
                    }
                    if (index == 5) {
                      setState(() {
                        frameModel[frameIndex].icon['color'] = color;
                      });
                    }
                    if (index == 6) {
                      setState(() {
                        frameModel[frameIndex].designation!['color'] = color;
                      });
                    }
                  }),
            ],
          );
        });
  }

  capture() async {
    screenshotController.capture().then((image) {
      //Capture Done
      setState(() {
        _imageFile = image;
        var images = MemoryImage(_imageFile!);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SaveImage(
                      image: images,
                    )));
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  Future planHistory() async {
    user = Provider.of<UserProvider>(context, listen: false);
    historyModel = await purchaseHistory(user.userId);
    if (historyModel!.status == true) {
      print("PLAN HISTORY =========> ${historyModel!.data![0].expSta}");
      user.planStatus = historyModel!.data![0].expSta;
      print("PLAN STATUS =========> ${user.planStatus}");
      setState(() {});
    } else {
      user.planStatus = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit"),
          actions: [
            TextButton(
                onPressed: () {
                  capture();
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ))
          ],
          centerTitle: true,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //       bottomRight: Radius.circular(25),
          //       bottomLeft: Radius.circular(25)),
          // ),
          backgroundColor:   AppColor().colorPrimary(),
          // bottom: PreferredSize(
          //   preferredSize: AppBar().preferredSize,
          //   child: Container(
          //     color: Colors.white,
          //     child: TabBar(
          //         indicatorColor: AppColor().colorPrimary(),
          //         indicatorSize: TabBarIndicatorSize.label,
          //         labelColor: AppColor().colorPrimary(),
          //         unselectedLabelColor: Colors.grey,
          //         controller: _tabController,
          //         tabs: [
          //           Tab(
          //             icon: Icon(
          //               Icons.person_pin_outlined,
          //             ),
          //           ),
          //           Tab(
          //             icon: Icon(
          //               Icons.phone,
          //             ),
          //           ),
          //           Tab(
          //             icon: Icon(
          //               Icons.email_outlined,
          //             ),
          //           ),
          //           designation != ""
          //               ? Tab(
          //                   icon: Icon(Icons.account_box_outlined),
          //                 )
          //               : Tab(
          //                   icon: Icon(
          //                     Icons.location_on_rounded,
          //                   ),
          //                 ),
          //           Tab(
          //             icon: Icon(
          //               Icons.title,
          //             ),
          //           ),
          //           Tab(
          //             icon: Icon(
          //               Icons.facebook,
          //             ),
          //           ),
          //         ]),
          //   ),
          // ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Screenshot(
                controller: screenshotController,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // commonImage(widget.image),
                    Container(
                      height: 50.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.image),
                      )),
                      child: user.planStatus == 0
                          ? Image.asset(
                              "images/watermark.png",
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    frameModel.length == 0
                        ? Container()
                        : Container(
                            width: 100.w,
                            height: 50.h,
                            child: Image(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage(frameModel[frameIndex].framePath),
                              width: 100.w,
                              height: 50.h,
                            ),
                          ),
                    frameModel.length == 0
                        ? Container()
                        : logo != "" && frameModel[frameIndex].logo['show']
                            ? Positioned(
                                top: 1.h,
                                left: 2.w,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: commonImage(
                                      logo,
                                      height:
                                          frameModel[frameIndex].logo['size'],
                                      width:
                                          frameModel[frameIndex].logo['size'],
                                      fit: BoxFit.fill,
                                    )))
                            : SizedBox(),

                    //Left Side Logo for political
                    leftLogo != "" && frameModel[frameIndex].logo['show']
                        ? Positioned(
                            top: 1.h,
                            left: 5.w + frameModel[frameIndex].logo['size'] ??
                                15.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: commonImage(
                                  leftLogo,
                                  height: frameModel[frameIndex].logo['size'],
                                  width: frameModel[frameIndex].logo['size'],
                                  fit: BoxFit.fill,
                                )))
                        : SizedBox(),
                    //Left side logo end
                    //Right Side Logo for political
                    rightLogo != "" && frameModel[frameIndex].logo['show']
                        ? Positioned(
                            top: 1.h,
                            right: 2.w,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: commonImage(
                                  rightLogo,
                                  height: frameModel[frameIndex].logo['size'],
                                  width: frameModel[frameIndex].logo['size'],
                                  fit: BoxFit.fill,
                                )))
                        : SizedBox(),
                    //Right side logo end
                    //Watermark Logo(left bottom) for political
                    frameModel[frameIndex].watermark != null &&
                            waterMarkLogo != "" &&
                            frameModel[frameIndex].watermark!['show']
                        ? Positioned(
                            bottom: frameModel[frameIndex].watermark!['AxisY'],
                            left: frameModel[frameIndex].watermark!['AxisX'],
                            child: Container(
                                // borderRadius: BorderRadius.circular(100),
                                child: commonImage(
                              waterMarkLogo,
                              height: frameModel[frameIndex]
                                          .watermark!['height'] !=
                                      null
                                  ? frameModel[frameIndex].watermark!['height']
                                  : frameModel[frameIndex].watermark!['size'],
                              width: frameModel[frameIndex].watermark!['size'],
                              fit: BoxFit.fill,
                            )))
                        : SizedBox(),
                    //Right side logo end
                    // waterMarkLogo
                    frameModel.length == 0
                        ? Container()
                        : name != "" && frameModel[frameIndex].name['show']
                            ? Positioned(
                                top: frameModel[frameIndex]
                                            .name['alignVertical'] ==
                                        'bottom'
                                    ? null
                                    : frameModel[frameIndex].name['AxisY'],
                                bottom: frameModel[frameIndex]
                                            .name['alignVertical'] ==
                                        'top'
                                    ? null
                                    : frameModel[frameIndex].name['AxisY'],
                                right: frameModel[frameIndex].name['align'] ==
                                        'left'
                                    ? null
                                    : frameModel[frameIndex].name['AxisX'],
                                left: frameModel[frameIndex].name['align'] ==
                                        'left'
                                    ? frameModel[frameIndex].name['AxisX']
                                    : null,
                                child: text(
                                  name,
                                  fontFamily: fontBold,
                                  fontSize: frameModel[frameIndex].name['size'],
                                  textColor:
                                      frameModel[frameIndex].name['color'],
                                ))
                            : SizedBox(),
                    frameModel.length == 0
                        ? Container()
                        : number != "" && frameModel[frameIndex].contact['show']
                            ? Positioned(
                                // bottom: 2.5.h,
                                // right: 1.5.w,
                                bottom: frameModel[frameIndex].contact['AxisY'],
                                right: frameModel[frameIndex]
                                            .contact['align'] ==
                                        'right'
                                    ? null
                                    : frameModel[frameIndex].contact['AxisX'],
                                left: frameModel[frameIndex].contact['align'] ==
                                        'left'
                                    ? frameModel[frameIndex].contact['AxisX']
                                    : null,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: frameModel[frameIndex]
                                          .contact['color'],
                                      size: 10.sp,
                                    ),
                                    frameModel[frameIndex].contact['text'] !=
                                                null &&
                                            optionalContactNo != null &&
                                            optionalContactNo != ""
                                        ? text(
                                            number +
                                                frameModel[frameIndex]
                                                    .contact['text'] +
                                                optionalContactNo,
                                            fontFamily: fontBold,
                                            fontSize: frameModel[frameIndex]
                                                .contact['size'],
                                            textColor: frameModel[frameIndex]
                                                .contact['color'],
                                          )
                                        : text(
                                            number,
                                            fontFamily: fontBold,
                                            fontSize: frameModel[frameIndex]
                                                .contact['size'],
                                            textColor: frameModel[frameIndex]
                                                .contact['color'],
                                          ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    // text(
                                    //   designation,
                                    //   fontFamily: fontBold,
                                    //   fontSize: frameModel[frameIndex]
                                    //       .designation!['size'],
                                    //   textColor: frameModel[frameIndex]
                                    //       .designation!['color'],
                                    // ),
                                    SizedBox(
                                      width: 4,
                                    )
                                    // Text("${designation}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 10),),
                                  ],
                                ))
                            : SizedBox(),
                    // Contact2
                    ///
                    // frameModel.length > 0 &&
                    //         frameModel[frameIndex].optionalContactNo != null
                    //     ? number != "" && frameModel[frameIndex].contact['show']
                    //         ? Positioned(
                    //             // bottom: 2.5.h,
                    //             // right: 1.5.w,
                    //             bottom: frameModel[frameIndex]
                    //                 .optionalContactNo!['AxisY'],
                    //             right: frameModel[frameIndex]
                    //                         .optionalContactNo!['align'] ==
                    //                     'left'
                    //                 ? null
                    //                 : frameModel[frameIndex]
                    //                     .optionalContactNo!['AxisX'],
                    //             left: frameModel[frameIndex]
                    //                         .optionalContactNo!['align'] ==
                    //                     'left'
                    //                 ? frameModel[frameIndex]
                    //                     .optionalContactNo!['AxisX']
                    //                 : null,
                    //             child: Row(
                    //               children: [
                    //                 Icon(
                    //                   Icons.call,
                    //                   color: frameModel[frameIndex]
                    //                       .optionalContactNo!['color'],
                    //                   size: frameModel[frameIndex]
                    //                       .optionalContactNo!['size'],
                    //                 ),
                    //                 text(
                    //                   optionalContactNo,
                    //                   fontFamily: fontBold,
                    //                   fontSize: frameModel[frameIndex]
                    //                       .optionalContactNo!['size'],
                    //                   textColor: frameModel[frameIndex]
                    //                       .optionalContactNo!['color'],
                    //                 ),
                    //               ],
                    //             ))
                    //         : SizedBox()
                    //     : Container(),

                    // Contact2 End

                    frameModel.length == 0
                        ? Container()
                        : email != "" && frameModel[frameIndex].email['show']
                            ? Positioned(
                                bottom: frameModel[frameIndex].email['AxisY'],
                                right: frameModel[frameIndex].email['align'] ==
                                        'left'
                                    ? null
                                    : frameModel[frameIndex].email['AxisX'],
                                left: frameModel[frameIndex].email['align'] ==
                                        'left'
                                    ? frameModel[frameIndex].email['AxisX']
                                    : null,
                                // bottom: 2.5.h,
                                // right: 62.w,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color:
                                          frameModel[frameIndex].email['color'],
                                      size: 10.sp,
                                    ),
                                    text(
                                      email,
                                      fontFamily: fontBold,
                                      fontSize:
                                          frameModel[frameIndex].email['size'],
                                      textColor:
                                          frameModel[frameIndex].email['color'],
                                    ),
                                  ],
                                ))
                            : SizedBox(),
                    frameModel.length == 0
                        ? Container()
                        : address != "" &&
                                frameModel[frameIndex].address['show']
                            ? Positioned(
                                bottom: frameModel[frameIndex].address['AxisY'],
                                left: frameModel[frameIndex]
                                            .address['center'] ==
                                        true
                                    ? null
                                    : frameModel[frameIndex].address['align'] ==
                                            'right'
                                        ? null
                                        : frameModel[frameIndex]
                                            .address['AxisX'],
                                right: frameModel[frameIndex]
                                            .address['align'] ==
                                        'right'
                                    ? frameModel[frameIndex].address['AxisX']
                                    : null,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: frameModel[frameIndex]
                                          .address['color'],
                                      size: 10.sp,
                                    ),
                                    text(
                                      address,
                                      isCentered: true,
                                      fontFamily: fontBold,
                                      fontSize: frameModel[frameIndex]
                                          .address['size'],
                                      textColor: frameModel[frameIndex]
                                          .address['color'],
                                    ),
                                  ],
                                ))
                            : SizedBox(),

                    /// designation
                    frameModel.length == 0
                        ? Container()
                        : designation != "" &&
                                frameModel[frameIndex].designation!['show']
                            ? Positioned(
                                bottom: frameModel[frameIndex]
                                    .designation!['AxisY'],
                                left: frameModel[frameIndex]
                                            .designation!['center'] ==
                                        true
                                    ? null
                                    : frameModel[frameIndex]
                                                .designation!['align'] ==
                                            'left'
                                        ? null
                                        : frameModel[frameIndex]
                                            .designation!['AxisX'],
                                right: frameModel[frameIndex]
                                            .designation!['align'] ==
                                        'left'
                                    ? frameModel[frameIndex]
                                        .designation!['AxisX']
                                    : null,
                                // // bottom: 2.5.h,
                                // // right: 1.5.w,
                                //   bottom: frameModel[frameIndex].contact['AxisY'],
                                //   right: frameModel[frameIndex]
                                //       .contact['align'] ==
                                //       'left'
                                //       ? 'right'
                                //       : frameModel[frameIndex].contact['AxisX'],
                                //   left: frameModel[frameIndex].contact['align'] ==
                                //       'left'
                                //       ? frameModel[frameIndex].contact['AxisX']
                                //       : null,

                                child: Row(
                                  children: [
                                    // Icon(
                                    //   Icons.location_on_outlined,
                                    //   color: frameModel[frameIndex]
                                    //       .designation!['color'],
                                    //   size: frameModel[frameIndex]
                                    //       .designation!['size'],
                                    // ),
                                    text(
                                      designation,
                                      fontFamily: fontBold,
                                      fontSize: frameModel[frameIndex]
                                          .designation!['size'],
                                      textColor: frameModel[frameIndex]
                                          .designation!['color'],
                                    ),
                                  ],
                                ))
                            : SizedBox(),
                    frameModel.length == 0
                        ? Container()
                        : frameModel[frameIndex].icon['show']
                            ? Positioned(
                                bottom: frameModel[frameIndex].icon['AxisY'],
                                right: frameModel[frameIndex].icon['AxisX'],
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: frameModel[frameIndex]
                                              .icon['direction'] !=
                                          null
                                      ? Axis.horizontal
                                      : Axis.vertical,
                                  children: [
                                    text(
                                      "@Follow Us  ",
                                      fontFamily: fontMedium,
                                      fontSize:
                                          frameModel[frameIndex].icon['size'],
                                      textColor:
                                          frameModel[frameIndex].icon['color'],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "images/bottom/fb.png",
                                          width: frameModel[frameIndex]
                                              .icon['size'],
                                          height: frameModel[frameIndex]
                                              .icon['size'],
                                        ),
                                        Image.asset(
                                          "images/bottom/instagram.png",
                                          width: frameModel[frameIndex]
                                              .icon['size'],
                                          height: frameModel[frameIndex]
                                              .icon['size'],
                                        ),
                                        Image.asset(
                                          "images/bottom/twitter.png",
                                          width: frameModel[frameIndex]
                                              .icon['size'],
                                          height: frameModel[frameIndex]
                                              .icon['size'],
                                        ),
                                        Image.asset(
                                          "images/bottom/youtube.png",
                                          width: frameModel[frameIndex]
                                              .icon['size'],
                                          height: frameModel[frameIndex]
                                              .icon['size'],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(2.w),
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                      indicatorColor: AppColor().colorPrimary(),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: AppColor().colorPrimary(),
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.person_pin_outlined,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.phone,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.email_outlined,
                          ),
                        ),
                        designation != ""
                            ? Tab(
                          icon: Icon(Icons.account_box_outlined),
                        )
                            : Tab(
                          icon: Icon(
                            Icons.location_on_rounded,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.title,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.facebook,
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Card(
                                margin: EdgeInsets.all(2.w),
                                child: SwitchListTile(
                                  value: frameModel[frameIndex].logo['show'],
                                  title: text("Logo Show/Hide",
                                      textColor: AppColor().colorTextPrimary(),
                                      fontSize: 12.sp,
                                      fontFamily: fontMedium),
                                  onChanged: (value) {
                                    setState(() {
                                      frameModel[frameIndex].logo['show'] =
                                          value;
                                    });
                                  },
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.all(2.w),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: text("Logo Size",
                                          textColor:
                                              AppColor().colorTextPrimary(),
                                          fontSize: 12.sp,
                                          fontFamily: fontMedium),
                                    ),
                                    Slider(
                                        min: 8.w,
                                        max: 14.w,
                                        value:
                                            frameModel[frameIndex].logo['size'],
                                        onChanged: (value) {
                                          setState(() {
                                            frameModel[frameIndex]
                                                .logo['size'] = value;
                                          });
                                        }),
                                    SizedBox(
                                      height: 1.h,
                                    )
                                  ],
                                ),
                              ),
                              // frameModel[frameIndex].watermark != null
                              //     ? Card(
                              //         margin: EdgeInsets.all(2.w),
                              //         child: SwitchListTile(
                              //           value: frameModel[frameIndex]
                              //               .watermark!['show'],
                              //           title: text("Profile Logo Show/Hide",
                              //               textColor:
                              //                   AppColor().colorTextPrimary(),
                              //               fontSize: 12.sp,
                              //               fontFamily: fontMedium),
                              //           onChanged: (value) {
                              //             setState(() {
                              //               frameModel[frameIndex]
                              //                   .watermark!['show'] = value;
                              //             });
                              //           },
                              //         ),
                              //       )
                              //     : Container(),
                              // frameModel[frameIndex].watermark != null
                              //     ? Card(
                              //         margin: EdgeInsets.all(2.w),
                              //         child: Column(
                              //           children: [
                              //             ListTile(
                              //               title: text("Profile Logo Size",
                              //                   textColor: AppColor()
                              //                       .colorTextPrimary(),
                              //                   fontSize: 12.sp,
                              //                   fontFamily: fontMedium),
                              //             ),
                              //             Slider(
                              //                 min: 8.w,
                              //                 max: 25.w,
                              //                 value: frameModel[frameIndex]
                              //                     .watermark!['size'],
                              //                 onChanged: (value) {
                              //                   setState(() {
                              //                     frameModel[frameIndex]
                              //                             .watermark!['size'] =
                              //                         value;
                              //                   });
                              //                 }),
                              //             SizedBox(
                              //               height: 1.h,
                              //             )
                              //           ],
                              //         ),
                              //       )
                              //     : Container(),
                              Card(
                                margin: EdgeInsets.all(2.w),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: text("Frame",
                                          textColor:
                                              AppColor().colorTextPrimary(),
                                          fontSize: 12.sp,
                                          fontFamily: fontMedium),
                                    ),
                                    Container(
                                      height: 5.h,
                                      width: 90.w,
                                      child: ListView.builder(
                                          itemCount: frameModel.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: EdgeInsets.all(2),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    frameIndex = index;
                                                  });
                                                },
                                                child: Container(
                                                  color: frameIndex == index
                                                      ? AppColor()
                                                          .colorPrimary()
                                                          .withOpacity(0.2)
                                                      : Colors.grey
                                                          .withOpacity(0.3),
                                                  height: 10.w,
                                                  width: 15.w,
                                                  child: Image.asset(
                                                    frameModel[index].framePath,
                                                    fit: BoxFit.fill,
                                                      cacheHeight: 200,
                                                    cacheWidth: 200,
                                                    filterQuality: FilterQuality.low,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.all(2.w),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: text("Business Plans",
                                          textColor:
                                              AppColor().colorTextPrimary(),
                                          fontSize: 12.sp,
                                          fontFamily: fontMedium),
                                    ),
                                    model != null
                                        ? Container(
                                            height: 40,
                                            child: model!.data!.length > 0
                                                ? ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: true,
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    itemCount:
                                                        model!.data!.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      var data = model!.data!;
                                                      return InkWell(
                                                        onTap: () {
                                                          addBusinessPlanFrames();
                                                          setState(() {
                                                            designation = "";
                                                            address = "";
                                                            rightLogo = "";
                                                            waterMarkLogo = "";
                                                            leftLogo = "";

                                                            logo = data[index]
                                                                .logo
                                                                .toString();
                                                            name = data[index]
                                                                .businessName
                                                                .toString();
                                                            email = data[index]
                                                                .businessEmail
                                                                .toString();
                                                            waterMarkLogo =
                                                                data[index]
                                                                    .watermark
                                                                    .toString();
                                                            number = data[index]
                                                                .businessMobile
                                                                .toString();
                                                            optionalContactNo =
                                                                data[index]
                                                                    .businessMobile2
                                                                    .toString();
                                                            address = data[
                                                                    index]
                                                                .businessAddress
                                                                .toString();

                                                            //businessFace = data[index].facebookLink;
                                                          });
                                                        },
                                                        child: Chip(
                                                            label: Text(
                                                                "${model!.data![index].businessName}")),
                                                      );
                                                    },
                                                  )
                                                : Icon(Icons.error_outline),
                                          )
                                        : CircularProgressIndicator(),
                                    /* FutureBuilder(
                                        future: getBusinessList(user.userId),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          if (snapshot.hasData) {
                                            return Container(
                                              height: 40,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                itemCount:
                                                    snapshot.data.data.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  var data = snapshot.data.data;
                                                  return InkWell(
                                                    onTap: () {
                                                      addBusinessPlanFrames();
                                                      setState(() {
                                                        designation = "";
                                                        address = "";
                                                        rightLogo = "";
                                                        waterMarkLogo = "";
                                                        leftLogo = "";

                                                        logo = data[index].logo;
                                                        name = data[index]
                                                            .businessName;
                                                        email = data[index]
                                                            .businessEmail;
                                                        waterMarkLogo = data[index].watermark;
                                                        number = data[index]
                                                            .businessMobile;
                                                        optionalContactNo =
                                                            data[index]
                                                                .businessMobile2;
                                                        address = data[index]
                                                            .businessAddress;

                                                        //businessFace = data[index].facebookLink;
                                                      });
                                                    },
                                                    child: Chip(
                                                        label: Text(
                                                            "${snapshot.data.data[index].businessName}")),
                                                  );
                                                },
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Icon(Icons.error_outline);
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        }),*/
                                    SizedBox(
                                      height: 2.h,
                                    )
                                  ],
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.all(2.w),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: text("Political Business Plans",
                                          textColor:
                                              AppColor().colorTextPrimary(),
                                          fontSize: 12.sp,
                                          fontFamily: fontMedium),
                                    ),
                                    model1 != null
                                        ? Container(
                                            height: 40,
                                            child: model1!.data!.length > 0
                                                ?ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              physics: ClampingScrollPhysics(),
                                              itemCount: model1!.data!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                GetPoliticaListModel data =
                                                    model1!;
                                                return InkWell(
                                                  onTap: () {
                                                    addPoliticalPlanFrames();
                                                    setState(() {
                                                      // Clearing Business plan
                                                      address = "";

                                                      logo = data.data![index]
                                                          .businessLogo!;

                                                      leftLogo = data
                                                          .data![index]
                                                          .leftSide!;
                                                      rightLogo = data
                                                          .data![index]
                                                          .rightSide!;

                                                      waterMarkLogo = data
                                                          .data![index]
                                                          .watermark!;

                                                      name = data.data![index]
                                                          .politicalName!;
                                                      email = "";
                                                      number = data.data![index]
                                                          .politicalMobile!;

                                                      optionalContactNo = "";

                                                      designation = data
                                                          .data![index]
                                                          .politicalDesgination!;
                                                      //businessFace = data.data![index].facebookLink!;
                                                    });
                                                  },
                                                  child: Chip(
                                                      label: Text(
                                                          "${data.data![index].politicalName}")),
                                                );
                                              },
                                            ):Icon(Icons.error_outline),
                                          )
                                        : CircularProgressIndicator(),
                                    FutureBuilder(
                                        future: getPoliticalList(user.userId),
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          if (snapshot.hasData) {
                                            return Container(
                                              height: 40,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                itemCount:
                                                    snapshot.data.data.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  GetPoliticaListModel data =
                                                      snapshot.data;
                                                  return InkWell(
                                                    onTap: () {
                                                      addPoliticalPlanFrames();
                                                      setState(() {
                                                        // Clearing Business plan
                                                        address = "";

                                                        logo = data.data![index]
                                                            .businessLogo!;

                                                        leftLogo = data
                                                            .data![index]
                                                            .leftSide!;
                                                        rightLogo = data
                                                            .data![index]
                                                            .rightSide!;

                                                        waterMarkLogo = data
                                                            .data![index]
                                                            .watermark!;

                                                        name = data.data![index]
                                                            .politicalName!;
                                                        email = "";
                                                        number = data
                                                            .data![index]
                                                            .politicalMobile!;

                                                        optionalContactNo = "";

                                                        designation = data
                                                            .data![index]
                                                            .politicalDesgination!;
                                                        //businessFace = data.data![index].facebookLink!;
                                                      });
                                                    },
                                                    child: Chip(
                                                        label: Text(
                                                            "${data.data![index].politicalName}")),
                                                  );
                                                },
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Icon(Icons.error_outline);
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        }),
                                    SizedBox(
                                      height: 1.h,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: SwitchListTile(
                                value: frameModel[frameIndex].contact['show'],
                                title: text("Contact Show/Hide",
                                    textColor: AppColor().colorTextPrimary(),
                                    fontSize: 12.sp,
                                    fontFamily: fontMedium),
                                onChanged: (value) {
                                  setState(() {
                                    frameModel[frameIndex].contact['show'] =
                                        value;
                                  });
                                },
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      changeColor(
                                          frameModel[frameIndex]
                                              .contact['color'],
                                          1);
                                    },
                                    title: text("Change Color",
                                        textColor:
                                            AppColor().colorTextPrimary(),
                                        fontSize: 12.sp,
                                        fontFamily: fontMedium),
                                    trailing: Container(
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: boxDecoration(
                                          radius: 100,
                                          bgColor: frameModel[frameIndex]
                                              .contact['color']),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: text("Contact Size",
                                        textColor:
                                            AppColor().colorTextPrimary(),
                                        fontSize: 12.sp,
                                        fontFamily: fontMedium),
                                  ),
                                  Slider(
                                      min: 5.sp,
                                      max: 12.sp,
                                      value: frameModel[frameIndex]
                                          .contact['size'],
                                      onChanged: (value) {
                                        setState(() {
                                          frameModel[frameIndex]
                                              .contact['size'] = value;
                                        });
                                      }),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: SwitchListTile(
                                value: frameModel[frameIndex].email['show'],
                                title: text("Email Show/Hide",
                                    textColor: AppColor().colorTextPrimary(),
                                    fontSize: 12.sp,
                                    fontFamily: fontMedium),
                                onChanged: (value) {
                                  setState(() {
                                    frameModel[frameIndex].email['show'] =
                                        value;
                                  });
                                },
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      changeColor(
                                          frameModel[frameIndex].email['color'],
                                          2);
                                    },
                                    title: text("Change Color",
                                        textColor:
                                            AppColor().colorTextPrimary(),
                                        fontSize: 12.sp,
                                        fontFamily: fontMedium),
                                    trailing: Container(
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: boxDecoration(
                                          radius: 100,
                                          bgColor: frameModel[frameIndex]
                                              .email['color']),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: text("Email Size",
                                        textColor:
                                            AppColor().colorTextPrimary(),
                                        fontSize: 12.sp,
                                        fontFamily: fontMedium),
                                  ),
                                  Slider(
                                      min: 5.sp,
                                      max: 12.sp,
                                      value:
                                          frameModel[frameIndex].email['size'],
                                      onChanged: (value) {
                                        setState(() {
                                          frameModel[frameIndex].email['size'] =
                                              value;
                                        });
                                      }),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // To manage the Degisnation instead of Address on Political Plans
                      designation != ""
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  Card(
                                    margin: EdgeInsets.all(2.w),
                                    child: SwitchListTile(
                                      value: frameModel[frameIndex]
                                          .designation!['show'],
                                      title: text("Degisnation Show/Hide",
                                          textColor:
                                              AppColor().colorTextPrimary(),
                                          fontSize: 12.sp,
                                          fontFamily: fontMedium),
                                      onChanged: (value) {
                                        setState(() {
                                          frameModel[frameIndex]
                                              .designation!['show'] = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.all(2.w),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            changeColor(
                                                frameModel[frameIndex]
                                                    .designation!['color'],
                                                6);
                                          },
                                          title: text("Change Color",
                                              textColor:
                                                  AppColor().colorTextPrimary(),
                                              fontSize: 12.sp,
                                              fontFamily: fontMedium),
                                          trailing: Container(
                                            width: 10.w,
                                            height: 10.w,
                                            decoration: boxDecoration(
                                                radius: 100,
                                                bgColor: frameModel[frameIndex]
                                                    .designation!['color']),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        )
                                      ],
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.all(2.w),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: text("Degisnation Size",
                                              textColor:
                                                  AppColor().colorTextPrimary(),
                                              fontSize: 12.sp,
                                              fontFamily: fontMedium),
                                        ),
                                        Slider(
                                            min: 5.sp,
                                            max: 12.sp,
                                            value: frameModel[frameIndex]
                                                .designation!['size'],
                                            onChanged: (value) {
                                              setState(() {
                                                frameModel[frameIndex]
                                                        .designation!['size'] =
                                                    value;
                                              });
                                            }),
                                        SizedBox(
                                          height: 1.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  Card(
                                    margin: EdgeInsets.all(2.w),
                                    child: SwitchListTile(
                                      value: frameModel[frameIndex]
                                          .address['show'],
                                      title: text("Address Show/Hide",
                                          textColor:
                                              AppColor().colorTextPrimary(),
                                          fontSize: 12.sp,
                                          fontFamily: fontMedium),
                                      onChanged: (value) {
                                        setState(() {
                                          frameModel[frameIndex]
                                              .address['show'] = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.all(2.w),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            changeColor(
                                                frameModel[frameIndex]
                                                    .address['color'],
                                                3);
                                          },
                                          title: text("Change Color",
                                              textColor:
                                                  AppColor().colorTextPrimary(),
                                              fontSize: 12.sp,
                                              fontFamily: fontMedium),
                                          trailing: Container(
                                            width: 10.w,
                                            height: 10.w,
                                            decoration: boxDecoration(
                                                radius: 100,
                                                bgColor: frameModel[frameIndex]
                                                    .address['color']),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        )
                                      ],
                                    ),
                                  ),
                                  Card(
                                    margin: EdgeInsets.all(2.w),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: text("Address Size",
                                              textColor:
                                                  AppColor().colorTextPrimary(),
                                              fontSize: 12.sp,
                                              fontFamily: fontMedium),
                                        ),
                                        Slider(
                                            min: 5.sp,
                                            max: 12.sp,
                                            value: frameModel[frameIndex]
                                                .address['size'],
                                            onChanged: (value) {
                                              setState(() {
                                                frameModel[frameIndex]
                                                    .address['size'] = value;
                                              });
                                            }),
                                        SizedBox(
                                          height: 1.h,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: SwitchListTile(
                                value: frameModel[frameIndex].name['show'],
                                title: text("Name Show/Hide",
                                    textColor: AppColor().colorTextPrimary(),
                                    fontSize: 12.sp,
                                    fontFamily: fontMedium),
                                onChanged: (value) {
                                  setState(() {
                                    frameModel[frameIndex].name['show'] = value;
                                  });
                                },
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      changeColor(
                                          frameModel[frameIndex].name['color'],
                                          4);
                                    },
                                    title: text("Change Color",
                                        textColor:
                                            AppColor().colorTextPrimary(),
                                        fontSize: 12.sp,
                                        fontFamily: fontMedium),
                                    trailing: Container(
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: boxDecoration(
                                          radius: 100,
                                          bgColor: frameModel[frameIndex]
                                              .name['color']),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: text("Name Size",
                                        textColor:
                                            AppColor().colorTextPrimary(),
                                        fontSize: 12.sp,
                                        fontFamily: fontMedium),
                                  ),
                                  Slider(
                                      min: 6.sp,
                                      max: 20.sp,
                                      value:
                                          frameModel[frameIndex].name['size'],
                                      onChanged: (value) {
                                        setState(() {
                                          frameModel[frameIndex].name['size'] =
                                              value;
                                        });
                                      }),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: SwitchListTile(
                                value: frameModel[frameIndex].icon['show'],
                                title: text("Follow Icon Show/Hide",
                                    textColor: AppColor().colorTextPrimary(),
                                    fontSize: 12.sp,
                                    fontFamily: fontMedium),
                                onChanged: (value) {
                                  setState(() {
                                    frameModel[frameIndex].icon['show'] = value;
                                  });
                                },
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.all(2.w),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      changeColor(
                                          frameModel[frameIndex].icon['color'],
                                          5);
                                    },
                                    title: text("Change Color",
                                        textColor:
                                            AppColor().colorTextPrimary(),
                                        fontSize: 12.sp,
                                        fontFamily: fontMedium),
                                    trailing: Container(
                                      width: 10.w,
                                      height: 10.w,
                                      decoration: boxDecoration(
                                          radius: 100,
                                          bgColor: frameModel[frameIndex]
                                              .icon['color']),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
