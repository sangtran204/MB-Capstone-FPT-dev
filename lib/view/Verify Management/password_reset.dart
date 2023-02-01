import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/auth_provider.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/widgets/button_field.dart';
import 'package:mobile_capstone_fpt/widgets/password_input_field.dart';
import 'package:provider/provider.dart';

class InputPasswordResetScreen extends StatefulWidget {
  const InputPasswordResetScreen({Key? key}) : super(key: key);

  @override
  State<InputPasswordResetScreen> createState() =>
      _InputPasswordResetScreenState();
}

class _InputPasswordResetScreenState extends State<InputPasswordResetScreen> {
  String newPassword = '""';
  String confirm = '';
  void inputPassword(String a) {
    setState(() {
      newPassword = a;
    });
  }

  void inputConfirm(String p) {
    setState(() {
      confirm = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginProvider authProvider = Provider.of<LoginProvider>(context);
    String formatPassword =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffcc33),
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
                padding: const EdgeInsets.all(0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Nhập mật khẩu',
                      style: TextStyle(
                        color: Color(0xffffcc33),
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInputField(
                      hintText: 'Mật khẩu mới',
                      password: inputPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInputField(
                      hintText: 'Nhập lại mật khẩu mới',
                      password: inputConfirm,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    ButtonField(
                      text: 'Đổi mật khẩu',
                      voidCallback: () {
                        if (newPassword.isEmpty ||
                            !RegExp(formatPassword).hasMatch(newPassword)) {
                          showToastFail('Mật khẩu không hợp lệ!');
                        } else if (confirm.isEmpty || newPassword != confirm) {
                          showToastFail('Mật khẩu không khớp!');
                        } else {
                          authProvider.resetPassword(context, newPassword);
                        }
                      },
                    ),
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
