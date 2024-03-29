import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/Subscription/response/sub_detail_res.dart';
import 'package:mobile_capstone_fpt/view/screens.dart';
import 'package:provider/provider.dart';

class SubDetailTrackingScreen extends StatefulWidget {
  const SubDetailTrackingScreen({Key? key}) : super(key: key);

  @override
  State<SubDetailTrackingScreen> createState() =>
      _SubDetailTrackingScreenState();
}

class _SubDetailTrackingScreenState extends State<SubDetailTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    SubscriptionProvider subProvider =
        Provider.of<SubscriptionProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text('Theo dõi đơn hàng'),
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/History', (route) => false);
            // Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.description_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Các đơn hàng:',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                )
              ],
            ),
            for (int i = 0;
                i < subProvider.subDetail.result!.orders!.length;
                i++)
              order(context, subProvider.subDetail.result!.orders![i]),
            const SizedBox(
              height: 15,
            ),
            if (subProvider.subDetail.result!.orders!.last.status == 'arrived')
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedbackScreen(
                                  packageId:
                                      '${subProvider.subDetail.result!.id}',
                                )));
                  },
                  style: ElevatedButton.styleFrom(primary: kBackgroundColor),
                  child: Container(
                    // color: kBackgroundColor,
                    // margin: const EdgeInsets.only(top: 15, bottom: 15),
                    height: 45,
                    width: 150,
                    child: const Center(
                      child: Text(
                        'Đánh giá',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    ));
  }

  Widget order(BuildContext context, Order order) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 115,
      width: double.infinity,
      color: Colors.white,
      // padding: const EdgeInsets.all(10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // for (var i = 0;
              //     i < order.packageItem!.foodGroup!.foods!.length;
              //     i++)
              Container(
                height: 115,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    // borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                        // image: AssetImage('assets/images/packageitem.jpg'),
                        image: NetworkImage(
                            '${order.packageItem!.foodGroup!.foods![0].image}'),
                        fit: BoxFit.fill)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 6),
                padding: EdgeInsets.only(
                    left: size.width * 0.02, right: size.width * 0.02),
                width: size.width * 0.53,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Món ăn: ${order.packageItem!.foodGroup!.foods![0].name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '- ${order.packageItem!.foodGroup!.foods![0].description}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          // color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '- Ngày nhận: ${order.packageItem!.deliveryDate!.toIso8601String().substring(0, 10)}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          // color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    // Text(
                    //   'Điểm nhận: ${order.station?.name}',
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //       // color: Colors.white,
                    //       fontStyle: FontStyle.italic,
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w400),
                    // ),
                    // Text(
                    //   'Thời gian nhận: ${order.timeSlot?.startTime.toString().substring(0, 5)} - ${order.timeSlot?.endTime.toString().substring(0, 5)}',
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //       overflow: TextOverflow.ellipsis,
                    //       // color: Colors.white,
                    //       fontStyle: FontStyle.italic,
                    //       fontSize: 14,
                    //       fontWeight: FontWeight.w400),
                    // ),
                  ],
                ),
              ),
              if (order.status == 'progress' ||
                  order.status == 'ready' ||
                  order.status == 'pending')
                SizedBox(
                  width: size.width * 0.17,
                  child: const Center(
                    child: Text(
                      'Chờ giao',
                      style: TextStyle(
                          color: kBackgroundColor,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              else if (order.status == 'delivery')
                SizedBox(
                  width: size.width * 0.17,
                  child: const Center(
                    child: Text(
                      'Đang giao',
                      style: TextStyle(
                          color: kBackgroundColor,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              else if (order.status == 'arrived')
                SizedBox(
                  width: size.width * 0.17,
                  child: const Center(
                    child: Text(
                      'Đã giao',
                      style: TextStyle(
                          color: Colors.green,
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
