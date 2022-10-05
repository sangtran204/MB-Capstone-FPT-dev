import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/view/screens.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    // "/SignInPage" : (context) => const SignInPage()
    // "/": (context) => const ProtectRouting(),
    '/': (context) => LoginScreen(),
    '/home': (context) => HomeScreen(),
    '/packageDetail': (context) => PackageDetailScreen(),
    '/login': (context) => LoginScreen(),
    '/register': (context) => RegisterByPhoneScreen(),
    '/verify': (context) => VerifyScreen(),
    '/inputPassword': (context) => InputPasswordScreen(),
    '/info': (context) => InputInfoScreen(),
    '/resetPassword': (context) => ResetPasswordByPhone(),
    '/verifyReset': (context) => VerifyResetScreen(),
    '/passwordReset': (context) => InputPasswordResetScreen()
  };
}
