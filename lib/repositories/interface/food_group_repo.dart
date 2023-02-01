import 'package:mobile_capstone_fpt/models/FoodGroup/response/food_group.res.dart';

abstract class FoodGroupRepo {
  Future<FoodGroupDetailRes> getFoodGroupDetail(String url, String token);
}
