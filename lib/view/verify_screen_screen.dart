// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/components/components.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/view/register_info_screen.dart';
// import 'package:mobile_capstone_fpt/widgets/button_field.dart';
import 'package:mobile_capstone_fpt/widgets/pin_input_field.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:pinput/pinput.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key, required this.phone}) : super(key: key);
  final String phone;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String pin = "";
  String _verificationCode = '';
  int start = 30;
  bool wait = false;
  String buttomName = '';

  void inputPin(String p) {
    setState(() {
      pin = p;
    });
  }

  void startTime() {
    const onsec = Duration(seconds: 1);
    Timer.periodic(onsec, ((timer) {
      if (start == 0) {
        buttomName = 'Gửi lại';
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    }));
  }

  @override
  void initState() => {super.initState(), _verifyPhone(), startTime()};
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffffcc33),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        // color: Color(0xffffcc33),
        color: Colors.grey.shade200,
        // child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Xác nhận số điện thoại',
                    style: TextStyle(
                      color: Color(0xffffcc33),
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Nhập mã OTP được gửi về SMS',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PinPut(
                    input: inputPin,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Gửi lại OTP sau: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '00:$start' '  ',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                      UnderPart(
                          title: '',
                          navigatorText: buttomName,
                          onTap: () {
                            startTime();
                            setState(() {
                              start = 30;
                              wait = true;
                            });
                            _verifyPhone();
                          }),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  // mở comment button ở đây rồi để function vô
                  // ButtonField(voidCallback: voidCallback, text: 'Xác nhận')
                  FlatButton(
                    child: Container(
                      width: 220,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: const Center(
                        child: Text(
                          'Xác nhận',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      // print(pin);
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: _verificationCode,
                                smsCode: pin))
                            .then((value) async {
                          if (value.user != null) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterInfoScreen(
                                          phone: widget.phone,
                                        )),
                                (route) => (false));
                          }
                        });
                      } catch (e) {
                        FocusScope.of(context).unfocus();
                        showToastFail('OTP không hợp lệ');
                      }
                      // FirebaseAuth.instance.verifyPasswordResetCode(code)
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            // if (value.user != null) {
            //   Navigator.pushAndRemoveUntil(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const PasswordResetScreen()),
            //       (route) => (false));
            // }
          });
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationID, int? resendToken) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 30));
  }
}
