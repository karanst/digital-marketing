import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/ShowPostByLanguageIdModel.dart';
import 'package:digital_marketing/model/SubCategoryPostModel.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/edit_post.dart';
import 'package:digital_marketing/screen/language_screen.dart';
import 'package:digital_marketing/screen/logo_screen.dart';
import 'package:digital_marketing/screen/show_posts.dart';
import 'package:digital_marketing/show_post_animation/show_hero_animation.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../model/PurchaseHistoryModel.dart';

class SubCategory extends StatefulWidget {
  final subId;
  final catId;
  final selected;
  final selectedPost;
  final type;
  bool? langSelected;

  SubCategory(
      {Key? key,
      this.subId,
      this.selected,
      this.selectedPost,
      this.type,
      this.langSelected,
      this.catId})
      : super(key: key);

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  var showImage;
  String? languageId;
  PurchaseHistoryModel? historyModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        actions: [
          IconButton(
              onPressed: () async {
                final languageId = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LanguageScreen()));
                print("POP RESPONSE LANGUAGE ID====== $languageId");
                setState(() {
                  widget.langSelected = true;
                  user.langId = languageId;
                });
              },
              icon: Icon(Icons.translate)),
          widget.selected == true
              ? TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditPostPage(
                                  image: showImage ?? widget.selectedPost,
                                )));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ))
              : Container()
        ],
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor:   AppColor().colorPrimary(),
      ),
 /*     floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddLogoScreen()));
        },
        child: Icon(
          Icons.add,
          size: 32.sp,
          color: Colors.white,
        ),
        backgroundColor: AppColor().colorPrimary(),
      ),*/
      body: SafeArea(
          child: Column(
        children: [
          widget.selected
              ? Expanded(
                  child: Card(
                      elevation: 5,
                      child: Container(
                          child:
                              commonImage(showImage ?? widget.selectedPost, fit: BoxFit.cover,))))
              : Container(),
          widget.langSelected == false
              ? Expanded(
                  child: Container(
                    height: 120,
                    child: FutureBuilder(
                        future: getSubCategoryPost(widget.subId),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          SubCategoryPostModel? model = snapshot.data;
                          if (snapshot.hasData) {
                            return snapshot.data.status == true
                                ? Padding(
                              padding: const EdgeInsets.all(8.0),
                                  child: GridView.count(
                                      crossAxisCount: 3,
                                      childAspectRatio: 4 / 5,
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      children: List.generate(
                                        model!.data!.length,
                                        (int index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                showImage =
                                                    "${snapshot.data.imgPath}${snapshot.data.data[index].post}";
                                              });
                                              // widget.selected?
                                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoHero(
                                              //   photo: snapshot
                                              //       .data.data[index].post,
                                              //   width: 100.0,
                                              //   onTap: (){
                                              //     Navigator.pop(context);
                                              //   },
                                              // )))
                                              //     :print('video');
                                            },
                                            child: Container(
                                              width: 25.w,
                                              margin: EdgeInsets.only(right: 1.53.w),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(5.sp),
                                                child: Column(
                                                  // mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Card(
                                                      elevation: 5,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5.sp)
                                                        ),
                                                          child: commonImage("${snapshot.data.imgPath}${snapshot.data.data[index].post}",
                                                              height: 14.02.h,
                                                              width: 14.02.h,
                                                              fit: BoxFit.cover)
                                                      ),
                                                    ),
                                                    snapshot.data.data[index].categoryId == "1"
                                                        ? text("${model.data![index].title}",
                                                        textColor: AppColor().colorTextThird(),
                                                        fontSize: 7.5.sp,
                                                        fontFamily: fontSemibold,
                                                        maxLine: 1,
                                                        overFlow: true)
                                                    : SizedBox(),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            /*Card(
                                                // color: Colors.grey.shade100,
                                                child: widget.selected
                                                    ? Column(
                                                      children: [
                                                        Container(
                                                          width: 100,
                                                          height: 80,
                                                          child: commonImage(
                                                            "${snapshot.data.imgPath}${snapshot.data.data[index].post}", fit: BoxFit.fill,),
                                                        ),
                                                        snapshot.data.data[index].categoryId ==
                                                            "1"
                                                            ? Container(
                                                          color: Colors.white,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Expanded(
                                                                child: text(
                                                                    "${model.data![index].title}",
                                                                    textColor: Colors.black87,
                                                                    isCentered: true,
                                                                    fontSize: 9.5.sp,
                                                                    fontFamily: fontSemibold,
                                                                    maxLine: 2,
                                                                    overFlow: true),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                            : SizedBox()
                                                      ],
                                                    )
                                                    : Center(
                                                        child: IconButton(
                                                            onPressed: () {
                                                              print(
                                                                  "${snapshot.data.imgPath}${snapshot.data.data[index].post}");
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          VideoHeroHero(
                                                                            photo: "${snapshot.data.imageUrl}${snapshot.data.data[index].post}",
                                                                            width: 100.0,
                                                                            onTap: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                          )));
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .play_arrow,
                                                              size: 40,
                                                            )))
                                            ),*/
                                          );
                                        },
                                      )),
                                )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30.82.h,
                                        width: 100.w,
                                        alignment: Alignment.bottomCenter,
                                        padding: EdgeInsets.only(bottom: 2.h),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "images/post1.png"),
                                                fit: BoxFit.scaleDown)),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          text(
                                            "No Post Yet",
                                            fontSize: 12.5.sp,
                                            fontFamily: fontBold,
                                            textColor:
                                                AppColor().colorTextPrimary(),
                                          ),
                                          text(
                                            "All your posts will appear here after uploading.",
                                            fontSize: 6.5.sp,
                                            fontFamily: fontBold,
                                            textColor:
                                                AppColor().colorTextPrimary(),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                          } else if (snapshot.hasError) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30.82.h,
                                  width: 100.w,
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("images/post1.png"),
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
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ),
                )
              : Expanded(child: Container(
                    child: FutureBuilder(
                        future: showPostByLanguageId(user.langId, widget.catId, widget.subId),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          ShowPostByLanguageIdModel? model = snapshot.data;
                          if (snapshot.hasData) {
                            return snapshot.data.status == true
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GridView.count(
                                        crossAxisCount: 3,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        children: List.generate(
                                          model!.data!.length,
                                          (int index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  showImage =
                                                      "${snapshot.data.imgPath}${snapshot.data.data[index].post}";
                                                });
                                                // widget.selected?
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoHero(
                                                //   photo: snapshot
                                                //       .data.data[index].post,
                                                //   width: 100.0,
                                                //   onTap: (){
                                                //     Navigator.pop(context);
                                                //   },
                                                // )))
                                                //     :print('video');
                                              },
                                              child: Card(
                                                  color: Colors.grey.shade100,
                                                  child: widget.selected
                                                      ? Container(
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      "${snapshot.data.imgPath}${snapshot.data.data[index].post}"))),
                                                        )
                                                      : Center(
                                                          child: IconButton(
                                                              onPressed: () {
                                                                print(
                                                                    "${snapshot.data.imgPath}${snapshot.data.data[index].post}");
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            VideoHeroHero(
                                                                              photo: "${snapshot.data.imageUrl}${snapshot.data.data[index].post}",
                                                                              width: 100.0,
                                                                              onTap: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                            )));
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .play_arrow,
                                                                size: 40,
                                                              )))),
                                            );
                                          },
                                        )),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30.82.h,
                                        width: 100.w,
                                        alignment: Alignment.bottomCenter,
                                        padding: EdgeInsets.only(bottom: 2.h),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "images/post1.png"),
                                                fit: BoxFit.scaleDown)),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          text(
                                            "No Post Yet",
                                            fontSize: 12.5.sp,
                                            fontFamily: fontBold,
                                            textColor:
                                                AppColor().colorTextPrimary(),
                                          ),
                                          text(
                                            "All your posts will appear here after uploading.",
                                            fontSize: 6.5.sp,
                                            fontFamily: fontBold,
                                            textColor:
                                                AppColor().colorTextPrimary(),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                          } else if (snapshot.hasError) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30.82.h,
                                  width: 100.w,
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("images/post1.png"),
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
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ),),
        ],
      )),
    );
  }
}
