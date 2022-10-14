import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/view/screens.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    // "/" : (context) => const ScheduleScreen(),
    // '/': (context) => SelectFoodScreen(),
    '/': (context) => LoginScreen(),
    '/home': (context) => HomeScreen(),
    '/order': (context) => ScheduleScreen(),
    '/packageDetail': (context) => PackageDetailScreen(),
    '/selectFood': (context) => SelectFoodScreen(),
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
