import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:mobile_capstone_fpt/constants.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';

class Upside extends StatelessWidget {
  const Upside({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
            width: size.width,
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: aBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                imgUrl,
                alignment: Alignment.topCenter,
                scale: 2,
                height: 400,
                width: 400,
              ),
            )),
      ],
    );
  }
}
