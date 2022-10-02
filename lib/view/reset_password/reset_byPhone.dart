import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/widgets/widgets.dart';

class ResetPasswordByPhone extends StatelessWidget {
  const ResetPasswordByPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffcc33),
      ),
      body: Container(
        width: size.width,
        // height: size.height,
        // color: Color(0xffffcc33),
        color: Colors.grey.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nhập số điện thoại để tiếp tục',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Mã xác nhận sẽ được gửi tới số điện thoại này',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // PhoneInputField(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  // ButtonField(
                  //   text: 'Tiếp tục',
                  //   path: '/verifyReset',
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
