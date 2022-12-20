import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

typedef StringVoidFunc = void Function(String?);

class NotificationService {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final NotificationService _notificationService =
      NotificationService._internal();
  // get context
  StringVoidFunc? selectNotification;

  NotificationService.abc(StringVoidFunc fn) {
    selectNotification = fn;
    init();
  }

  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  Future<void> init() async {
    //[projectFolder]/android/app/src/main/res/drawable --- icon notification
    final AndroidInitializationSettings initializationSettingsAndroid =
        // ignore: prefer_const_constructors
        AndroidInitializationSettings('notification');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, macOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }
}

void getMessage(FirebaseMessaging messaging, BuildContext context) async {
  // AppPreference re = AppPreference();
  // re.setToken(Label.token,
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImR1Y2hpZXUiLCJyb2xlIjoidG91cmlzdCIsImlhdCI6MTY2Mjc3NjUwNiwiZXhwIjoxNjYyODYyOTA2fQ.jQJO4t9KIEXUjHW8zQC_GUFAni4USOBxCn9X5RjIVCI');
  final future = messaging.getToken();
  String? deviceToken = await future;
  log(deviceToken.toString());
  // AccountsDeviceTokenReq req = AccountsDeviceTokenReq(deviceToken: deviceToken);
  // AccountRepository().postAccountDeviceToken(req).catchError((error, stackTrace) {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: DialogType.ERROR,
  //     borderSide: BorderSide(
  //       color: AppColor.red,
  //       width: 2,
  //     ),
  //     width: MediaQuery.of(context).size.width,
  //     buttonsBorderRadius: const BorderRadius.all(
  //       Radius.circular(2),
  //     ),
  //     title: Label.errorLog,
  //     desc: error.response.data['message'].toUpperCase(),
  //     btnCancelOnPress: () {},
  //   ).show();
  // });
  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('Channel_id', 'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    RemoteNotification notification = message.notification!;
    // ignore: unused_local_variable
    AndroidNotification? android = message.notification!.android;
    if (message.notification != null) {
      await NotificationService().flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          platformChannelSpecifics,
          payload: jsonEncode(message.data));
    }
  });
  // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  // FirebaseMessaging.onMessageOpenedApp.listen((message) async {});
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   Navigator.pushNamed(
  //     context,
  //     '/login',
  //     // arguments: MessageArguments(message, true),
  //   );
  // });
}
