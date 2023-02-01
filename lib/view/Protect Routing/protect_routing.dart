import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';

class ProtectRouting extends StatefulWidget {
  const ProtectRouting({Key? key}) : super(key: key);

  @override
  _ProtectRoutingState createState() => _ProtectRoutingState();
}

class _ProtectRoutingState extends State<ProtectRouting> {
  final SecureStorage secureStorage = SecureStorage();
  String token = "";
  @override
  void initState() {
    _startApp();
    super.initState();
  }

  Future<void> _startApp() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: "token");
    if (token == null) {
      Timer(const Duration(seconds: 2), (() {
        Navigator.pushReplacementNamed(context, "/LoginPage");
      }));
      // Navigator.pushReplacementNamed(context, "/LoginPage");
    } else {
      Timer(const Duration(seconds: 2), (() {
        Navigator.pushReplacementNamed(context, "/HomePage");
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              top: -30,
              left: size.width * 0.7,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            Positioned(
              top: size.height * 0.75,
              right: size.width * 0.4,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(300)),
              ),
            ),
            SizedBox(
              height: size.height * 0.8,
              width: size.width,
              // color: Colors.lightBlue,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // height: size.height * 0.4,
                      width: size.width * 0.7,
                      // color: Colors.lightGreen,
                      child: Image.asset('assets/images/logo6.png'),
                    ),
                    // const SizedBox(
                    //   height: ,
                    // ),
                    const SizedBox(
                      child: Text(
                        'Meal Subscription Plan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28,
                            shadows: [
                              BoxShadow(color: Colors.orange, blurRadius: 40)
                            ],
                            letterSpacing: 2,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
