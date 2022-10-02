import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';

void showToastSuccess(String mess) => Fluttertoast.showToast(
    msg: mess,
    backgroundColor: greenToast,
    gravity: ToastGravity.TOP_RIGHT,
    timeInSecForIosWeb: 3);
void showToastFail(String mess) => Fluttertoast.showToast(
    msg: mess,
    backgroundColor: redToast,
    gravity: ToastGravity.TOP_RIGHT,
    timeInSecForIosWeb: 3);
