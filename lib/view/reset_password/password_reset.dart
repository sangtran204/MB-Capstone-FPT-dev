import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/widgets/button_field.dart';
import 'package:mobile_capstone_fpt/widgets/text_input.dart';
import 'package:mobile_capstone_fpt/widgets/widgets.dart';

class InputPasswordResetScreen extends StatelessWidget {
  const InputPasswordResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffcc33),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        // color: Color(0xffffcc33),
        color: Colors.grey.shade200,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nhập mật khẩu',
                      style: TextStyle(
                        color: Color(0xffffcc33),
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // PasswordInputField(hintText: 'Mật khẩu mới'),
                    SizedBox(
                      height: 20,
                    ),
                    // PasswordInputField(
                      // hintText: 'Nhập lại mật khẩu mới',
                    // )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    // ButtonField(
                    //   text: 'Xác nhận',
                    //   path: '/login',
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// PreferredSizeWidget appBar() {
//   return AppBar(
//     backgroundColor: Color(0xffffcc33),
//     // title: Container(child: Text('Notification')),
//   );
// }
