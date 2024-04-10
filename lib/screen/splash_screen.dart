import 'package:animated_widgets/animated_widgets.dart';
import 'package:digital_marketing/landing_page.dart';
import 'package:digital_marketing/utils/PushNotificationService.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:digital_marketing/screen/login_screen.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController phoneController = new TextEditingController();
  bool status = false;
  bool selected = false, enabled = false, edit = false;

  notiPermission() async{
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    notiPermission();
    PushNotificationService notificationService =  PushNotificationService(context: context);
    notificationService.initialise();

    Future.delayed(Duration(milliseconds: 500),(){
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );
      // FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);


      FirebaseMessaging.onBackgroundMessage(backgroundMessage);
    });

    changePage();
  }
  void _handleMessage(RemoteMessage message) {
    print(message);

  }

  changePage() async {
    await Future.delayed(Duration(milliseconds: 4500));
    Navigator.pushReplacement(context, PageTransition(child: LandingPage(), type: PageTransitionType.rightToLeft,duration: Duration(milliseconds: 500),));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              width: 100.w,
              alignment: status ? Alignment.topCenter : Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: 22.89.h,
                  ),
                  Container(
                      // height: double.infinity,
                      // width: double.infinity,
                      child: Image.asset("images/splash.gif",
                          gaplessPlayback: true,
                          fit: BoxFit.fill,
                        scale: 1.4,
                      )
                  ),
                  // Image.asset(
                  //   "images/logo.png",
                  //   scale: 2,
                  // ),
                  SizedBox(
                    height: 18.18.h,
                  ),
                  Container(
                    height: 9.31.h,
                    width: 100.w,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(flag), fit: BoxFit.fill)),
                    child:
                    text(
                      "MADE IN INDIA",
                      fontSize: 15.sp,
                      fontFamily: fontBold,
                      textColor: AppColor().colorIcon(),
                    ),
                  ),

                  SizedBox(
                    height: 6.18.h,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
