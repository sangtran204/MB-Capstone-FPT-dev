import 'package:mobile_capstone_fpt/models/entity/order.dart';
import 'package:mobile_capstone_fpt/models/request/create_order_req.dart';

abstract class OrderRepo {
  Future<String> postOrder(String url, Order req, String token);
}
