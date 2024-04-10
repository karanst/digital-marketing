import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/show_posts.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_marketing/model/category_model.dart';

import 'package:digital_marketing/utility_widget/myappbar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/custom_switch.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class CategoryScreen extends StatefulWidget {
  final selected;

  const CategoryScreen({Key? key, this.selected}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> bannerList = [
    "images/banner1.png",
    "images/banner2.png",
    "images/banner2.png"
  ];
  List<CategoryModel> catList = [];
  late ScrollController controller = new ScrollController();
  int currentIndex = 0;

  var _search = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    changeStatusBarColor(AppColor().colorBg2());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:widget.selected ? Text("Categories") : Text("Videos"),

          centerTitle: true,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
          // ),
          backgroundColor:   AppColor().colorPrimary(),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.0, -0.1),
                colors: [
                  AppColor().colorBg2(),
                  AppColor().colorBg2(),
                ],
                radius: 0.8,
              ),
            ),
            //  padding: EdgeInsets.symmetric(horizontal: ),
            child: Column(
              children: [
                SizedBox(
                  height: 0.1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 25),
                          suffixIcon: Icon(Icons.search),
                          hintText: "Search",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                      onChanged: (value) {
                        setState(() {
                          _search.text = value;
                        });
                      },
                    ),
                  ),
                ),
                _search.text.isEmpty
                    ? FutureBuilder(
                        future: getCategory(user.langId, user.userId, widget.selected?"2":"3"),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data.data;
                            return Container(
                              margin: EdgeInsets.only(left: 6.53.w, bottom: 1.87.h),
                              child: GridView.count(
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                crossAxisCount: 3,
                                controller: controller,
                                childAspectRatio: 4 / 5,
                                shrinkWrap: true,
                                children: data.map<Widget>((model) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ShowPosts(
                                                    selected: true,
                                                    catId: model.id,
                                                    langSelected: false,
                                                    selectedPost: model.image,
                                                    type: widget.selected ? "2" : "3"
                                                  )));
                                    },
                                    child: Container(
                                      width: 25.w,
                                      margin: EdgeInsets.only(right: 1.53.w),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5.sp),
                                        child: Column(
                                          children: [
                                            Container(
                                                child: commonImage(model.image,
                                                    height: 14.02.h,
                                                    width: 14.02.h,
                                                    fit: BoxFit.fill)),
                                            text(model.title,
                                                textColor:
                                                    AppColor().colorTextThird(),
                                                fontSize: 7.5.sp,
                                                fontFamily: fontSemibold,
                                                maxLine: 1,
                                                overFlow: true),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Icon(Icons.error_outline);
                          } else {
                            return CircularProgressIndicator();
                          }
                        })
                    : FutureBuilder(
                        future: searchCategory(_search.text),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            List data = snapshot.data.data;
                            return GridView.count(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              crossAxisCount: 3,
                              childAspectRatio: 4 / 5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              children: data
                                  .map<Widget>((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              child: commonImage(
                                                "http://sundhanetwark.com/Admin/uploads/category/${e.image}",
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ShowPosts(
                                                              selected: true,
                                                              catId: e.id,
                                                              selectedPost:
                                                                  "http://sundhanetwark.com/Admin/uploads/category/${e.image}",
                                                                type: widget.selected?"2":"3"
                                                            )));
                                              },
                                            ),
                                            Text(
                                              "${e.title}",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            );
                          } else if (snapshot.hasError) {
                            return Text("No Item Found");
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
