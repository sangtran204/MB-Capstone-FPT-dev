import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/main_provider/main_provider.dart';
import 'package:mobile_capstone_fpt/config/routes/routes.dart';
import 'package:mobile_capstone_fpt/view/home/home.dart';
import 'package:mobile_capstone_fpt/view/login/screens.dart';
import 'package:mobile_capstone_fpt/view/register/input_password.dart';
import 'package:mobile_capstone_fpt/view/register/screens.register.dart';
import 'package:mobile_capstone_fpt/view/reset_password/screens_reset.dart';
import 'package:provider/provider.dart';

// Widget _defaultHome = const LoginScreen();
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: MainProviders.providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          // home: LoginScreen(),
          initialRoute: '/',
          routes: Routes.routes,
          // routes: {
          // '/': (context) => PackageDetailScreen(),
          // '/': (context) => LoginScreen(),
          // // '/': (context) => SelectFoodScreen(),
          // '/login': (context) => LoginScreen(),
          // '/register': (context) => RegisterByPhoneScreen(),
          // '/verify': (context) => VerifyScreen(),
          // '/inputPassword': (context) => InputPasswordScreen(),
          // '/info': (context) => InputInfoScreen(),
          // '/resetPassword': (context) => ResetPasswordByPhone(),
          // '/verifyReset': (context) => VerifyResetScreen(),
          // '/passwordReset': (context) => InputPasswordResetScreen()
          // },
        ));
  }
}
