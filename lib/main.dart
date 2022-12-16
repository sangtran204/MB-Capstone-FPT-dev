import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobile_capstone_fpt/config/provider/main_provider/main_provider.dart';
import 'package:mobile_capstone_fpt/config/routes/routes.dart';
import 'package:mobile_capstone_fpt/firebase_options.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: MainProviders.providers,
//         child: MaterialApp(
//           title: 'Flutter Demo',
//           debugShowCheckedModeBanner: false,
//           initialRoute: '/',
//           routes: Routes.routes,
//         ));
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void initState() {
    getMessage(messaging);
    super.initState();
  }

  void getMessage(FirebaseMessaging messaging) async {
    // AppPreference re = AppPreference();
    // re.setToken(Label.token,
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImR1Y2hpZXUiLCJyb2xlIjoidG91cmlzdCIsImlhdCI6MTY2Mjc3NjUwNiwiZXhwIjoxNjYyODYyOTA2fQ.jQJO4t9KIEXUjHW8zQC_GUFAni4USOBxCn9X5RjIVCI');
    final future = messaging.getToken();
    String? deviceToken = await future;
    log(deviceToken.toString());

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
      // if (message.notification != null) {
      //   await NotificationService().flutterLocalNotificationsPlugin.show(
      //       notification.hashCode,
      //       notification.title,
      //       notification.body,
      //       platformChannelSpecifics,
      //       payload: jsonEncode(message.data));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: MainProviders.providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: Routes.routes,
        ));
  }
}
