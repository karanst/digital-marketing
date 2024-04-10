import 'dart:io';

import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/model/get_politica_list_model.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/save_image.dart';
import 'package:digital_marketing/utility_widget/myappbar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:joystick/joystick.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'package:screenshot/screenshot.dart';

class EditPostPage extends StatefulWidget {
  final image;

  const EditPostPage({Key? key, this.image}) : super(key: key);

  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage>
    with TickerProviderStateMixin {
  double width = 100.0, height = 100.0;
  Uint8List? _imageFile;
  ScreenshotController screenshotController = ScreenshotController();
  bool imageView = true;
  bool phoneView = true;
  bool emailView = true;
  bool faceView = true;
  bool locationView = true;
  bool nameView = true;

  Color pickerColor = Color(0xffffffff);
  Color currentColor = Color(0xff443a49);

  Color mobColor = Color(0xffffffff);
  Color cMobColor = Color(0xff443a49);

  Color emailColor = Color(0xffffffff);
  Color cEmailColor = Color(0xff443a49);
  Color faceColor = Color(0xffffffff);
  Color cFaceColor = Color(0xff443a49);

  Color locColor = Color(0xffffffff);
  Color cLocColor = Color(0xff443a49);

  double textSize = 14;
  late TabController _tabController;

  var user = "User Name";

  double phoneSize = 12;

  double emailSize = 12;
  double locSize = 12;
  double profileSize = 20;

  double moveV = 0;

  double moveH = 0;
  int frameSelected = 0;



// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void mobileColor(Color color) {
    setState(() => mobColor = color);
  }

  void pEmailColor(Color color) {
    setState(() => emailColor = color);
  }

  void pLocColor(Color color) {
    setState(() => locColor = color);
  }
  void pFaceColor(Color color) {
    setState(() => faceColor = color);
  }

