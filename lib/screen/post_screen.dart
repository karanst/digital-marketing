import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/delete_post_model.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/create_post.dart';
import 'package:digital_marketing/show_post_animation/show_hero_animation.dart';
import 'package:digital_marketing/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:digital_marketing/utility_widget/myappbar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Common _common = Common();
  bool selected = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    setState(() {
      changeStatusBarColor(AppColor().colorPrimary());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor:   AppColor().colorPrimary(),
      ),
      body: SafeArea(
          child: Container(
        height: 100.h,
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
              height: 1.18.h,
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 6.33.w, right: 6.33.w, bottom: 1.87.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = true;
                      });
                    },
                    child: AnimatedContainer(
                      width: 41.66.w,
                      height: 5.15.h,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.elasticInOut,
                      decoration: boxDecoration(
                        radius: 30.0,
                        color: selected
                            ? AppColor().colorPrimaryDark()
                            : AppColor().colorBg1(),
                        bgColor: selected
                            ? AppColor().colorPrimaryDark()
                            : AppColor().colorBg1(),
                        showShadow: true,
                      ),
                      child: Center(
                        child: text(
                          "Image",
                          textColor: !selected
                              ? AppColor().colorTextPrimary()
                              : AppColor().colorBg1(),
                          fontSize: 10.5.sp,
                          fontFamily: fontSemibold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.elasticInOut,
                      width: 41.66.w,
                      height: 5.15.h,
                      decoration: boxDecoration(
                        radius: 30.0,
                        color: !selected
                            ? AppColor().colorPrimaryDark()
                            : AppColor().colorBg1(),
                        bgColor: !selected
                            ? AppColor().colorPrimaryDark()
                            : AppColor().colorBg1(),
                        showShadow: true,
                      ),
                      child: Center(
                        child: text(
                          "Video",
                          textColor: selected
                              ? AppColor().colorTextPrimary()
                              : AppColor().colorBg1(),
                          fontSize: 10.5.sp,
                          fontFamily: fontSemibold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // FutureBuilder(
            //     future: getEditImage(user.userId),
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       if (snapshot.hasData) {
            //         return GridView.count(
            //           shrinkWrap: true,
            //           physics: ClampingScrollPhysics(),
            //           crossAxisCount: 3,
            //           children: snapshot.data.data
            //               .map<Widget>((item) => InkWell(
            //                   onTap: () {
            //                     Navigator.push(
            //                         context,
            //                         MaterialPageRoute(
            //                             builder: (context) => PhotoHero(
            //                                   photo: item.image,
            //                                   width: 100.0,
            //                                   onTap: () {
            //                                     Navigator.pop(context);
            //                                   },
            //                                 )));
            //                   },
            //                   child: commonImage(item.image)))
            //               .toList(),
            //         );
            //       } else if (snapshot.hasError) {
            //         return Icon(Icons.error_outline);
            //       } else {
            //         return CircularProgressIndicator();
            //       }
            //     }),

            Expanded(
              child: FutureBuilder(
                  future: getEditImage(user.userId),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data.data);
                      return snapshot.data.status == true
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.count(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  crossAxisCount: 3,
                                  children: List.generate(
                                    snapshot.data.data.length,
                                    (int index) {
                                      return InkWell(
                                        onTap: () {
                                          selected
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PhotoHero(
                                                            photo: snapshot
                                                                .data
                                                                .data[index]
                                                                .image,
                                                            width: 100.0,
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          )))
                                              : print('video');
                                        },
                                        onLongPress: () async {
                                          DeletePostModel? model =
                                              await deletePost(
                                                  snapshot.data.data[index].id);
                                          if (model!.status == true) {
                                            setState(() {});
                                            _common.toast("Deleted");
                                          } else {
                                            _common
                                                .toast(model.status.toString());
                                          }
                                        },
                                        child: Card(
                                            color: Colors.grey.shade100,
                                            child: selected
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .image))),
                                                  )
                                                : Center(
                                                    child: IconButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          VideoHeroHero(
                                                                            photo: snapshot.data.data[index].image,
                                                                            width:
                                                                                100.0,
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                          )));
                                                        },
                                                        icon: Icon(
                                                          Icons.play_arrow,
                                                          size: 40,
                                                        )))),
                                      );
                                    },
                                  )),
                            )
                          : Column(
                              children: [
                                Container(
                                  height: 30.82.h,
                                  width: 100.w,
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(selected
                                              ? "images/post1.png"
                                              : "images/post2.png"),
                                          fit: BoxFit.scaleDown)),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    text(
                                      "No Post Yet",
                                      fontSize: 12.5.sp,
                                      fontFamily: fontBold,
                                      textColor: AppColor().colorTextPrimary(),
                                    ),
                                    text(
                                      "All your posts will appear here after uploading.",
                                      fontSize: 6.5.sp,
                                      fontFamily: fontBold,
                                      textColor: AppColor().colorTextPrimary(),
                                    ),
                                  ],
                                )
                              ],
                            );
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      )),
    );
  }
}
