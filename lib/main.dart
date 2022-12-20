import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobile_capstone_fpt/config/provider/main_provider/main_provider.dart';
import 'package:mobile_capstone_fpt/config/routes/routes.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/firebase_options.dart';
import 'package:mobile_capstone_fpt/notification_service.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, name: "hahahahaha");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SecureStorage secureStorage = SecureStorage();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  @override
  void initState() {
    getMessage(messaging, context);
    NotificationService.abc(selectNotification);
    super.initState();
  }

  void selectNotification(String? payload) {
    //Handle notification tapped logic here
    // if (payload != null) {
    //   debugPrint('notification payload: $payload');
    //   // Here you can check notification payload and redirect user to the respective screen
    //   Map tmp = jsonDecode(payload);
    //   // log('-----------${tmp.keys.first}');
    //   if (tmp.keys.first == 'idOrder') {
    //     ref.watch(orderProvider).getOrderTourByid(tmp[tmp.keys.first], context);
    //   } else {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const ProtectRouting()),
    //     );
    //   }
    // }
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
