import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

typedef StringVoidFunction = void Function(String);

class PhoneInputField extends StatelessWidget {
  PhoneInputField({Key? key, required this.input}) : super(key: key);
  StringVoidFunction input;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
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
      child: Stack(
        children: [
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              input(number.phoneNumber!);
            },
            // onInputValidated: (bool value) {
            //   print(value);
            // },
            selectorConfig: SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              showFlags: true,
              setSelectorButtonAsPrefixIcon: false,
            ),
            countrySelectorScrollControlled: false,
            countries: ['VN'],
            initialValue: PhoneNumber(isoCode: 'VN', dialCode: ''),
            ignoreBlank: false,
            locale: '',
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyle(color: Colors.black),
            formatInput: false,
            maxLength: 10,
            inputDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 15, left: 0),
              border: InputBorder.none,
              hintText: 'Số điện thoại',
              hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
              // errorText: 'Số không hợp lệ!'
            ),
            errorMessage: 'Số không hợp lệ!',
          ),
          Positioned(
            left: 90,
            top: 8,
            bottom: 8,
            child: Container(
              height: 40,
              width: 1,
              color: Colors.black.withOpacity(0.23),
            ),
          ),
        ],
      ),
    );
  }
}
