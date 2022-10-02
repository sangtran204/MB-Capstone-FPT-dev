import 'package:flutter/cupertino.dart';

class FoodDTO {
  late String name;
  late bool value;

  FoodDTO({
    required this.name,
    this.value = false,
  });
}
