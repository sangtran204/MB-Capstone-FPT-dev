import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/response/sub_history_res.dart';
import 'package:mobile_capstone_fpt/view/feedback_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    SubscriptionProvider subProvider =
        Provider.of<SubscriptionProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Lịch sử',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/HomePage', (route) => false);
            // Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
              child: SizedBox(
            height: 70,
            width: size.width,
            // decoration: BoxDecoration(
            //     boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.5))]),
            // color: Colors.amberAccent,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: kBackgroundColor),
                    child: const Center(
                      child: Text(
                        "Đang đặt",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigator.pushNamed();
                    subProvider.getSubByStatus(context, 'inProgress');
                    // print('Sắp tới');
                    // const ExpenseList().launch(context);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: kBackgroundColor),
                    child: const Center(
                      child: Text(
                        "Đã đặt",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigator.pushNamed();
                    subProvider.getSubByStatus(context, 'done');
                    // print('đã đặt');
                    // const ExpenseList().launch(context);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                // GestureDetector(
                //   child: Container(
                //     height: 40,
                //     width: 110,
                //     decoration: const BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(100)),
                //         color: kBackgroundColor),
                //     child: const Center(
                //       child: Text(
                //         "Chưa thanh toán",
                //         overflow: TextOverflow.visible,
                //         style: TextStyle(
                //             fontSize: 16, fontWeight: FontWeight.bold),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
                //   onTap: () {
                //     // Navigator.pushNamed();
                //     subProvider.getSubByStatus(context, 'unConfirmed');
                //     // const ExpenseList().launch(context);
                //   },
                // ),
              ],
            ),
          )),
          Center(
            child: Container(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: subProvider.sub.result == null
                  ? Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Text(
                        'Không có đăng ký!',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int i = 0; i < subProvider.sub.result!.length; i++)
                          // OrderItems(subProvider.sub.result![i])
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacementNamed(
                              //     context, '/SubTracking');
                              subProvider.getSubDetail(
                                  context, subProvider.sub.result![i].id!);
                              print(subProvider
                                  .subDetail.result!.orders!.last.status);
                            },
                            child: OrderItems(
                                subProvider.sub.result![i].id!,
                                subProvider.sub.result![i].packageName!,
                                subProvider.sub.result![i].packageImg!,
                                subProvider.sub.result![i].startDelivery!,
                                subProvider.sub.result![i].status!,
                                subProvider.sub.result?[i].cancelDate,
                                subProvider.sub.result![i].totalPrice!),
                          )
                        // OrderItems(),
                        // OrderItems(),
                        // OrderItemPass()
                      ],
                    ),
            ),
          )
        ]),
      ),
    ));
  }

  // ignore: non_constant_identifier_names
  Widget OrderItems(String id, String packageName, String img,
          DateTime startDate, String status, String? cancelDate, int price) =>
      Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          height: 120,
          width: 380,
          child: Row(
            children: [
              Container(
                height: 120,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    image: DecorationImage(
                        // image: AssetImage('assets/images/packageitem.jpg'),
                        image: NetworkImage(img),
                        fit: BoxFit.fill)),
              ),
              Container(
                  height: 100,
                  width: 160,
                  padding: const EdgeInsets.only(top: 10, left: 3, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        packageName,
                        maxLines: 2,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        startDate.toString().substring(0, 10),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      if (status == 'unConfirmed')
                        const Text(
                          'Chưa thanh toán',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      if (status == 'inProgress')
                        const Text(
                          'Đang xữ lý',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      if (status == 'done')
                        const Text(
                          'Đã hoàn tất',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      price.toString().toVND(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget OrderItemPass() => Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          height: 90,
          width: 380,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/packageitem.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                  height: 100,
                  width: 170,
                  padding: const EdgeInsets.only(top: 10, left: 3, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Tên gói ăn',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '22-10-2022',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Gói ăn trải nghiệm',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(top: 20, left: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '200.000 đ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Đã giao hàng',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  Widget miniTab() => Card();
}
