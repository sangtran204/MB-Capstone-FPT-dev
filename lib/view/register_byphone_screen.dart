import 'package:flutter/material.dart';
// import 'package:mobile_capstone_fpt/widgets/widgets.dart';

class RegisterByPhoneScreen extends StatelessWidget {
  const RegisterByPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffcc33),
        // backgroundColor: Colors.grey.shade200,
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
                  Text(
                    'Đăng ký',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nhập số điện thoại để tiếp tục',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
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
                  //   text: 'Đăng ký',
                  //   path: '/verify',
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
