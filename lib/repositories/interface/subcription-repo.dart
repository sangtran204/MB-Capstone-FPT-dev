import 'package:mobile_capstone_fpt/repositories/response/subscription_respone.dart';

abstract class SubscriptionRepo {
  Future<SubscriptionResponeModel> getSubByStatus(String url, String token);
}
