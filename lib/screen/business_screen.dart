import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/delete_business_model.dart';
import 'package:digital_marketing/model/delete_potical_model.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/bottom_bar.dart';
import 'package:digital_marketing/screen/form/my_business_form.dart';
import 'package:digital_marketing/screen/logo_screen.dart';
import 'package:digital_marketing/screen/plan.dart';

import 'package:digital_marketing/utils/common.dart';
import 'package:flutter/material.dart';

import 'package:digital_marketing/utility_widget/myappbar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BusinessScreen extends StatefulWidget {
  final refresh;
  bool form;
   BusinessScreen({Key? key, this.refresh,this.form = false}) : super(key: key);

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  bool selected = true;

  checkRefresh() async {
    if (widget.refresh != null) {
      setState(() {
        print("bye");
      });
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkRefresh();
  }

  @override
  Widget build(BuildContext context) {
    checkRefresh();

    setState(() {
      changeStatusBarColor(AppColor().colorPrimary());
    });

    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          if(widget.form){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomBar()), (route) => false);
          }else{
            Navigator.pop(context);
          }
          return Future.value();
        },
        child: Scaffold(
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  var data = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyBusinessForm(
                                selected: selected,
                                edit: false,
                              )));
                  if(data != null){
                    checkRefresh();
                  }
                },
                child: Container(
                  height: 6.39.h,
                  width: 6.39.h,
                  decoration:
                      boxDecoration(radius: 100, bgColor: AppColor().colorPrimary()),
                  child: Center(
                    // child: Image.asset(
                    //   add,
                    //   height: 6.26.h,
                    //   width: 6.26.h,
                    // ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 1.h,),
///CREATE LOGO///
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>AddLogoScreen()));
              //   },
              //   child: Container(
              //     width: 41.66.w,
              //     height: 5.15.h,
              //     decoration: boxDecoration(
              //       radius: 30.0,
              //       color: AppColor().colorPrimaryDark(),
              //       bgColor:  AppColor().colorPrimaryDark(),
              //       showShadow: true,
              //     ),
              //     child: Center(
              //       child: text(
              //         "Create Logo",
              //         textColor:  AppColor().colorBg1(),
              //         fontSize: 10.5.sp,
              //         fontFamily: fontSemibold,
              //       ),
              //     ),
              //   ),
              // ),
              ///CREATE LOGO///
            ],
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
                MyappBarView(
                  myTitle: selected ? "Create Business Profile" : "My Political Business",
                  status: true,
                  from: widget.form,
                  action: Container(),
                ),
                SizedBox(
                  height: 3.18.h,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 6.33.w, right: 6.33.w, bottom: 1.87.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "My Business",
                              textColor: !selected
                                  ? AppColor().colorTextPrimary()
                                  : AppColor().colorBg1(),
                              fontSize: 10.5.sp,
                              fontFamily: fontSemibold,
                            ),
                          ),
                        ),
                      ),
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
                              "My Political Business",
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
                SizedBox(
                  height: 1.18.h,
                ),
                BusinessCard(
                  selected: selected,
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class BusinessCard extends StatefulWidget {
  final selected;

  const BusinessCard({Key? key, this.selected}) : super(key: key);

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    Common _common = Common();
    var user = Provider.of<UserProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return widget.selected
        ? FutureBuilder(
            future: getBusinessList(user.userId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.status == true
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Container(
                              width: width,
                              height: 110,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 19),
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 3,
                                      shadowColor:
                                          AppColor().colorPrimaryDark(),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                  AppColor().colorPrimary(),
                                                Colors.white,
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: VerticalDivider(
                                        thickness: 5,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Positioned(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: CircleAvatar(
                                            radius: 43,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  snapshot
                                                      .data.data[index].logo),
                                              backgroundColor: Colors.red,
                                              radius: 40,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                    Positioned(
                                      top: 28,
                                      right: -20,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  var data =
                                                      await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MyBusinessForm(
                                                                    selected: widget
                                                                        .selected,
                                                                    edit: true,
                                                                    editData: snapshot
                                                                            .data
                                                                            .data[
                                                                        index],
                                                                  )));

                                                  if (data) {
                                                    setState(() {});
                                                  } else {
                                                    print("nothing");
                                                  }
                                                },
                                                splashColor: AppColor()
                                                    .colorPrimaryDark(),
                                                child: CircleAvatar(
                                                  child: Icon(
                                                    Icons.edit,
                                                    size: 14,
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  radius: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: width * .37,
                                              child: Text(
                                                "${snapshot.data.data[index].businessName}",
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                              child: OutlinedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.white),
                                                      side:
                                                          MaterialStateProperty
                                                              .all(BorderSide(
                                                                  color: Colors
                                                                      .red))),
                                                  onPressed: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanPage()));
                                                  },
                                                  child: Text(
                                                    "Select Plan",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            "Do you want to delete ?"),
                                                        content: Text(
                                                            "Once the business card deleted can't be retrieve again."),
                                                        actions: [
                                                          TextButton(
                                                              onPressed:
                                                                  () async {
                                                                DeleteBusinessModel?
                                                                    model =
                                                                    await deleteBusiness(
                                                                        snapshot
                                                                            .data
                                                                            .data[index]
                                                                            .id);
                                                                if (model!
                                                                        .status ==
                                                                    true) {
                                                                  setState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                  _common.toast(model
                                                                      .message
                                                                      .toString());
                                                                } else {
                                                                  _common.toast(model
                                                                      .message
                                                                      .toString());
                                                                }
                                                              },
                                                              child: Text(
                                                                  "Delete")),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  "Cancel"))
                                                        ],
                                                      );
                                                    });
                                              },
                                              icon: Icon(
                                                Icons.delete_forever,
                                                color: Colors.white,
                                              )),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Text("No Business Add Some");
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return CircularProgressIndicator();
              }
            })
        : FutureBuilder(
            future: getPoliticalList(user.userId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.status == true
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Container(
                              width: width,
                              height: 110,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 19),
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 3,
                                      shadowColor:
                                          AppColor().colorPrimaryDark(),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.white,
                                                AppColor().colorPrimary(),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                      child: VerticalDivider(
                                        thickness: 5,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Positioned(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: CircleAvatar(
                                            radius: 43,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  snapshot.data.data[index]
                                                      .businessLogo),
                                              backgroundColor: Colors.red,
                                              radius: 40,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                    Positioned(
                                      top: 28,
                                      right: -20,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  var data =
                                                      await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MyBusinessForm(
                                                                    selected: widget.selected,
                                                                    edit: true,
                                                                    editData: snapshot.data.data[index],
                                                                  )));
                                                  if (data) {
                                                    setState(() {});
                                                  } else {
                                                    print("nothing");
                                                  }
                                                },
                                                splashColor: AppColor()
                                                    .colorPrimaryDark(),
                                                child: CircleAvatar(
                                                  child: Icon(
                                                    Icons.edit,
                                                    size: 14,
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  radius: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: width * .37,
                                              child: Text(
                                                "${snapshot.data.data[index].politicalName}",
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                              child: OutlinedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                                  Colors.white),
                                                      side:
                                                          MaterialStateProperty
                                                              .all(BorderSide(
                                                                  color: Colors
                                                                      .red))),
                                                  onPressed: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanPage()));
                                                  },
                                                  child: Text(
                                                    "Select Plan",
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            "Do you want to delete ?"),
                                                        content: Text(
                                                            "Once the business card deleted can't be retrieve again."),
                                                        actions: [
                                                          TextButton(
                                                              onPressed:
                                                                  () async {
                                                                DeletePoticalModel?
                                                                    model =
                                                                    await deletePolitical(
                                                                        snapshot
                                                                            .data
                                                                            .data[index]
                                                                            .id);
                                                                if (model!
                                                                        .status ==
                                                                    true) {
                                                                  setState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                  _common.toast(model
                                                                      .message
                                                                      .toString());
                                                                } else {
                                                                  _common.toast(model
                                                                      .message
                                                                      .toString());
                                                                }
                                                              },
                                                              child: Text(
                                                                  "Delete")),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  "Cancel"))
                                                        ],
                                                      );
                                                    });
                                              },
                                              icon: Icon(
                                                Icons.delete_forever,
                                                color: Colors.white,
                                              )),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Text("No Business Add Some");
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return CircularProgressIndicator();
              }
            });
  }
}
