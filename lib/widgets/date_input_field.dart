import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/widgets/phone_input_field.dart';

class DateInputField extends StatelessWidget {
  DateInputField({Key? key, required this.date, required this.input})
      : super(key: key);
  String? date;
  StringVoidFunction input;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.13)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 15),
        child: DateTimePicker(
          type: DateTimePickerType.date,
          dateMask: 'dd-MM-yyyy',
          firstDate: DateTime(1980),
          lastDate: DateTime(2080),
          decoration: InputDecoration(
            hintText: date,
            border: InputBorder.none,
            icon: const Icon(Icons.event),
          ),
          selectableDayPredicate: (date) {
            if (date.weekday == 6 || date.weekday == 7) {
              return false;
            }
            return true;
          },
          onChanged: (val) {
            input(val);
          },
        ),
      ),
    );
  }
}
