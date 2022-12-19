import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';

void showToastSuccess(String mess) => Fluttertoast.showToast(
    msg: mess,
    backgroundColor: greenToast,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 3);
void showToastFail(String mess) => Fluttertoast.showToast(
    msg: mess,
    backgroundColor: redToast,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 3);


void showMotionToastWarning(BuildContext context) => MotionToast.warning(
      title: const Text(
        'Warning Motion Toast',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      position: MotionToastPosition.bottom,
      description: const Text('This is a Warning'),
      // animationCurve: Curves.bounceIn,
      borderRadius: 10,
      // animationDuration: const Duration(milliseconds: 700),
    ).show(context);

void showMotionToastError(String title, String mess, BuildContext context) =>
    MotionToast.error(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      position: MotionToastPosition.top,
      description: Text(mess),
      // animationCurve: Curves.easeInOutBack,
      borderRadius: 10,
      // animationDuration: const Duration(milliseconds: 600),
    ).show(context);
