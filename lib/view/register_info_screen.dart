// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/auth_provider.dart';
import 'package:mobile_capstone_fpt/config/toast.dart';
import 'package:mobile_capstone_fpt/widgets/date_input_field.dart';
import 'package:mobile_capstone_fpt/widgets/password_input_field.dart';
import 'package:mobile_capstone_fpt/widgets/text_input.dart';
import 'package:provider/provider.dart';

class RegisterInfoScreen extends StatefulWidget {
  const RegisterInfoScreen({Key? key, required this.phone}) : super(key: key);
  final String phone;

  @override
  State<RegisterInfoScreen> createState() => _RegisterInfoScreenState();
}

class _RegisterInfoScreenState extends State<RegisterInfoScreen> {
  String _fullName = '';
  String _email = '';
  String _password = '';
  String _confirm = '';
  String _dob = '';

  void inputFullName(String a) {
    setState(() {
      _fullName = a;
    });
  }

  void inputEmail(String b) {
    setState(() {
      _email = b;
    });
  }

  void inputPassword(String c) {
    setState(() {
      _password = c;
    });
  }

  void inputConfirm(String d) {
    setState(() {
      _confirm = d;
    });
  }

  void inputDOB(String e) {
    setState(() {
      _dob = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _phone = widget.phone.replaceAll('+84', '0');
    String formatEmail = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    String formatPassword =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    LoginProvider authProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffcc33),
        title: const Text('Thông tin người dùng'),
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Sẵn sàng với MeSup',
                      style: TextStyle(
                        color: Color(0xffffcc33),
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      'Vui lòng điền đầy đủ thông tin',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextInput(
                        hintText: 'Họ và Tên',
                        textCapitalization: TextCapitalization.words,
                        textValue: inputFullName),
                    const SizedBox(
                      height: 20,
                    ),
                    DateInputField(
                      input: inputDOB,
                      date: 'Ngày sinh',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextInput(
                      hintText: 'Email',
                      textCapitalization: TextCapitalization.sentences,
                      textValue: inputEmail,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInputField(
                        hintText: 'Mật khẩu', password: inputPassword),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInputField(
                        hintText: 'Nhập lại mật khẩu', password: inputConfirm)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    FlatButton(
                      child: Container(
                        width: 220,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: const Center(
                          child: Text(
                            'Đăng ký',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (_fullName.isEmpty) {
                          showToastFail('Vui lòng nhập họ tên');
                        } else if (_dob.isEmpty) {
                          showToastFail('Vui lòng ngày sinh');
                        } else if (_email.isEmpty ||
                            !RegExp(formatEmail).hasMatch(_email)) {
                          showToastFail('Emai không hợp lệ');
                        } else if (_password.isEmpty ||
                            !RegExp(formatPassword).hasMatch(_password)) {
                          showToastFail('Mật khẩu không hợp lệ');
                        } else if (_confirm.isEmpty || _confirm != _password) {
                          showToastFail('Mật khẩu không khớp');
                        } else {
                          authProvider.signUp(context, _phone, _fullName, _dob,
                              _email, _password);
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
      ),
    );
  }
}
