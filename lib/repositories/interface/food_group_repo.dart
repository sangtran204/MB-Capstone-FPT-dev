import 'package:mobile_capstone_fpt/models/response/food_group.res.dart';

abstract class FoodGroupRepo {
  Future<FoodGroupDetailRes> getFoodGroupDetail(String url, String token);
}
