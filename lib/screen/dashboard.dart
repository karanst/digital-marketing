import 'package:digital_marketing/screen/category_screen.dart';
import 'package:digital_marketing/screen/home_screen.dart';
import 'package:digital_marketing/screen/logo_screen.dart';
import 'package:digital_marketing/screen/profile_screen.dart';
import 'package:digital_marketing/utils/PushNotificationService.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sizer/sizer.dart';

class DashBoardPage extends StatefulWidget {
  static final title = 'salomon_bottom_bar';

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  var _currentIndex = 0;

  List view = [
    HomeScreen(),
    CategoryScreen(selected: true),
    CategoryScreen(selected: false),
    ProfileScreen()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    //   alert: true, // Required to display a heads up notification
    //   badge: true,
    //   sound: true,
    // );
    // PushNotificationService notificationService =  PushNotificationService(context: context);
    // notificationService.initialise();
    //
    // FirebaseMessaging.onMessageOpenedApp.listen((myForgroundMessageHandler));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: view[_currentIndex],
      ),
      /* floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(
          Icons.add,
          size: 32.sp,
          color: Colors.white,
        ),
        backgroundColor: AppColor().colorPrimary(),
      ),*/
      bottomNavigationBar: SalomonBottomBar(
        curve: Curves.easeInCirc,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: ImageIcon(AssetImage(home)),
            title: Text("Home"),
            selectedColor: AppColor().colorPrimary(),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: ImageIcon(AssetImage(category)),
            title: Text("Category"),
            selectedColor: AppColor().colorPrimary(),
          ),
         /* SalomonBottomBarItem(
            icon: Icon(
              Icons.add,
              size: 32.sp,
            ),
            title: Text("Add Logo"),
            selectedColor: AppColor().colorPrimary(),
          ),
*/
          /// Search
          SalomonBottomBarItem(
            icon: ImageIcon(AssetImage(video)),
            title: Text("Video"),
            selectedColor: AppColor().colorPrimary(),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: ImageIcon(AssetImage(profile)),
            title: Text("Profile"),
            selectedColor: AppColor().colorPrimary(),
          ),
        ],
      ),
    );
  }
}
