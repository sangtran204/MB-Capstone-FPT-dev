import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/components/custom_button.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:provider/provider.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({Key? key}) : super(key: key);

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
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
                '${packageProvider.packageDetail.result!.price} VNĐ',
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
                child: Text(
                  "Chọn gói",
                  style: textTheme.headline6!.copyWith(
                    color: kblackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  packageProvider.getPackageDetail(
                      context, packageProvider.packageDetail.result!.id);
                  Navigator.pushNamed(context, '/order');
                },
                backGroundColor: kBackgroundColor,
              ),
            )
          ],
        ),
      ),
      body: packageProvider.packageDetail.result == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: size.height,
              width: size.width,
              // color: Colors.amber,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: size.width,
                                child: Stack(
                                  children: [
                                    // Image(
                                    // image: NetworkImage(packageProvider
                                    //     .packageDetail.result!.image),

                                    // fit: BoxFit.fill,
                                    // ),
                                    Image.network(
                                      packageProvider
                                          .packageDetail.result!.image,
                                      fit: BoxFit.fill,
                                    ),
                                    Positioned(
                                        bottom: 5,
                                        left: 20,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffffcc33),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                // 'Gói ăn chay',
                                                packageProvider
                                                    .packageDetail.result!.name,
                                                style: TextStyle(
                                                    fontSize: 26,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                // textAlign: TextAlignVertical.center,
                                              ),
                                            )))
                                  ],
                                )),
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: aBackgroundColor,
                                  boxShadow: [
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
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // height: 20,
                                      width: size.width,
                                      child: const Text(
                                        'Chi tiết gói ăn:',
                                        // packageProvider.packageDetail.result!.description,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // textInfo('Gói 2 bữa Sáng - Trưa'),
                                          textInfo(packageProvider
                                              .packageDetail.result!.name),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          textInfo('Thời gian bán: Từ ' +
                                              packageProvider.packageDetail
                                                  .result!.startSale
                                                  .toString()
                                                  .substring(0, 10) +
                                              ' đến ' +
                                              packageProvider
                                                  .packageDetail.result!.endSale
                                                  .toString()
                                                  .substring(0, 10)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          textInfo(
                                              'Món ăn: ${packageProvider.packageDetail.result!.totalFood}'),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          textInfo('Mô tả: ' +
                                              packageProvider.packageDetail
                                                  .result!.description)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Món ăn có thể mua',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: size.height * 0.6,
                              width: size.width,
                              // color: Colors.green,

                              child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    padding: EdgeInsets.all(10),
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    children: [
                                      foodItem(),
                                      foodItem(),
                                      foodItem(),
                                      foodItem(),
                                      foodItem(),
                                    ],
                                  )),
                            ),
                          ],
                        )),
                      )),
                ],
              ),
            ),
    ));
  }
}

Widget foodItem() => Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(
              0.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/salad1.jpg'),
            height: 130,
          ),
          Text(
            'Salad rau trộn',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
Widget textInfo(String text) => Text(
      text,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black87),
    );
