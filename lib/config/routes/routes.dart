import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/view/choicePage/choice_screen.dart';
import 'package:mobile_capstone_fpt/view/protect/protect_routing.dart';
import 'package:mobile_capstone_fpt/view/screens.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    //Login
    '/LoginPage': (context) => LoginScreen(),
    //Home
    '/HomePage': (context) => const HomeScreen(),

    '/Profile': (context) => const ProfileScreen(),

    '/History': (context) => const HistoryScreen(),

    '/PackageDetail': (context) => const PackageDetailScreen(),
    // '/order': (context) => const ScheduleScreen(),
    '/ChoicePage': (context) => const ChoiceScreen(),
    '/SchedulePage': (context) => const ScheduleScreen(),

    // '/PaymentPage': (context) => const PaymentPage(),

    '/ConfirmOrder': (context) => const ConfirmOrderScreen(),
    // '/register': (context) => const RegisterByPhoneScreen(),
    '/RegisterPage': (context) => const RegisterByPhoneScreen(),
    // '/verify': (context) => const VerifyScreen(),
    // '/inputPassword': (context) => const InputPasswordScreen(),
    // '/info': (context) => const InputInfoScreen(),
    // '/resetPassword': (context) => const ResetPasswordByPhone(),
    // '/verifyReset': (context) => const VerifyResetScreen(),
    // '/passwordReset': (context) => const InputPasswordResetScreen(),
    // '/SuccessPay': (context) => const SuccessPayScreen(),
    '/': (context) => const ProtectRouting(),
    // '/': (context) => const SuccessPayScreen(),
  };
}
