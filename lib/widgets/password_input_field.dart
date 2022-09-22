import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_capstone_fpt/constants.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({Key? key, required this.hintText})
      : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 58,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black.withOpacity(0.13)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: TextField(
          obscureText: true,
          style: TextStyle(color: Colors.black87, fontSize: 16),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.lock, color: Colors.grey.shade500),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500)),
        ));
    // return TextFieldContainer(
    //   child: TextFormField(
    //     obscureText: true,
    //     cursorColor: kPrimaryColor,
    //     decoration: const InputDecoration(
    //         icon: Icon(
    //           Icons.lock,
    //           color: kPrimaryColor,
    //         ),
    //         hintText: "Password",
    //         hintStyle: TextStyle(fontFamily: 'OpenSans'),
    //         suffixIcon: Icon(
    //           Icons.visibility,
    //           color: kPrimaryColor,
    //         ),
    //         border: InputBorder.none),
    //   ),
    // );
  }
}
