import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/ShowPostByLanguageIdModel.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/edit_post.dart';
import 'package:digital_marketing/screen/language_screen.dart';
import 'package:digital_marketing/screen/logo_screen.dart';
import 'package:digital_marketing/show_post_animation/show_hero_animation.dart';
import 'package:digital_marketing/utility_widget/myappbar.dart';
import 'package:digital_marketing/utils/app_strings.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../model/PurchaseHistoryModel.dart';

class ShowPosts extends StatefulWidget {
  final selected;
  final catId;
  final selectedPost;
  final type;
  bool? langSelected;

  ShowPosts(
      {Key? key,
      this.selected,
      this.catId,
      this.selectedPost,
      this.type,
      this.langSelected})
      : super(key: key);

  @override
  _ShowPostsState createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> {
  late VideoPlayerController _controller;
  var showImage, user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(showImage ?? widget.selectedPost)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..play();
  }
  
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    // print("PURCHASE PLAN STATUS    " + user.planStatus.toString());
    // print("SELECTED STATUS    " + widget.selected.toString());
    return Scaffold(
      appBar: AppBar(
        title: widget.selected ? Text("Post") : Text("Videos"),
        actions: [
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
        ],
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor:   AppColor().colorPrimary(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
   /*   floatingActionButton: FloatingActionButton(
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
                            child: commonImage(
                                showImage ?? widget.selectedPost, fit: BoxFit.cover))))
                : Expanded(
                child: Card(
                    elevation: 5,
                    child: Container(
                        child: commonImage(
                            showImage ?? widget.selectedPost)))),
            widget.langSelected == false
                ? Expanded(
                    child: Container(
                    child: FutureBuilder(
                        future: showPostByCatId(widget.type, widget.catId),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                                                  "${snapshot.data.imageUrl}${snapshot.data.data[index].post}";});
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
                                                elevation: 2,
                                                  color: Colors.grey.shade100,
                                                  child: widget.selected
                                                      ? Container(
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      "${snapshot.data.imageUrl}${snapshot.data.data[index].post}"),
                                                              fit: BoxFit.fill)),
                                                        )
                                                      : Center(
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: NetworkImage(
                                                                          "${snapshot.data.imageUrl}${snapshot.data.data[index].post}"))),
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  print("VIDEO IMAGES========= ${snapshot.data.imageUrl}${snapshot.data.data[index].post}");
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              VideoHeroHero(
                                                                                photo: "${snapshot.data.imageUrl}${snapshot.data.data[index].post}",
                                                                                width: 100.0,
                                                                                selected: widget.selected,
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                              )));

                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .play_arrow,
                                                                  size: 40,
                                                                )),
                                                          ))),
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
                                                    widget.selected
                                                        ? "images/post1.png"
                                                        : "images/post2.png"),
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
                            return Icon(Icons.error_outline);
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ))
                : Expanded(
                    child: Container(
                    child: FutureBuilder(
                        future:
                            showPostByLanguageId(user.langId, widget.catId, ''),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
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
                  )),
          ],
        ),
      ),
    );
  }
}
