
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'colors.dart';

class Common{
  toast(String msg){
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: AppColor().colorPrimary(),
        textColor: AppColor().colorBg1(),
        fontSize: 12,
    );
  }
}