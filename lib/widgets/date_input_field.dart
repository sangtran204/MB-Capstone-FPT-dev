import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({Key? key}) : super(key: key);

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  TextEditingController? _controller1;
  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';
  String _initialValue = '';

  @override
  void initState() {
    // Intl.defaultLocale = 'pt_BR';
    _initialValue = '2 - 01 - 2000';
    _controller1 = TextEditingController(text: DateTime.now().toString());
  }

  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _initialValue = '2000-10-22';
        _controller1!.text = '2000-09-20';
      });
    });
  }

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
        padding: const EdgeInsets.all(13.0),
        child: DateTimePicker(
          type: DateTimePickerType.date,
          dateMask: 'dd - MM - yyyy',
          controller: _controller1,
          // initialValue: _initialValue,
          firstDate: DateTime(1980),
          lastDate: DateTime(2080),
          icon: Icon(Icons.event),

          // dateLabelText: 'Date',
          //use24HourFormat: false,
          // locale: const Locale('pt', 'BR'),
          selectableDayPredicate: (date) {
            if (date.weekday == 6 || date.weekday == 7) {
              return false;
            }
            return true;
          },
          onChanged: (val) => setState(() => _valueChanged1 = val),
          validator: (val) {
            setState(() => _valueToValidate1 = val ?? '');
            return null;
          },
          onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
        ),
      ),
    );
  }
}
