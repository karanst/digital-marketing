import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/bottom_bar.dart';
import 'package:digital_marketing/screen/dashboard.dart';
import 'package:digital_marketing/screen/edit_post.dart';
import 'package:digital_marketing/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

Future<SharedPreferences> _pref = SharedPreferences.getInstance();
 late Future userId;
 late Future langId;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userId = _pref.then((SharedPreferences prefs) => prefs.getString('userId') ?? "");
    langId = _pref.then((SharedPreferences prefs) => prefs.getString('lang') ?? "2");
  }






  @override
  Widget build(BuildContext context) {
   var user = Provider.of<UserProvider>(context);
    return FutureBuilder(
        future: Future.wait([userId , langId]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data[0] != ""){
              user.userId = snapshot.data[0];
              user.langId = snapshot.data[1];
              // return BottomBar();
              return DashBoardPage();
              // return EditPostPage();
            }else{
              user.langId = snapshot.data[1];
              return LoginScreen();
            }
          } else if (snapshot.hasError) {
            return Icon(Icons.error_outline);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
