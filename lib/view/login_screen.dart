import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mobile_capstone_fpt/components/components.dart';
import 'package:mobile_capstone_fpt/config/provider/login_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/repositories/request/login_request_model.dart';
import 'package:mobile_capstone_fpt/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = "";
  String password = "";
  void input(String a) {
    print('-----------');
    print(a);
    setState(() {
      phoneNumber = a;
    });
  }

  void inputPassword(String p) {
    setState(() {
      password = p;
    });
    print('--------------');
    print(p);
  }

  void buttomFuction() {
    print('+++++++');
  }

  // String checkPhone(String phoneNumber) {
  //   String checkPhone = '';
  //   if (phoneNumber.startsWith('+84')) {
  //     checkPhone = phoneNumber.replaceAll('+84', '');
  //   }
  //   return checkPhone;

  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    String check;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          width: size.width,
          height: size.height,
          // color: Color(0xffffcc33),
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const Upside(
                  imgUrl: 'assets/images/logo6.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220.0),
                  child: Text(
                    'MeSup',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 38,
                        shadows: [
                          BoxShadow(color: Colors.orange, blurRadius: 40)
                        ],
                        letterSpacing: 9,
                        fontWeight: FontWeight.w900,
                        color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PhoneInputField(input: input),
                            const SizedBox(
                              height: 15,
                            ),
                            PasswordInputField(
                                hintText: 'Mật khẩu', password: inputPassword),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonField(
                                text: 'Đăng Nhập',
                                voidCallback: () {
                                  loginProvider.submitData(
                                      context,
                                      phoneNumber.replaceAll('+84', ''),
                                      password);
                                }),
                            const SizedBox(
                              height: 25,
                            ),
                            UnderPart(
                                title: 'Bạn chưa có tài khoản?  ',
                                navigatorText: 'Đăng ký',
                                onTap: () {
                                  // print('Đăng ký');
                                  Navigator.pushNamed(context, '/register');
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            UnderPart(
                                title: '',
                                navigatorText: 'Quên mật khẩu!',
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/resetPassword');
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
