import 'package:mobile_capstone_fpt/models/Order/entity/order.dart';

abstract class OrderRepo {
  Future<String> postOrder(String url, Order req, String token);
}
