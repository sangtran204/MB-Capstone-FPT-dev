import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/components/components.dart';
import 'package:mobile_capstone_fpt/constants.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/widgets/date_input_field.dart';
import 'package:mobile_capstone_fpt/widgets/phone_input_field.dart';
import 'package:mobile_capstone_fpt/widgets/text_input.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void input(String a) {
    String phoneNumber = "";
    setState(() {
      phoneNumber = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Thông tin',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            GestureDetector(
              child: Icon(
                Icons.check,
                size: 30,
              ),
              onTap: () {
                print('Save infomation');
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: kPrimaryLightColor,
        child: Stack(
          children: [
            // Positioned(
            Container(
              padding: EdgeInsets.only(top: 5, left: size.width - 50),
              height: 150,
              width: size.width,
              color: kBackgroundColor,
            ),
            Positioned(
                top: 100,
                left: size.width / 2 - 65,
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(100)),
                )),
            Padding(
              padding: EdgeInsets.only(top: 230),
              child: Container(
                height: size.height - 330,
                width: size.width,
                // color: kPrimaryLightColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    TextInput(
                        hintText: 'Tên',
                        textCapitalization: TextCapitalization.words),
                    SizedBox(
                      height: 15,
                    ),
                    PhoneInputField(input: input),
                    SizedBox(
                      height: 15,
                    ),
                    DateInputField(),
                    SizedBox(
                      height: 15,
                    ),
                    TextInput(
                        hintText: 'Email',
                        textCapitalization: TextCapitalization.words),
                  ],
                ),
              ),
            ),
            Positioned(
                top: size.height - 150,
                child: Container(
                  height: 100,
                  width: size.width,
                  child: Column(
                    children: [
                      InkWell(
                        child: Text(
                          'Đăng Xuất',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
