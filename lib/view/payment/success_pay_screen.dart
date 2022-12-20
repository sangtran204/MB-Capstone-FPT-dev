import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:provider/provider.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

// ignore: must_be_immutable
class SuccessPayScreen extends StatefulWidget {
  SuccessPayScreen({Key? key, this.maDonHang}) : super(key: key);
  String? maDonHang;
  @override
  State<SuccessPayScreen> createState() => _SuccessPayScreenState();
}

class _SuccessPayScreenState extends State<SuccessPayScreen> {
  @override
  Widget build(BuildContext context) {
    SubscriptionProvider subscriptionProvider =
        Provider.of<SubscriptionProvider>(context);
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    final SecureStorage secureStorage = SecureStorage();
    DateTime timeNow = DateTime.now();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: kPrimaryLightColor,
          child: Stack(
            children: [
              Positioned(
                  top: 90,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.only(top: 50),
                    height: 400,
                    width: size.width - 30,
                    decoration: BoxDecoration(
                        // color: Colors.lightBlue.shade50,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Thanh toán thành công',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          subscriptionProvider.subByID.result!.totalPrice
                              .toString()
                              .toVND(),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Tên gói',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      subscriptionProvider
                                          .subByID.result!.packages!.name
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.grey))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text('Thời gian',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(timeNow.toString().substring(0, 16),
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.grey))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Mã đơn hàng',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('${widget.maDonHang}',
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.grey))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              String subId = await secureStorage
                                  .readSecureData("idSubscription");
                              await secureStorage.deleteSecureData(subId);
                              await packageProvider.clearBackPackage();
                              await packageProvider.clearBackPayment();

                              Navigator.pushReplacementNamed(
                                  context, '/HomePage');
                            },
                            style: ElevatedButton.styleFrom(
                                primary: kBackgroundColor),
                            child: const SizedBox(
                              // color: kBackgroundColor,
                              // margin: const EdgeInsets.only(top: 15, bottom: 15),
                              height: 45,
                              width: 150,
                              child: Center(
                                child: Text(
                                  'Màn hình chính',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )),
              Positioned(
                top: 50,
                left: size.width / 2 - 40,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kBackgroundColor,
                  ),
                  child: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
