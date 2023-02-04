// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/phone_input_field.dart';

class RegisterByPhoneScreen extends StatefulWidget {
  const RegisterByPhoneScreen({Key? key}) : super(key: key);

  @override
  State<RegisterByPhoneScreen> createState() => _RegisterByPhoneScreenState();
}

class _RegisterByPhoneScreenState extends State<RegisterByPhoneScreen> {
  String phoneNumber = "";
  void inputPhone(String a) {
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
        // ignore: prefer_const_constructors
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
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Đăng ký',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Nhập số điện thoại để tiếp tục',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PhoneInputField(
                      input: inputPhone, hintText: 'Nhập số điện thoại')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  // Cái nút button nó nằm ở đây
                  // ButtonField(voidCallback: , text: 'Xác nhận')
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
                    onPressed: () {
                      // authProvider.checkExistPhone(context, phoneNumber);
                      // print(phoneNumber);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             VerifyScreen(phone: phoneNumber)));
                      // String _phone = phoneNumber.replaceAll('+84', '0');
                      // print(phoneNumber);
                      authProvider.checkExitPhone(context, phoneNumber);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
