import 'package:digital_marketing/screen/category_screen.dart';
import 'package:digital_marketing/screen/profile_screen.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> tabList = [HomeScreen(), CategoryScreen(),CategoryScreen(), ProfileScreen()];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor().colorBg2(),
        body: HomeScreen(),
        bottomNavigationBar: Container(
          height: 11.00.h,
          decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow:  [BoxShadow(color: AppColor().colorView().withOpacity(0.3), blurRadius: 4, spreadRadius: 1)],

          ),
          child: Padding(
            padding: EdgeInsets.only(left: 6.0.w, right: 6.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                tabItem(context, 0, home, "Home"),
                tabItem(context, 1, category, "Categories"),
                tabItem(context, 2, video, "Video"),
                tabItem(context, 3, profile, "My Account"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabItem(BuildContext context, var pos, var icon, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = pos;
        });
        if (pos == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoryScreen(selected: true,)));
        }
        if (pos == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategoryScreen(selected: false,)));
        }
        if (pos == 3) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        }
      },
      child: Container(
        width: 15.63.w,
        height: 6.79.h,
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              icon,
              width: 6.94.w,
              height: 3.90.h,
              color: selectedIndex == pos
                  ? AppColor().colorPrimaryDark()
                  : Color(0xff757575),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: selectedIndex == pos
                      ? AppColor().colorPrimaryDark()
                      : Color(0xff757575),
                  fontFamily: fontRegular,
                  fontSize: 8.sp),
            ),
          ],
        ),
      ),
    );
  }
}
