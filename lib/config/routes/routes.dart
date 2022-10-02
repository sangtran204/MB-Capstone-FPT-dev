import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/view/home/home_screen.dart';
import 'package:mobile_capstone_fpt/view/login/login2.dart';
import 'package:mobile_capstone_fpt/view/login/login_screen.dart';
import 'package:mobile_capstone_fpt/view/protect/protect_routing.dart';
import 'package:mobile_capstone_fpt/view/register/input_info_screen.dart';
import 'package:mobile_capstone_fpt/view/register/input_password.dart';
import 'package:mobile_capstone_fpt/view/register/register_byphone.dart';
import 'package:mobile_capstone_fpt/view/register/verify.dart';
import 'package:mobile_capstone_fpt/view/reset_password/reset_byPhone.dart';
import 'package:mobile_capstone_fpt/view/reset_password/screens_reset.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    // "/SignInPage" : (context) => const SignInPage()
    // "/": (context) => const ProtectRouting(),
    '/': (context) => LoginScreen(),
    '/home': (context) => HomeScreen(),
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
