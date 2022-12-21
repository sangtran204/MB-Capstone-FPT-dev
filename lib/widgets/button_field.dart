// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:mobile_capstone_fpt/constants.dart';

class ButtonField extends StatelessWidget {
  const ButtonField({Key? key, required this.voidCallback, required this.text})
      : super(key: key);
  final String text;
  // String path;
  final Function voidCallback;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(context),
      ),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(color: Colors.black87, fontSize: 17),
      ),
      onPressed: () {
        voidCallback();
        // Navigator.pushNamed(context, path);
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: const TextStyle(
              letterSpacing: 1,
              // color: kBodyTextColor,
              // shadows: Shadow.lerp(a, b, t),
              fontSize: 14,
              fontWeight: FontWeight.w900,
              fontFamily: 'OpenSans')),
    );
  }
}