  changeText() async {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Change Color"),
            children: [
              ColorPicker(
                  paletteType: PaletteType.hueWheel,
                  pickerColor: pickerColor,
                  onColorChanged: changeColor),
            ],
          );
        });
  }

  changeMobile() async {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Change Color"),
            children: [
              ColorPicker(
                  paletteType: PaletteType.hueWheel,
                  pickerColor: mobColor,
                  onColorChanged: mobileColor),
            ],
          );
        });
  }

  changeEmail() async {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Change Color"),
            children: [
              ColorPicker(
                  paletteType: PaletteType.hueWheel,
                  pickerColor: emailColor,
                  onColorChanged: pEmailColor),
            ],
          );
        });
  }
  changeFacebook() async {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Change Color"),
            children: [
              ColorPicker(
                  paletteType: PaletteType.hueWheel,
                  pickerColor: faceColor,
                  onColorChanged: pFaceColor),
            ],
          );
        });
  }

  changeLoc() async {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Change Color"),
            children: [
              ColorPicker(
                  paletteType: PaletteType.hueWheel,
                  pickerColor: locColor,
                  onColorChanged: pLocColor),
            ],
          );
        });
  }

  List<Map> framePosition = [
    {
      "frame": "images/bottom/1.png",
      "number": [0, 5],
      "address": [20, 5],
      "email": [0, 120],
      "face": [10, 65],
    },
    {
      "frame": "images/bottom/2.png",
      "number": [12, 5],
      "address": [0, 5],
      "email": [20, 45],
      "face": [10, 65],

    },
    {
      "frame": "images/bottom/5.png",
      "number": [15, 10],
      "address": [0, 160],
      "email": [15, 120],
      "face": [10, 65],
    },
    {
      "frame": "images/bottom/6.png",
      "number": [20, 10],
      "address": [0, 10],
      "email": [2, 50],
      "face": [10, 65],
    },
    {
      "frame": "images/bottom/7.png",
      "number": [15, 55],
      "address": [0, 10],
      "email": [15, 85],
      "face": [10, 65],
    },
  ];

  var profileImage = "";
  var businessName = "";
  var businessEmail = "";
  var businessNo = "";
  var businessLoc = "";
  var businessFace = "";


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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
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
                child: Text("Save", style: TextStyle(color: Colors.white),))
          ],
          centerTitle: true,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //       bottomRight: Radius.circular(25),
          //       bottomLeft: Radius.circular(25)),
          // ),
          backgroundColor:   AppColor().colorPrimary(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Screenshot(
                    controller: screenshotController,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(widget.image),
                              )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                child: Image.asset(
                                  framePosition[frameSelected]["frame"],
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                )),
                          ],
                        ),
                        profileImage != ""
                            ? imageView
                            ? InkWell(
                            onTap: () {
                              _tabController.animateTo(0);
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(profileImage),
                              radius: profileSize,
                            ))
                            : Container()
                            : Container(),
                        businessName != ""
                            ? nameView
                            ? Positioned(
                            right: moveH,
                            top: moveV,
                            child: InkWell(
                              onTap: () {
                                _tabController.animateTo(4);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "$businessName",
                                  style: TextStyle(
                                      color: pickerColor, fontSize: textSize),
                                ),
                              ),
                            ))
                            : Container()
                            : Container(),
                        businessNo != ""
                            ? phoneView
                            ? Positioned(
                            bottom: framePosition[frameSelected]["number"][0]
                                .toDouble(),
                            left: framePosition[frameSelected]["number"][1]
                                .toDouble(),
                            child: InkWell(
                                onTap: () {
                                  _tabController.animateTo(1);
                                },
                                child: Container(
                                  width: w*.4,
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone , size: 10,color: mobColor,),
                                      SizedBox(width: 3,),
                                      Text(
                                        "+91 $businessNo",
                                        style: TextStyle(

                                            fontSize: 10, color: mobColor),
                                      ),
                                    ],
                                  ),
                                )))
                            : Container()
                            : Container(),
                        businessLoc!=""?
                        locationView
                            ? Positioned(
                            bottom: framePosition[frameSelected]["address"][0]
                                .toDouble(),
                            left: framePosition[frameSelected]["address"][1]
                                .toDouble(),
                            child: InkWell(
                                onTap: () {
                                  _tabController.animateTo(3);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on , color: locColor,size: 10,),
                                    Text(
                                      "$businessLoc",
                                      style: TextStyle(
                                        fontSize: 10, color: locColor , ),
                                    ),
                                  ],
                                )))
                            : Container():Container(),
                        businessEmail != ""
                            ? emailView
                            ? Positioned(
                            bottom: framePosition[frameSelected]["email"][0]
                                .toDouble(),
                            right: framePosition[frameSelected]["email"][1]
                                .toDouble(),
                            child: InkWell(
                                onTap: () {
                                  _tabController.animateTo(2);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.email , size: 10,color: emailColor,),
                                    SizedBox(width: 3,),
                                    FittedBox(
                                      child: Text(
                                        "$businessEmail",
                                        style: TextStyle(color: emailColor , fontSize: 10),
                                      ),
                                    ),
                                  ],
                                )))
                            : Container()
                            : Container(),
                        businessFace !=""?
                        faceView?
                        Positioned(
                            top: framePosition[frameSelected]["face"][0]
                                .toDouble(),
                            left: framePosition[frameSelected]["face"][1]
                                .toDouble(),
                            child: InkWell(
                                onTap: () {
                                  _tabController.animateTo(2);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.facebook , size: 12,color: faceColor,),
                                    SizedBox(width: 3,),
                                    Container(
                                      child: FittedBox(
                                        child: Text(
                                          "$businessFace",
                                          style: TextStyle(color: faceColor, fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ],
                                )))
                            : Container()
                            : Container(),

                      ],
                    ),
                  )),
              Expanded(
                  child: DefaultTabController(
                    length: 6,
                    child: Container(
                      child: Column(
                        children: [

                          Expanded(
                            child: Container(
                              child:
                              TabBarView(controller: _tabController, children: [
                                Container(
                                  child: ListView(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    children: [
                                      TabBar(
                                          isScrollable: true,
                                          controller: _tabController,
                                          tabs: [
                                            Tab(
                                              icon: Icon(
                                                Icons.person_pin_outlined,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Tab(
                                              icon: Icon(
                                                Icons.phone,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Tab(
                                              icon: Icon(
                                                Icons.email_outlined,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Tab(
                                              icon: Icon(
                                                Icons.location_on_rounded,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Tab(
                                              icon: Icon(
                                                Icons.title,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Tab(
                                              icon: Icon(
                                                Icons.facebook,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ]),
                                      ListTile(
                                        title: Text("Show/Hide"),
                                        trailing: Switch(
                                            value: imageView,
                                            onChanged: (v) {
                                              setState(() {
                                                imageView = !imageView;
                                              });
                                            }),
                                      ),
                                      Slider(
                                          min: 10,
                                          max: 28,
                                          value: profileSize,
                                          onChanged: (value) {
                                            setState(() {
                                              profileSize = value;
                                            });
                                          }),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Frame"),
                                          Container(
                                            height: 50,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: framePosition.length,
                                              itemBuilder:
                                                  (BuildContext context, int index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      frameSelected = index;
                                                    });
                                                  },
                                                  child: Card(
                                                    child: Container(
                                                      child: Image.asset(
                                                          framePosition[index]
                                                          ["frame"]),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                      Column(
                                        children: [
                                          ListTile(
                                            title: Text("Business Plans"),
                                          ),
                                          FutureBuilder(
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
                                                            setState(() {
                                                              profileImage =
                                                                  data[index].logo;
                                                              businessName =
                                                                  data[index]
                                                                      .businessName;
                                                              businessEmail =
                                                                  data[index]
                                                                      .businessEmail;
                                                              businessNo = data[index]
                                                                  .businessMobile;
                                                              businessLoc = data[index].businessAddress;
                                                              businessFace = data[index].facebookLink;
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
                                              }),
                                          ListTile(
                                            title: Text("Political Business Plans"),
                                          ),
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
                                                        GetPoliticaListModel data = snapshot.data;
                                                        return InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              profileImage =
                                                              data.data![index].businessLogo!;
                                                              businessName =
                                                              data.data![index].politicalName!;
                                                              businessEmail ="";
                                                              businessNo = data.data![index].politicalMobile!;
                                                              businessLoc = data.data![index].politicalDesgination!;
                                                              businessFace = data.data![index].facebookLink!;

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
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text("Show/Hide"),
                                        trailing: Switch(
                                            value: phoneView,
                                            onChanged: (v) {
                                              setState(() {
                                                phoneView = !phoneView;
                                              });
                                            }),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          changeMobile();
                                        },
                                        title: Text("Change Color"),
                                      ),
                                      // Slider(
                                      //     min: 10,
                                      //     max: 28,
                                      //     value: phoneSize,
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         phoneSize = value;
                                      //       });
                                      //     }),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text("Show/Hide"),
                                        trailing: Switch(
                                            value: emailView,
                                            onChanged: (v) {
                                              setState(() {
                                                emailView = !emailView;
                                              });
                                            }),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          changeEmail();
                                        },
                                        title: Text("Change Color"),
                                      ),
                                      // Slider(
                                      //     min: 10,
                                      //     max: 28,
                                      //     value: emailSize,
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         emailSize = value;
                                      //       });
                                      //     }),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text("Show/Hide"),
                                        trailing: Switch(
                                            value: locationView,
                                            onChanged: (v) {
                                              setState(() {
                                                locationView = !locationView;
                                              });
                                            }),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          changeLoc();
                                        },
                                        title: Text("Change Color"),
                                      ),
                                      // Slider(
                                      //     min: 10,
                                      //     max: 28,
                                      //     value: locSize,
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         locSize = value;
                                      //       });
                                      //     }),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text("Show/Hide"),
                                        trailing: Switch(
                                            value: nameView,
                                            onChanged: (v) {
                                              setState(() {
                                                nameView = !nameView;
                                              });
                                            }),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          changeText();
                                        },
                                        title: Text("Change Color"),
                                      ),
                                      Slider(
                                          min: 10,
                                          max: 28,
                                          value: textSize,
                                          onChanged: (value) {
                                            setState(() {
                                              textSize = value;
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text("Show/Hide"),
                                        trailing: Switch(
                                            value: faceView,
                                            onChanged: (v) {
                                              setState(() {
                                                faceView = !faceView;
                                              });
                                            }),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          changeFacebook();
                                        },
                                        title: Text("Change Color"),
                                      ),
                                      // Slider(
                                      //     min: 10,
                                      //     max: 28,
                                      //     value: emailSize,
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         emailSize = value;
                                      //       });
                                      //     }),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
