import 'package:mobile_capstone_fpt/models/response/bank_res.dart';

abstract class BankRepo {
  Future<BankRes> getBank(String url);
}
