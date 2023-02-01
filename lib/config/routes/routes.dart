import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/view/screens.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const ProtectRouting(),
    '/LoginPage': (context) => const LoginScreen(),
    '/HomePage': (context) => const HomeScreen(),
    '/Profile': (context) => const ProfileScreen(),
    '/History': (context) => const HistoryScreen(),

    '/PackageDetail': (context) => const PackageDetailScreen(),
    '/ChoicePage': (context) => const ChoiceScreen(),
    '/SchedulePage': (context) => const ScheduleScreen(),
    '/SubTracking': (context) => const SubDetailTrackingScreen(),
    '/RegisterPage': (context) => const RegisterByPhoneScreen(),
    '/ResetPassword': (context) => const ResetPasswordByPhone(),

    '/PasswordReset': (context) => const InputPasswordResetScreen(),
  };
}
