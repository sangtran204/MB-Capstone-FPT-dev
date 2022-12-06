import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/components/custom_button.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/view/detailPackage/package_food.dart';
import 'package:provider/provider.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({Key? key}) : super(key: key);
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
          onPressed: () async {
            // Navigator.pop(context);
            await packageProvider.clearBackPackage();
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
              child: packageProvider.packageDetail?.price == null
                  ? const Text('0 VNĐ')
                  : Text(
                      packageProvider.packageDetail!.price.toString().toVND(),
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
                      context,
                      packageProvider.packageDetail!.price,
                      DateTime.now(),
                      packageProvider.packageDetail!.id);
                  // await Navigator.pushReplacementNamed(
                  //     context, '/SchedulePage');
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
                bottom: 0,
                child: Container(
                  height: size.height,
                  width: size.width,
                  color: aBackgroundColor,
                  child: SingleChildScrollView(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: size.width,
                          height: 200,
                          child: Stack(
                            children: [
                              packageProvider.packageDetail == null
                                  ? Image.asset(
                                      'assets/images/image-default.png')
                                  : Image.network(
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
                                        child: packageProvider.packageDetail ==
                                                null
                                            ? const Text('Tên gói')
                                            : Text(
                                                packageProvider
                                                    .packageDetail!.name,
                                                style: const TextStyle(
                                                    fontSize: 26,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                      )))
                            ],
                          )),
                      Container(
                        width: size.width,
                        // height: size.height * ,
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
                                    // packageProvider.packageDetail == null
                                    //     ? const Text('Tên gói')
                                    //     : Text(
                                    //         packageProvider.packageDetail!.name,
                                    //         style: const TextStyle(
                                    //             fontSize: 16,
                                    //             fontWeight: FontWeight.w300,
                                    //             color: Colors.black87)),
                                    packageProvider.packageDetail == null
                                        ? const Text('00:00')
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Thời gian bán: ',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              Text(
                                                  packageProvider.packageDetail!
                                                          .startSale
                                                          .toString()
                                                          .substring(5, 10) +
                                                      ' --> ' +
                                                      packageProvider
                                                          .packageDetail!
                                                          .endSale
                                                          .toString()
                                                          .substring(5, 10),
                                                  style: const TextStyle(
                                                      // fontSize: 16,
                                                      // fontWeight:
                                                      //     FontWeight.w300,
                                                      color: Colors.black87)),
                                            ],
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    packageProvider.packageDetail == null
                                        ? const Text('0')
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Số món được mua:',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              Text(
                                                  '${packageProvider.packageDetail!.totalFood}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      // fontWeight:
                                                      //     FontWeight.w300,
                                                      color: Colors.black87)),
                                            ],
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    packageProvider.packageDetail == null
                                        ? const Text('Mô tả.')
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text('Mô tả:',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              SizedBox(
                                                width: 270,
                                                child: Text(
                                                    packageProvider
                                                        .packageDetail!
                                                        .description,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        // fontWeight:
                                                        //     FontWeight.w300,
                                                        color: Colors.black87)),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Các món ăn trong gói',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.35,
                        width: size.width,
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 4),
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount:
                                    packageProvider.listPackageFood.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return PackageFood(
                                      food: packageProvider
                                          .listPackageFood[index]);
                                })),
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
