import 'dart:ui';

import 'package:flutter/material.dart';

Map<int, Color> color ={
  50:Color(0xff0000FF)
};
MaterialColor colorCustom = MaterialColor(0xFF880E4F, color);
class AppColor {
  static const Color PrimaryDark = Color(0xffFD531F);
  Color colorPrimary() {
    return Color(0xffFFDE03);
      //  AppColor().colorPrimary(),;
  }

  Color colorPrimaryDark() {
    return Color(0xffFFDE03);
  }

  Color colorBg1() {
    return Color(0xffFFFFFF);
  }

  Color colorBg2() {
    return Color(0xffFFFFFF);
  }

  Color colorEdit() {
    return Color(0xffEEF1F9);
  }

  Color colorTextPrimary() {
    return Color(0xff2A2A2A);
  }

  Color colorTextSecondary() {
    return Color(0xff909194);
  }

  Color colorTextThird() {
    return Color(0xffF13839);
  }
  Color colorTextAni() {
    return Color(0xff0000FF);
  }

  Color colorTextFour() {
    return Color(0xff2A2A2A);
  }

  Color colorIcon() {
    return Color(0xffF13839);
  }

  Color colorView() {
    return Color(0xff554747);
  }
}
