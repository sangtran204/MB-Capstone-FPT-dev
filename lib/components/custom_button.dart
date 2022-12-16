import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';

class CustomButton extends StatelessWidget {
  final Color? borderColor;
  final Color? backGroundColor;
  final Widget child;
  final Function onTap;
  const CustomButton(
      {Key? key,
      this.backGroundColor,
      this.borderColor,
      required this.child,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Material(
        color: backGroundColor ?? kwhiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
          onTap: () {
            onTap();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor ?? Colors.transparent,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
