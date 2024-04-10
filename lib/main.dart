
import 'package:digital_marketing/provider/user_provider.dart';
import 'package:digital_marketing/screen/splash_screen.dart';
import 'package:digital_marketing/utils/PushNotificationService.dart';
import 'package:digital_marketing/utils/colors.dart';
import 'package:digital_marketing/utils/widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';



Future<void> main() async {
/*  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.transparent, // navigation bar color
    // statusBarColor: Colors.transparent,
    //   systemNavigationBarIconBrightness:Brightness.dark
    // status bar color
  ));*/
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  changeStatusBarColor(AppColor().colorPrimary());
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async { //to run async code in initState
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
      //enables secure mode for app, disables screenshot, screen recording
    });
  }
  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => UserProvider())
            ],
            child: MaterialApp(
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaleFactor: 1),
                    child: child!);
              },
              title: 'Posterdaily&BusinessPost Maker',
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              themeMode: ThemeMode.light,
              initialRoute: "/",
              home: SplashScreen(),
            ),
          );
        });
  }
}
