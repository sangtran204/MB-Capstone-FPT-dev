import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/view/screens.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    // '/': (context) => ConfirmOrderScreen(),
    
    '/': (context) => LoginScreen(),
    '/profile': (context) => ProfileScreen(),
    '/home': (context) => HomeScreen(),
    '/order': (context) => ScheduleScreen(),
    '/packageDetail': (context) => PackageDetailScreen(),
    '/selectFood': (context) => SelectFoodScreen(),
    '/confirm': (context) => ConfirmOrderScreen(),
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
