import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blinking_text/blinking_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/category_model.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/SeeAllSubCategory.dart';
import 'package:digital_marketing/screen/helpline.dart';
import 'package:digital_marketing/model/GetCategoryModel.dart';
import 'package:digital_marketing/screen/plan.dart';
import 'package:digital_marketing/screen/show_posts.dart';
import 'package:digital_marketing/screen/sub_category.dart';
import 'package:digital_marketing/utility_widget/myappbar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/custom_switch.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../model/SubCategoryModel.dart';
import 'category_screen.dart';
import 'package:neon/neon.dart';

Map<int, Color> color ={
  50:Color(0xff0000FF),
};
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  Animation<Color>? animation;
  AnimationController? Anicontroller;
  bool isSwitched = false;
  List<String> bannerList = [
    "images/banner1.png",
    "images/banner2.png",
    "images/banner2.png"
  ];
  List<CategoryModel> catList = [];
  late ScrollController controller = new ScrollController();
  int currentIndex = 0;
  // String? subCatId;
  var colorizeColors = [
    Colors.white,
    Colors.white,
    Color(0xff89AB0D),
    Color(0xffF7F14A),
    Colors.pinkAccent,
  ];

  List viewAll = [];

  var colorizeTextStyle = TextStyle(
    fontSize: 10.0,
    fontFamily: 'Horizon',
  );

  @override
  void initState() {
    // TODO: implement initState
/*
    disableCapture();
*/
    super.initState();

  }
  MaterialColor colorCustom = MaterialColor(0xFF0000FF, color);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    changeStatusBarColor(AppColor().colorBg2());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text("Well Come",
          // style: TextStyle(
          //   fontSize: 16,
          //   color: Colors.black87,
          //   fontWeight: FontWeight.bold
          // ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HelplinePage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.white),
                            // color: Color(0xff0A5A48),
                            color: AppColor().colorPrimary().withOpacity(0.6),
                            //Color(0xffFFD400),
                            //Color(0xffFB72A8),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: BlinkText(
                              'HELPLINE',
                              style: TextStyle(fontSize: 13.0, color: Colors.redAccent),
                              beginColor: Colors.white,
                              endColor: Color(0xff0000FF),
                              times: 10000,
                              duration: Duration(seconds: 1)
                          ),
                          // Neon(
                          //   text: 'Helpline',
                          //   color: Colors.blue,
                          //   // colorCustom,
                          //   fontSize: 13,
                          //   font: NeonFont.Beon,
                          //   // textStyle: TextStyle(
                          //   //   fontWeight: FontWeight.normal
                          //   // ),
                          //   flickeringText: true,
                          //   glowingDuration: new Duration(seconds: 2),
                          //   glowing: true,
                          // )
                          /*AnimatedTextKit(repeatForever: true, animatedTexts: [
                            ColorizeAnimatedText(
                              'HelpLine',
                              colors: colorizeColors,
                              textStyle: colorizeTextStyle,
                            ),
                          ]),*/
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PlanPage()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white),
                          // color: Color(0xff0A5A48),
                          color: AppColor().colorPrimary().withOpacity(0.6),
                          //Color(0xffFB72A8),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: BlinkText(
                            'PLAN',
                            style: TextStyle(fontSize: 13.0, color: Colors.redAccent),
                            beginColor: Colors.white,
                            endColor: Color(0xff0000FF),
                            times: 10000,
                            duration: Duration(seconds: 1)
                        ),
                        // Neon(
                        //   text: 'Plan',
                        //   color: Colors.green,
                        //   fontSize: 13,
                        //   font: NeonFont.Beon,
                        //   textStyle: TextStyle(
                        //       fontWeight: FontWeight.bold
                        //   ),
                        //   flickeringText: true,
                        //   glowingDuration: new Duration(seconds: 2),
                        // )
                        /*AnimatedTextKit(repeatForever: true, animatedTexts: [
                          ColorizeAnimatedText(
                            'Plan',
                            colors: colorizeColors,
                            textStyle: colorizeTextStyle,
                          ),
                        ]),*/
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //   SizedBox(
          //   width: MediaQuery.of(context).size.width*0.3,
          //   child: DefaultTextStyle(
          //     style: const TextStyle(
          //       fontSize: 16,
          //       color: Colors.white,
          //       shadows: [
          //         Shadow(
          //           blurRadius: 7.0,
          //           color: Colors.white,
          //           offset: Offset(0, 0),
          //         ),
          //       ],
          //     ),
          //     child: AnimatedTextKit(
          //       pause: Duration(microseconds: 300),
          //       repeatForever: true,
          //       animatedTexts: [
          //         FlickerAnimatedText('Plan'),
          //         FlickerAnimatedText('Plan'),
          //
          //       ],
          //       onTap: () {
          //
          //       },
          //     ),
          //   ),
          // ),
          //
          //     // AnimatedTextKit(
          //     //
          //     //     repeatForever: true,
          //     //     animatedTexts: [
          //     //       ColorizeAnimatedText(
          //     //         'Plan',
          //     //
          //     //         colors: colorizeColors, textStyle: colorizeTextStyle,
          //     //       ),
          //     //     ]),
          //   ],
          // ),
          centerTitle: true,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
          // ),
          backgroundColor:  AppColor().colorPrimary(),
          //AppColor().colorPrimary().withOpacity(0.5),
          // backgroundColor: Colors.white,
        ),
        body: SafeArea(
            child: ListView(
              children: [
                Container(
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
                        height: 3.18.h,
                      ),
                      FutureBuilder(
                          future: Future.wait([
                            getCategory(user.langId, user.userId, "1"),
                            getBanner(),
                          ]),
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              List data = snapshot.data[0].data;
                              List image = snapshot.data[1].data;

                              return snapshot.data[0].status
                                  ? Column(
                                children: [
                                  Container(
                                    width: 100.w,
                                    child: CarouselSlider(
                                      options: CarouselOptions(
                                          height: 20.62.h,
                                          viewportFraction: 1.2,
                                          initialPage: 0,
                                          enableInfiniteScroll: false,
                                          reverse: false,
                                          autoPlay: true,
                                          autoPlayInterval:
                                          Duration(seconds: 3),
                                          autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          scrollDirection: Axis.horizontal),
                                      items: image.map((e) {
                                        return ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(5.sp),
                                          child: Container(
                                              width: 95.w,
                                              child: commonImage(
                                                  e.sliderImage,
                                                  height: 15.62.h,
                                                  fit: BoxFit.fill)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount:
                                    data.length > 10 ? 10 : data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // Map<dynamic, dynamic> posts = data[index];
                                      return Column(
                                        children: [
                                          data[index].title != null
                                              ? Container(
                                            margin: EdgeInsets.only(
                                                left: 6.53.w,
                                                bottom: 1.87.h,
                                                right: 4.53.w),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .center,
                                              children: [
                                                text(
                                                  "${data[index].title}",
                                                  textColor: Colors.black,
                                                  fontSize: 14.5.sp,
                                                  fontFamily:
                                                  fontSemibold,
                                                ),
                                                OutlinedButton(
                                                  style: ButtonStyle(
                                                    side: MaterialStateProperty.all(BorderSide(
                                                      color: AppColor().colorPrimary()
                                                    )),
                                                    overlayColor: MaterialStateProperty.all(AppColor().colorPrimary())
                                                  ),
                                                    onPressed: () {
                                                      data[index].subcatStatus == "true"
                                                          ? Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => SeeAllSubCategory(
                                                                selected: true,
                                                                langSelected: false,
                                                                catId: data[index].id,
                                                                selectedPost: "https://icons-for-free.com/iconfiles/png/512/photo+size+select+actual+24px-131985228158210223.png",
                                                                // type: "1",
                                                              )))
                                                          : Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => ShowPosts(
                                                                selected: true,
                                                                langSelected: false,
                                                                catId: data[index].id,
                                                                selectedPost: "https://icons-for-free.com/iconfiles/png/512/photo+size+select+actual+24px-131985228158210223.png",
                                                                type: "1",
                                                              )));
                                                    },
                                                    child: Text(
                                                      "View All",
                                                      style: TextStyle(
                                                          color: AppColor()
                                                              .colorPrimary()),
                                                    ))
                                              ],
                                            ),
                                          )
                                              : Container(),

                                          // Subcategory Section
                                          data[index].subcatStatus == "true"
                                              ? Container(
                                            height: 16.00.h,
                                            margin: EdgeInsets.only(
                                                left: 6.53.w,
                                                bottom: 1.87.h),
                                            child: FutureBuilder(
                                                  future: subCategoryList(data[index].id),
                                                  builder: (BuildContext context,
                                                      AsyncSnapshot snapshot) {
                                                    SubCategoryModel? subCatModel = snapshot.data;
                                                    if (snapshot.hasData) {
                                                      return ListView.builder(
                                                        shrinkWrap: true,
                                                        scrollDirection: Axis.horizontal,
                                                        physics: ClampingScrollPhysics(),
                                                        itemCount: subCatModel!.data!.length,
                                                        itemBuilder: (context, subCatIndex){
                                                          // subCatId = subCatModel.data![subCatIndex].id;
                                                          return subCatModel.status!
                                                              ? InkWell(
                                                            onTap: (){
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => SubCategory(
                                                                        langSelected: false,
                                                                        selected: true,
                                                                        catId: data[index].id,
                                                                        subId: subCatModel.data![subCatIndex].id,
                                                                        selectedPost: "${subCatModel.imgPath}${subCatModel.data![subCatIndex].subcatImg}",
                                                                        // type: "1",
                                                                      )));
                                                            },
                                                            child: SubCategoryView(
                                                                index:index,
                                                                model: subCatModel.data![subCatIndex],
                                                                path: subCatModel.imgPath,
                                                                status: true
                                                            )
                                                            /*Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                                              child: Container(
                                                                width: 26.w,
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(7.sp),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                          height: MediaQuery.of(context).size.height * 0.13,
                                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.only(
                                                                              bottomLeft: Radius.circular(10.0),
                                                                              bottomRight: Radius.circular(10.0)
                                                                            ),
                                                                            image: DecorationImage(
                                                                              image: NetworkImage("${subCatModel.imgPath}${subCatModel.data![index].subcatImg}"),
                                                                              fit: BoxFit.fill,
                                                                            )
                                                                          ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child: text("${subCatModel.data![index].subcatTitle}",
                                                                                textColor: Colors.black87,
                                                                                isCentered: true,
                                                                                fontSize: 7.5.sp,
                                                                                fontFamily: fontSemibold,
                                                                                maxLine: 1,
                                                                                overFlow: true),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),*/
                                                          )
                                                              : Center(child: Text("Coming Soon"));
                                                        },
                                                      );
                                                    } else if (snapshot.hasError) {
                                                      return Icon(Icons.error_outline);
                                                    } else {
                                                      return Center(child: CircularProgressIndicator());
                                                    }
                                                  }),
                                          )
                                              :data[index].title != null
                                              ? Container(
                                            height: 16.00.h,
                                            margin: EdgeInsets.only(
                                                left: 6.53.w,
                                                bottom: 1.87.h),
                                            child: FutureBuilder(
                                                future: showPostByCatId(
                                                    "1", data[index].id),
                                                builder:
                                                    (BuildContext context,
                                                    AsyncSnapshot
                                                    snapshot) {
                                                  if (snapshot.hasData) {

                                                    var post =
                                                        snapshot.data;

                                                    if(snapshot.data.status != null){

                                                    }
                                                    return snapshot
                                                        .data.status
                                                        ? ListView
                                                        .builder(
                                                        controller:
                                                        controller,
                                                        shrinkWrap:
                                                        true,
                                                        scrollDirection:
                                                        Axis
                                                            .horizontal,
                                                        itemCount: post
                                                            .data
                                                            .length,
                                                        itemBuilder:
                                                            (context,
                                                            postIndex) {
                                                          return InkWell(
                                                            onTap:
                                                                () {
                                                              print('----0->');
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => ShowPosts(
                                                                        langSelected: false,
                                                                        selected: true,
                                                                        catId: data[index].id,
                                                                        selectedPost: "${post.imageUrl}${post.data[postIndex].post}",
                                                                        type: "1",
                                                                      )));
                                                            },
                                                            child: CategoryView(
                                                              index:index,
                                                                model: post.data[postIndex],
                                                                path: post.imageUrl,
                                                                status: true),
                                                          );
                                                        })
                                                        : Center(
                                                        child: Text(
                                                            "Coming Soon"));
                                                  } else if (snapshot.hasError) {
                                                    return Icon(Icons
                                                        .error_outline);
                                                  } else {
                                                    return Center(
                                                        child:
                                                        CircularProgressIndicator());
                                                  }
                                                }),
                                          )
                                              : Container(),
                                        ],
                                      );
                                    },
                                  ),
                                  // SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                                  //Category Section
                                  data.length > 10
                                      ? Container(
                                    margin: EdgeInsets.only(
                                        left: 6.53.w,
                                        bottom: 1.87.h,
                                        right: 4.53.w),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            text(
                                              "Category",
                                              textColor: Colors.black,
                                              fontSize: 14.5.sp,
                                              fontFamily: fontSemibold,
                                            ),
                                            SizedBox(
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.01,
                                            ),
                                            // Text("New" , style: TextStyle(color: Colors.red),),
                                            DefaultTextStyle(
                                              style:  TextStyle(
                                                fontSize: 13,
                                                color:   AppColor().colorPrimary(),
                                                shadows: const [
                                                  Shadow(
                                                    blurRadius: 7.0,
                                                    color: Colors.white,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                              child: AnimatedTextKit(
                                                pause: Duration(
                                                    microseconds: 500),
                                                repeatForever: true,
                                                animatedTexts: [
                                                  FlickerAnimatedText(
                                                      'New'),
                                                  FlickerAnimatedText(
                                                      'New'),
                                                  FlickerAnimatedText(
                                                      'New'),
                                                  FlickerAnimatedText(
                                                      'New'),
                                                  FlickerAnimatedText(
                                                      'New'),
                                                  FlickerAnimatedText(
                                                      'New'),
                                                ],
                                                onTap: () {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                      : Container(),
                                  data.length > 9
                                      ? Container(
                                    height: 75.w,
                                    margin: EdgeInsets.only(
                                        left: 6.53.w, bottom: 1.87.h),
                                    child: GridView.count(
                                      physics: NeverScrollableScrollPhysics(),
                                      crossAxisCount: 3,
                                      controller: controller,
                                      childAspectRatio: 4 / 5,
                                      shrinkWrap: true,
                                      children:
                                      data
                                          .skip(10)
                                          .map<Widget>((model) {
                                        return
                                          InkWell(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => ShowPosts(
                                            //             selected: true,
                                            //             catId: model.id,
                                            //             langSelected: false,
                                            //             selectedPost: model.image,
                                            //             type: "2"
                                            //         )));
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowPosts(
                                                          selected: true,
                                                          catId: model.id,
                                                          langSelected: false,
                                                          selectedPost: model.image,
                                                          type: "1",
                                                        )
                                                ));
                                          },
                                          child: Container(
                                            width: 25.w,
                                            margin: EdgeInsets.only(
                                                right: 1.53.w),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10.sp),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child:
                                                      commonImage(
                                                          model.image,
                                                          height:
                                                          14.02.h,
                                                          width:
                                                          14.02.h,
                                                          fit: BoxFit
                                                              .fill)),
                                                  text(model.title,
                                                      textColor:
                                                      Colors.black,
                                                      fontSize: 7.5.sp,
                                                      fontFamily:
                                                      fontSemibold,
                                                      maxLine: 1,
                                                      overFlow: true),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                                  : Center(child: Text("Some Thing Went Wrong"),);
                            } else if (snapshot.hasError) {
                              return Icon(Icons.error_outline);
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Future<void> disableCapture() async {
    //disable screenshots and record screen in current screen
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
}

class CategoryView extends StatelessWidget {
  var model;
  bool status;
  final path;
  final index;

  CategoryView({Key? key, required this.model, required this.status, this.path, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 26.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.sp),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white38,
                              //extend the shadow
                              offset: Offset(
                                2, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("$path${model.post}"))),
                    ),
                    status && index==0
                        ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: text("${model.date}",
                                  textColor: Colors.deepOrange,
                                  fontSize: 7.5.sp,
                                  fontFamily: fontSemibold,
                                  maxLine: 1,
                                  overFlow: true),
                            ),
                          ),
                        ),
                      ],
                    )
                        : SizedBox(),
                  ],
                ),
              ),
              status
                  ? Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: text("${model.title}",
                          textColor: Colors.black87,
                          fontSize: 7.5.sp,
                          fontFamily: fontSemibold,
                          maxLine: 1,
                          overFlow: true),
                    ),
                  ],
                ),
              )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class SubCategoryView extends StatelessWidget {
  var model;
  bool status;
  final path;
  final index;

  SubCategoryView({Key? key, required this.model, required this.status, this.path, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 26.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.sp),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white38,
                              //extend the shadow
                              offset: Offset(
                                2, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("$path${model.subcatImg}"))),
                    ),
                    status && index == 0
                        ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: text("${model.date}",
                                  textColor: Colors.deepOrange,
                                  fontSize: 7.5.sp,
                                  fontFamily: fontSemibold,
                                  maxLine: 1,
                                  overFlow: true),
                            ),
                          ),
                        ),
                      ],
                    )
                        : SizedBox(),
                  ],
                ),
              ),
              status
                  ? Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: text("${model.subcatTitle}",
                          textColor: Colors.black87,
                          fontSize: 7.5.sp,
                          fontFamily: fontSemibold,
                          maxLine: 1,
                          overFlow: true),
                    ),
                  ],
                ),
              )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }


}

