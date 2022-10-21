import 'package:flutter/cupertino.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/repositories/implement/food_group_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/response/food_group.res.dart';

class FoodGroupProvider with ChangeNotifier {
  final SecureStorage secureStorage = SecureStorage();

  FoodGroupDetailRes foodGroupDetail = FoodGroupDetailRes();
  void getFoodGroupDetail(BuildContext context, String id) async {
    String accessToken = await secureStorage.readSecureData("token");
    FoodGroupRepoImpl()
        .getFoodGroupDetail('${RestApi.getFoodGroupDetail}/$id', accessToken)
        .then((value) {
      foodGroupDetail = value;
      notifyListeners();
      // Navigator.pushReplacementNamed(context, '/packageDetail');
    });
  }
}
