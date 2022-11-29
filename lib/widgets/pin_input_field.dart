// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_capstone_fpt/widgets/phone_input_field.dart';
import 'package:pinput/pinput.dart';

class PinPut extends StatelessWidget {
  const PinPut({Key? key, required this.input}) : super(key: key);
  final StringVoidFunction input;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      // submittedPinTheme: submittedPinTheme,
      // validator: (s) {
      //   return s;
      // },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      // showCursor: true,
      onCompleted: (pin) => {input(pin)},
    );
  }
}
