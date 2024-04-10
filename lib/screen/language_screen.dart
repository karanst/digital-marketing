
import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:digital_marketing/utility_widget/myappbar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> langList = ["images/gujrati.png", "images/hindi.png","images/english.png","images/marathi.png"];
  List<String> nameList = ["ગુજરાતી\nGujarati","हिन्दी\nHindi","अंग्रेजी\nEnglish","मराठी\nMarathi"];
  late ScrollController controller = new ScrollController();
  int currentIndex=0;
  String? landId;

  _saveLanguage(lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', lang);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    changeStatusBarColor(AppColor().colorBg2());
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                    myTitle: "Languages",
                    status: true,
                    // action: Container(),
                    action:  InkWell(
                      onTap: (){
                        Navigator.pop(context, user.langId);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 1),
                        // decoration: boxDecoration(radius: 5.0,color:AppColor().colorBg1(),),
                        // color: AppColor().colorTextThird(),
                        child: text("Next",
                          textColor: AppColor().colorBg1(),
                          fontSize: 10.5.sp,
                          fontFamily: fontSemibold,),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.18.h,
                  ),
                  text("Choose all the languages in which\nyou want to get images",
                      fontSize: 11.5.sp,
                      fontFamily: fontBold,
                      textColor: AppColor().colorTextPrimary(),
                      isCentered: true
                  ),
                  SizedBox(
                    height: 1.18.h,
                  ),
                  FutureBuilder(
                      future: getLanguage(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data.data;
                          return snapshot.data.status ?
                            Container(
                            margin: EdgeInsets.only(left: 4.53.w, bottom: 1.87.h,right: 4.53.w),
                            child: GridView.count(
                              crossAxisCount: 2,
                              controller: controller,
                              childAspectRatio:1.2,
                              mainAxisSpacing: 2.0,
                              crossAxisSpacing: 2.0,
                              shrinkWrap: true,
                              children: data.map<Widget>((model){
                                int i = data.indexWhere((element) => element==model);
                                return InkWell(
                                  onTap: (){
                                    print(model.subCatId);
                                 setState(() {
                                   _saveLanguage(model.subCatId.toString());
                                   user.langId = model.subCatId.toString();
                                 });
                                  },
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 5.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: user.langId==model.subCatId ? AppColor().colorPrimary() : Colors.transparent),
                                      borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(model.subcatImg), fit: BoxFit.fill
                                        ),
                                    ),
                                    child: text(model.subcatName,
                                      fontSize: 10.5.sp,
                                      fontFamily: fontBold,
                                      textColor: AppColor().colorBg1(),
                                      isCentered : true,
                                    ),
                                    /*child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.sp),
                            child: Image.asset(model,
                                  height: 14.02.h,width: 14.02.h, fit: BoxFit.fill),
                          ),*/
                                  ),
                                );
                              }).toList(),
                            ),
                          ) : Text("Some thing went wrong");
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return CircularProgressIndicator();
                        }
                      }
                      )
                ],
              ),
            ),
          )),
    );
  }
}
