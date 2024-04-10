import 'package:digital_marketing/screen/bottom_bar.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/images.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:digital_marketing/utils/constant.dart';
import 'package:sizer/sizer.dart';

class MyappBarView extends StatelessWidget {
  String myTitle;
  bool status;
  bool from;
  Widget action = SizedBox();
  MyappBarView({required this.myTitle,required this.status,required this.action,this.from = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.96.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: AppColor().colorPrimary(),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25) , bottomRight: Radius.circular(25))
      ),
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //   image: AssetImage(homeFg),
      //   fit: BoxFit.fill,
      // )),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(status)
            Container(
                width: 6.38.w,
                height: 6.38.w,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 7.91.w),
                child: InkWell(
                    onTap: () {
                      if(from){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomBar()), (route) => false);
                      }else{
                        Navigator.pop(context);
                      }

                    },
                    child: Image.asset(
                      back,
                      height: 4.0.h,
                      width: 8.w,
                    ))),
            SizedBox(
              width: 2.08.h,
            ),
            Container(
              width: status?65.w:95.w,
              child: text(
                // "Payment",
                myTitle,
                textColor: Color(0xffffffff),
                fontSize: 14.5.sp,
                fontFamily: fontMedium,
                isCentered: true,
              ),
            ),
            action,
          ],
        ),
      ),
    );
  }
}
