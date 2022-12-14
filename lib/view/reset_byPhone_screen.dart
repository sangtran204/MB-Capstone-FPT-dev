// ignore: file_names
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/auth_provider.dart';
import 'package:mobile_capstone_fpt/widgets/phone_input_field.dart';
import 'package:provider/provider.dart';

class ResetPasswordByPhone extends StatefulWidget {
  const ResetPasswordByPhone({Key? key}) : super(key: key);

  @override
  State<ResetPasswordByPhone> createState() => _ResetPasswordByPhoneState();
}

class _ResetPasswordByPhoneState extends State<ResetPasswordByPhone> {
  String phoneNumber = "";
  void input(String a) {
    setState(() {
      phoneNumber = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginProvider authProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffcc33),
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
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Nhập số điện thoại để tiếp tục',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Mã xác nhận sẽ được gửi tới số điện thoại này',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PhoneInputField(
                    hintText: 'Số điện thoại',
                    input: input,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FlatButton(
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
                onPressed: () {
                  authProvider.checkExistPhoneReset(context, phoneNumber);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
