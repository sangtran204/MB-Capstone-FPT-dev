// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:pinput/pinput.dart';

class PinPut extends StatelessWidget {
  const PinPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    // final submittedPinTheme = defaultPinTheme.copyWith(
    //   decoration: BoxDecoration(
    //     color: Color.fromRGBO(234, 239, 243, 1),
    //   ),
    // );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      // submittedPinTheme: submittedPinTheme,
      // validator: (s) {
      //   return s;
      // },
      // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      // showCursor: true,
      onCompleted: (pin) => {print(pin)},
    );
  }
}
