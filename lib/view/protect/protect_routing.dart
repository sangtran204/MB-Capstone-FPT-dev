import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';

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
      Navigator.pushReplacementNamed(context, "/LoginPage");
    } else {
      Navigator.pushReplacementNamed(context, "/HomePage");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splashscreen"),
      ),
    );
  }
}
