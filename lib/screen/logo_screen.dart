import 'dart:typed_data';

import 'package:digital_marketing/screen/save_image.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:materialdesignlogo/materialdesignlogo.dart';
import 'package:materialdesignlogo/widget_type.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

class AddLogoScreen extends StatefulWidget {
  const AddLogoScreen({Key? key}) : super(key: key);

  @override
  State<AddLogoScreen> createState() => _AddLogoScreenState();
}

class _AddLogoScreenState extends State<AddLogoScreen> {
  TabController? _tabController;
  TextEditingController textCon = new TextEditingController();
  Uint8List? _imageFile;
  ScreenshotController screenshotController = ScreenshotController();
  Widget widget1 =SizedBox();
  List<int> logoList = [
      1,2,3,4,5,6,7,8
  ];
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
  bool custom = false;
  String fontFamily = "";
  FontWeight fontWeight = FontWeight.bold;
  Color selectedColor = Colors.red;
  double fontSize = 25.sp;
  changeColor(color1) async {
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
                    setState((){
                        selectedColor = color;
                    });
                  }),
            ],
          );
        });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Logo"),
        actions: [
          TextButton(
              onPressed: () {
                capture();
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              )
          ),
        ],
        centerTitle: true,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //       bottomRight: Radius.circular(25),
        //       bottomLeft: Radius.circular(25)),
        // ),
        backgroundColor:   AppColor().colorPrimary(),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 2.h,),
            Container(
              padding: EdgeInsets.all(4.w),
              child: TextField(
                controller: textCon,
                onChanged: (val){
                  setState((){
                      widget1 = MdiLogo.ebay(
                        text: val,
                      );
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Enter Text"
                ),
              ),
            ),
            Screenshot(
              controller: screenshotController,
              child: Card(
                child: Container(
                  height: 15.h,
                  width: 90.h,
                  child: Center(child: custom?
                      MdiLogo.plainText(
                        fontSize: fontSize,
                        fontColor: selectedColor,
                        text: textCon.text,
                        fontWeight: fontWeight,
                        letterSpacing: -1.2,
                      )
                      :widget1),
                ),
              ),
            ),
            SizedBox(height: 1.h,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                              "Sample Logo",
                              textColor: AppColor().colorTextPrimary()
                          ),
                          IconButton(onPressed: (){
                            setState((){
                              custom = false;
                            });
                          }, icon: Icon(
                            ! custom?Icons.radio_button_checked_sharp:Icons.radio_button_unchecked,
                            color: AppColor().colorPrimary(),
                          )),

                        ],
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: logoList.map((e) {
                        int i = logoList.indexWhere((element) => e ==element);
                        return InkWell(
                          onTap: (){
                            setState((){
                              if(i==0){
                                widget1 = MdiLogo.ebay(
                                  text: textCon.text,
                                );
                              }
                              if(i==1){
                                widget1 = MdiLogo.google(
                                  text: textCon.text,
                                );
                              }
                              if(i==2){
                                widget1 = MdiLogo.facebook(
                                    textData: PlainTextLogo(
                                      text: textCon.text,
                                    ),
                                    plainLogo: true
                                );
                              }
                              if(i==3){
                                widget1 = MdiLogo.mdiLogoText(
                                  text: textCon.text,
                                );
                              }
                              if(i==4){
                                widget1 = MdiLogo.ferrari(
                                  text: textCon.text,
                                );
                              }
                              if(i==5){
                                widget1 = MdiLogo.fedX(
                                  text: textCon.text,
                                );
                              }
                              if(i==6){
                                widget1 = MdiLogo.linkedln(
                                    textData: PlainTextLogo(
                                      text: textCon.text,
                                    ),
                                    plainLogo: true
                                );
                              }
                              if(i==7){
                                widget1 = MdiLogo.bbc(
                                  text: textCon.text,
                                );
                              }
                            });
                          },
                          child: Container(
                            decoration: boxDecoration(
                              showShadow: true,
                              radius: 5,
                            ),
                            height: 8.h,
                            width: 8.h,
                            child: Center(
                              child: text(
                                  e.toString(),
                                  textColor: AppColor().colorTextPrimary()
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 2.h,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                              "Custom Logo",
                              textColor: AppColor().colorTextPrimary()
                          ),
                          IconButton(onPressed: (){
                            setState((){
                              custom = true;
                            });
                          }, icon: Icon(
                            custom?Icons.radio_button_checked_sharp:Icons.radio_button_unchecked,
                            color: AppColor().colorPrimary(),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Card(
                      margin: EdgeInsets.all(2.w),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              changeColor(Colors.red);
                            },
                            title: text("Font Color",
                                textColor:
                                AppColor().colorTextPrimary(),
                                fontSize: 12.sp,
                                fontFamily: fontMedium),
                            trailing: Container(
                              width: 10.w,
                              height: 10.w,
                              decoration: boxDecoration(
                                  radius: 100,
                                  bgColor: selectedColor),
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
                            title: text("Font Size",
                                textColor:
                                AppColor().colorTextPrimary(),
                                fontSize: 12.sp,
                                fontFamily: fontMedium),
                          ),
                          Slider(
                              min: 10.sp,
                              max: 50.sp,
                              value: fontSize,
                              onChanged: (value) {
                                setState(() {
                                  fontSize = value;
                                });
                              }),
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
                            title: text("Font Style",
                                textColor:
                                AppColor().colorTextPrimary(),
                                fontSize: 12.sp,
                                fontFamily: fontMedium),
                          ),
                          Wrap(
                            runSpacing: 8,
                            spacing: 8,
                            children: ["Regular","Medium","Bold"].map((e) {
                              int i = ["Regular","Medium","Bold"].indexWhere((element) => e ==element);
                              return InkWell(
                                onTap: (){
                                  setState((){
                                    if(i==0){
                                      fontWeight = FontWeight.w300;
                                    }
                                   else if(i==1){
                                      fontWeight = FontWeight.w600;
                                    }
                                   else if(i==2){
                                      fontWeight = FontWeight.w900;
                                    }
                                    print(i);
                                  });
                                },
                                child: Container(
                                  decoration: boxDecoration(
                                    showShadow: true,
                                    radius: 5,
                                  ),
                                  height: 5.h,
                                  width: 20.w,
                                  child: Center(
                                    child: text(
                                        e.toString(),
                                        textColor: AppColor().colorTextPrimary()
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
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
            )

         /*   Card(
              margin: EdgeInsets.all(2.w),
              child: Column(
                children: [
                  ListTile(
                    title: text("Font Family",
                        textColor:
                        AppColor().colorTextPrimary(),
                        fontSize: 12.sp,
                        fontFamily: fontMedium),
                  ),
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: [1,2,3,4,5].map((e) {
                      int i = [1,2,3,4,5].indexWhere((element) => e ==element);
                      return InkWell(
                        onTap: (){
                          setState((){
                            if(i==0){
                              fontFamily = "JosefinSans";
                            }
                            if(i==1){
                              fontFamily = "Piedra";
                            }
                            if(i==2){
                              fontFamily = "Roboto";
                            }
                            if(i==3){
                              fontFamily = "x360";
                            }
                            if(i==4){
                              fontFamily = "Droid";
                            }
                          });
                          print(fontFamily);
                        },
                        child: Container(
                          decoration: boxDecoration(
                            showShadow: true,
                            radius: 5,
                          ),
                          height: 5.h,
                          width: 5.h,
                          child: Center(
                            child: text(
                                e.toString(),
                                textColor: AppColor().colorTextPrimary(),
                              fontFamily: fontFamily
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 1.h,
                  )
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }

}
