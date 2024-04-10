import 'dart:convert';
import 'dart:io';
// import 'package:cabira/utils/ApiBaseHelper.dart';
// import 'package:cabira/utils/common.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
// import 'Session.dart';
import 'constant.dart';


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
FirebaseMessaging messaging = FirebaseMessaging.instance;

Future<void> backgroundMessage(RemoteMessage message) async {
  print(message);

}
String fcmToken = "";

class PushNotificationService {
  late BuildContext context;

  PushNotificationService({required this.context});

  Future initialise() async {
    iOSPermission();
    // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    messaging.getToken().then((token) async {
      fcmToken = token.toString();
      print("fcmToken---"+fcmToken);
    });
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =  AndroidInitializationSettings('ic_launcher');

    // final IOSInitializationSettings initializationSettingsIOS =  const IOSInitializationSettings(
    //     requestAlertPermission: true,
    //     requestBadgePermission: true,
    //     requestSoundPermission: true,
    //     onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    // final MacOSInitializationSettings initializationSettingsMacOS = const MacOSInitializationSettings();

    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: null,
        macOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      print("0k Push Notification======"+message.notification.toString());
      var data = message.notification!;

      var title = data.title.toString();
      print("cehed===="+title.toString());
      var body = data.body.toString();
      var image = message.data['image'] ?? '';
      print("check"+body);
      var type = message.data['type'] ?? '';
      var id = '';
      id = message.data['type_id'] ?? '';
      if (image != null && image != 'null' && image != '') {
        print('working here');
        // generateSimpleNotication(title, body, type, id);
        generateImageNotication(title, body, image, type, id);
      } else {
        generateSimpleNotication(title, body, type, id);
      }
     /* if (type == "ticket_status") {

      } else if (type == "ticket_message") {

          if (image != null && image != 'null' && image != '') {
            generateImageNotication(title, body, image, type, id);
          } else {
            generateSimpleNotication(title, body, type, id);
          }
      } else if (image != null && image != 'null' && image != '') {
        generateImageNotication(title, body, image, type, id);
      } else {
        generateSimpleNotication(title, body, type, id);
      }*/
    });

    messaging.getInitialMessage().then((RemoteMessage? message) async {
      await Future.delayed(Duration.zero);
    });

    FirebaseMessaging.onBackgroundMessage(backgroundMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

    });
  }

  void iOSPermission() async {
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}

Future<dynamic> myForgroundMessageHandler(RemoteMessage message) async {
  // return Future<void>.value();
}
// Future<dynamic> myForgroundMessageHandler(RemoteMessage message) async {
//   print("mesaaageeee ${message}");
//   // setPrefrenceBool(ISFROMBACK, true);
//
//   return Future<void>.value();
// }

Future<String> _downloadAndSaveImage(String url, String fileName) async {
  var directory = await getApplicationDocumentsDirectory();
  var filePath = '${directory.path}/$fileName';
  var response = await http.get(Uri.parse(url));

  var file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return filePath;
}

Future<void> generateImageNotication(
    String title, String msg, String image, String type, String id) async {
  var largeIconPath = await _downloadAndSaveImage(image, 'largeIcon');
  var bigPicturePath = await _downloadAndSaveImage(image, 'bigPicture');
  var bigPictureStyleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      hideExpandedLargeIcon: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
      summaryText: msg,
      htmlFormatSummaryText: true);
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'high_importance_channel', 'big text channel name',
      channelDescription: 'big text channel description',
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      styleInformation: bigPictureStyleInformation);
  var platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  // await flutterLocalNotificationsPlugin
  //     .show(0, title, msg, platformChannelSpecifics, payload: type + "," + id);
}

Future<void> generateSimpleNotication(
    String title, String msg, String type, String id) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'high_importance_channel', 'High Importance Notifications',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker');

  // var iosDetail = IOSNotificationDetails();

  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics, iOS: null);
  await flutterLocalNotificationsPlugin
      .show(0, title, msg, platformChannelSpecifics, payload: type + "," + id);


  // const AndroidNotificationDetails androidNotificationDetails =
  // AndroidNotificationDetails(
  //     'high_importance_channel',
  //     'High Importance Notifications',
  //     channelDescription: 'your channel description',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     ticker: 'ticker');
  // print('working 2');
  // const NotificationDetails notificationDetails =
  // NotificationDetails(android: androidNotificationDetails);
  // print('this is check $type and $id');
  // await flutterLocalNotificationsPlugin.show(
  //     0, title, msg, notificationDetails,
  //      payload: type + "," + id
  // );
}
