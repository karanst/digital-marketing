import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/SubCategoryModel.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/edit_post.dart';
import 'package:digital_marketing/screen/language_screen.dart';
import 'package:digital_marketing/screen/logo_screen.dart';
import 'package:digital_marketing/screen/sub_category.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SeeAllSubCategory extends StatefulWidget {
  final selected;
  final catId;
  final selectedPost;
  final type;
  bool? langSelected;

  SeeAllSubCategory(
      {Key? key,
      this.selected,
      this.catId,
      this.selectedPost,
      this.type,
      this.langSelected})
      : super(key: key);

  @override
  State<SeeAllSubCategory> createState() => _SeeAllSubCategoryState();
}

class _SeeAllSubCategoryState extends State<SeeAllSubCategory> {
  var showImage;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        /*actions: [
          IconButton(
              onPressed: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LanguageScreen()));
                setState(() {
                  widget.langSelected = true;
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
        ],*/
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor:   AppColor().colorPrimary(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    /*  floatingActionButton: FloatingActionButton(
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
            Container(
              child: FutureBuilder(
              future: subCategoryList(widget.catId),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                SubCategoryModel? subCatModel = snapshot.data;
                if (snapshot.hasData) {
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SubCategory(
                                                langSelected: false,
                                                selected: true,
                                                subId: subCatModel!.data![index].id,
                                                selectedPost: "${subCatModel.imgPath}${subCatModel.data![index].subcatImg}",
                                                // type: "1",
                                              )));
                                      // setState(() {
                                      //   showImage =
                                      //       "${snapshot.data.imgPath}${snapshot.data.data[index].subcatImg}";
                                      // });

                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        width: 26.w,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7.sp),
                                          child: Column(
                                            children: [
                                              Container(
                                                height:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.13,
                                                width:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.45,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                    10.0),
                                                            bottomRight: Radius
                                                                .circular(
                                                                    10.0)),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${subCatModel!.imgPath}${subCatModel.data![index].subcatImg}"),
                                                      fit: BoxFit.fill,
                                                    )),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                children: [
                                                  Expanded(
                                                    child: text(
                                                        "${subCatModel.data![index].subcatTitle}",
                                                        textColor:
                                                            Colors.black87,
                                                        isCentered: true,
                                                        fontSize: 7.5.sp,
                                                        fontFamily:
                                                            fontSemibold,
                                                        maxLine: 1,
                                                        overFlow: true),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*Card(
                                      color: Colors.grey.shade100,
                                      child: widget.selected
                                          ? Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${snapshot.data.imgPath}${snapshot.data.data[index].subcatImg}"))),
                                      )
                                          : Center(
                                          child: IconButton(
                                              onPressed: () {
                                                print("${snapshot.data.imgPath}${snapshot.data.data[index].subcatImg}");
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                            VideoHeroHero(
                                                              photo:
                                                              "${snapshot.data.imgPath}${snapshot.data.data[index].subcatImg}",
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
                                              )))),*/
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
                                      image: AssetImage(widget.selected
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
            )
            /* widget.selected
                ? Expanded(
                child: Card(
                    elevation: 5,
                    child: Container(
                        child: commonImage(
                            showImage ?? widget.selectedPost))))
                : Container(),

            widget.langSelected == false
                ? Expanded(
                child: Container(
                  child: FutureBuilder(
                      future: subCategoryList(widget.catId),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        SubCategoryModel? subCatModel = snapshot.data;
                        if (snapshot.hasData) {
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
                                        setState(() {
                                          showImage =
                                          "${snapshot.data.imgPath}${snapshot.data.data[index].subcatImg}";
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
                                                        "${snapshot.data.imgPath}${snapshot.data.data[index].subcatImg}"))),
                                          )
                                              : Center(
                                              child: IconButton(
                                                  onPressed: () {
                                                    print("${snapshot.data.imgPath}${snapshot.data.data[index].subcatImg}");
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                VideoHeroHero(
                                                                  photo:
                                                                  "${snapshot.data.imgPath}${snapshot.data.data[index].subcatImg}",
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30.82.h,
                                width: 100.w,
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.only(bottom: 2.h),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(widget.selected
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
                ))
                : Expanded(
              child: Container(
                child: FutureBuilder(
                    future: showPostByLanguageId(user.langId),
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
                                                  print("${snapshot.data.imgPath}${snapshot.data.data[index].post}");
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder:
                                                              (context) =>
                                                              VideoHeroHero(
                                                                photo:
                                                                "${snapshot.data.imageUrl}${snapshot.data.data[index].post}",
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
            ),*/
          ],
        ),
      ),
    );
  }
}
