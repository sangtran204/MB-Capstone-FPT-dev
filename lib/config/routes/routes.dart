import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/view/protect/protect_routing.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    // "/SignInPage" : (context) => const SignInPage()
    "/": (context) => const ProtectRouting(),
  };
}
