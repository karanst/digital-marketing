import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier{
  var userId;
  var langId;
  var planStatus;
  void onChange(value){
    userId = value;
    langId = value;
    notifyListeners();
  }
}