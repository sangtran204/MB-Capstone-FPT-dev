import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/components/components.dart';
// import 'package:mobile_capstone_fpt/widgets/button_field.dart';
import 'package:mobile_capstone_fpt/widgets/pin_input_field.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:pinput/pinput.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Xác nhận số điện thoại',
                    style: TextStyle(
                      color: Color(0xffffcc33),
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nhập mã OTP được gửi về SMS',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PinPut(),
                  SizedBox(
                    height: 20,
                  ),
                  UnderPart(
                      title: 'Chưa nhận được OTP?   ',
                      navigatorText: 'Gửi lại',
                      onTap: () {
                        print('hi OTP');
                      })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  // ButtonField(path: '/inputPassword', text: 'Xác nhận')
                ],
              ),
            )
          ],
        ),
      ),
      // ),
    );
  }
}
