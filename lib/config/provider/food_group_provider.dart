import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/models/Food/entity/food.dart';
import 'package:mobile_capstone_fpt/repositories/implement/food_group_repo_impl.dart';

class FoodGroupProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();
  List<Food> listFoodFG = [];

  Future<void> getFoodGroupDetail(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    final value = await FoodGroupRepoImpl()
        .getFoodGroupDetail('${RestApi.getFoodGroupDetail}/$id', accessToken);
    listFoodFG = value.result!.foods!;
    notifyListeners();
  }
}
