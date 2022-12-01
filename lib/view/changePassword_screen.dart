import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/profile_provider.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/widgets/button_field.dart';
import 'package:mobile_capstone_fpt/widgets/password_input_field.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String oldPassword = "";
  String newPassword = "";
  String confirmPassword = "";

  void inputOldPassword(String a) {
    setState(() {
      oldPassword = a;
    });
  }

  void inputNewPassword(String b) {
    setState(() {
      newPassword = b;
    });
  }

  void inputConfirmPassword(String c) {
    setState(() {
      confirmPassword = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Đổi mật khẩu',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          backgroundColor: kBackgroundColor,
        ),
        // bottomNavigationBar: Container(
        //   decoration: BoxDecoration(color: kwhiteColor, boxShadow: [
        //     BoxShadow(
        //       color: const Color(0xFF000000).withOpacity(0.1),
        //       blurRadius: 2,
        //       offset: const Offset(0, -2),
        //     )
        //   ]),
        // child: ButtonField(voidCallback: voidCallback, text: 'Đổi mật khẩu'),
        // ),
        body: SingleChildScrollView(
            child: Center(
          // padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              PasswordInputField(
                  hintText: 'Mật khẩu cũ', password: inputOldPassword),
              const SizedBox(
                height: 10,
              ),
              PasswordInputField(
                  hintText: 'Mật khẩu mới', password: inputNewPassword),
              const SizedBox(
                height: 10,
              ),
              PasswordInputField(
                  hintText: 'Nhập lại mật khẩu',
                  password: inputConfirmPassword),
              SizedBox(
                height: 30,
              ),
              ButtonField(
                voidCallback: () {
                  if (newPassword != confirmPassword)
                    showToastFail('Không khớp mật khẩu');
                  if (newPassword == confirmPassword)
                    profileProvider.changePassword(
                        context, oldPassword, newPassword);
                },
                text: 'Đổi mật khẩu',
              )
            ],
          ),
        )),
      ),
    );
  }
}
