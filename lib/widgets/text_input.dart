import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/widgets/phone_input_field.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.hintText,
    required this.textCapitalization,
    required this.textValue,
  }) : super(key: key);
  final String hintText;
  final TextCapitalization textCapitalization;
  final StringVoidFunction textValue;
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
          // obscureText: true,á
          onChanged: (value) {
            textValue(value);
          },
          style: TextStyle(color: Colors.black87, fontSize: 16),
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
              border: InputBorder.none,
              // prefixIcon: Icon(Icons.lock, color: Colors.grey.shade500),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500)),
        ));
  }
}
