import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/components/custom_button.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/view/detailPackage/package_food.dart';
import 'package:provider/provider.dart';

class PackageDetailScreen extends StatefulWidget {
  // const PackageDetailScreen({Key? key, this.package}) : super(key: key);
  const PackageDetailScreen({Key? key}) : super(key: key);

  // final Package? package;
  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    SubscriptionProvider subscriptionProvider =
        Provider.of<SubscriptionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: BackButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, '/HomePage', (route) => false);
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: kwhiteColor, boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, -2),
          )
        ]),
        child: Row(
          children: [
            Expanded(
                child: CustomButton(
              child: Text(
                '${packageProvider.packageDetail!.price} VNĐ',
                style: textTheme.headline6!.copyWith(
                  color: kblackColor,
                ),
                textAlign: TextAlign.center,
              ),
              borderColor: kblackColor,
              onTap: () {
                // handlePopScreen(context);
              },
            )),
            Expanded(
              child: CustomButton(
                backGroundColor: kBackgroundColor,
                child: Text(
                  "Chọn gói",
                  style: textTheme.headline6!.copyWith(
                    color: kblackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () async {
                  subscriptionProvider.submitDataSub(
                      packageProvider.packageDetail!.price,
                      DateTime.now(),
                      packageProvider.packageDetail!.id);
                  await Navigator.pushReplacementNamed(
                      context, '/SchedulePage');
                },
              ),
            )
          ],
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                bottom: size.height * 0.08,
                child: Container(
                  height: size.height * 0.9,
                  width: size.width,
                  color: aBackgroundColor,
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size.width,
                          child: Stack(
                            children: [
                              Image.network(
                                  packageProvider.packageDetail!.image,
                                  width: size.width,
                                  fit: BoxFit.fill,
                                  height: 250),
                              Positioned(
                                  bottom: 5,
                                  left: 20,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: yellowColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          packageProvider.packageDetail!.name,
                                          style: const TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )))
                            ],
                          )),
                      Container(
                        width: size.width,
                        decoration:
                            BoxDecoration(color: aBackgroundColor, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(
                              0.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width,
                                child: const Text(
                                  'Chi tiết gói ăn:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(packageProvider.packageDetail!.name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black87)),
                                    Text(
                                        'Thời gian bán: Từ ' +
                                            packageProvider
                                                .packageDetail!.startSale
                                                .toString()
                                                .substring(0, 10) +
                                            ' đến ' +
                                            packageProvider
                                                .packageDetail!.endSale
                                                .toString()
                                                .substring(0, 10),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black87)),
                                    Text(
                                        'Món ăn: ${packageProvider.packageDetail!.totalFood}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black87)),
                                    Text(
                                        'Mô tả: ${packageProvider.packageDetail!.description}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black87)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Món ăn có thể mua',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.4,
                        width: size.width,
                        // color: Colors.green,

                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: GridView.count(
                              crossAxisCount: 2,
                              padding: const EdgeInsets.all(8),
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              children: const [
                                PackageFood(),
                                PackageFood(),
                                PackageFood(),
                              ],
                            )),
                      ),
                    ],
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
