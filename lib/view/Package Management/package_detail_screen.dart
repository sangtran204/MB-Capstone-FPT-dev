import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_capstone_fpt/components/custom_button.dart';
import 'package:mobile_capstone_fpt/config/provider/food_group_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/PackageItem/entity/package_item_detail.dart';
import 'package:mobile_capstone_fpt/view/screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:intl/intl.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({Key? key}) : super(key: key);
  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  final inputFormat = DateFormat('dd/MM/yyyy');
  final inputFormat2 = DateFormat('dd/MM');

  int sortDate(PackageItem a, PackageItem b) {
    final propertyA = a.deliveryDate!;
    final propertyB = b.deliveryDate!;
    return -propertyB.compareTo(propertyA);
  }

  String getMonthString(month) {
    switch (month) {
      case 'Monday':
        return '2';
      case 'Tuesday':
        return '3';
      case 'Wednesday':
        return '4';
      case 'Thursday':
        return '5';
      case 'Friday':
        return '6';
      case 'Saturday':
        return '7';
      case 'Sunday':
        return '8';

      default:
        return '0';
    }
  }

  String nameOfPa(int itemCode) {
    var name = '';
    if (itemCode == 0) {
      name = 'Sáng ';
    } else if (itemCode == 1) {
      name = 'Trưa ';
    } else {
      name = 'Chiều ';
    }
    return name;
  }

  Future _showDialoghihi(size, String indexOrderRequest) async {
    FoodGroupProvider foodGroupProvider =
        Provider.of<FoodGroupProvider>(context, listen: false);
    // PackageProvider packageProvider =
    //     Provider.of<PackageProvider>(context, listen: false);
    try {
      if (foodGroupProvider.listFoodFG.isNotEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Món ăn'),
                content: SizedBox(
                    height: 100,
                    width: size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: foodGroupProvider.listFoodFG.length,
                        itemBuilder: ((context, index) {
                          return CardFood(
                              food: foodGroupProvider.listFoodFG[index]);
                        }))),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Đóng')),
                  // TextButton(
                  //   onPressed: () {
                  //     print('Đã chọn món!');
                  //     Navigator.pop(context);
                  //   },
                  //   child: const Text('Lưu'),
                  // )
                ],
              );
            });
      }
    } catch (e) {
      log("Failed to load food");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    packageProvider.packageDetail!.packageItem.sort(sortDate);
    FoodGroupProvider foodGroupProvider =
        Provider.of<FoodGroupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: packageProvider.packageDetail == null
            ? const Text('Tên gói')
            : Text(
                packageProvider.packageDetail!.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
        leading: BackButton(
          onPressed: () async {
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
                  await Navigator.pushReplacementNamed(context, '/ChoicePage');
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
                                                "Gói " +
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
                                    Row(
                                      children: [
                                        const Text(
                                          "Gói bao gồm bữa: ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87),
                                        ),
                                        Text(
                                          packageProvider
                                                  .packageDetail!.packageItem
                                                  .where((element) =>
                                                      element.itemCode == 0)
                                                  .isNotEmpty
                                              ? 'SÁNG '
                                              : "",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black87),
                                        ),
                                        Text(
                                          packageProvider
                                                  .packageDetail!.packageItem
                                                  .where((element) =>
                                                      element.itemCode == 1)
                                                  .isNotEmpty
                                              ? 'TRƯA '
                                              : "",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black87),
                                        ),
                                        Text(
                                          packageProvider
                                                  .packageDetail!.packageItem
                                                  .where((element) =>
                                                      element.itemCode == 2)
                                                  .isNotEmpty
                                              ? 'CHIỀU'
                                              : "",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    packageProvider.packageDetail == null
                                        ? const Text('00:00')
                                        : Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Thời gian bán: ',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                              Text(
                                                  "Từ " +
                                                      inputFormat.format(
                                                          packageProvider
                                                              .packageDetail!
                                                              .startSale) +
                                                      ' đến ' +
                                                      inputFormat.format(
                                                          packageProvider
                                                              .packageDetail!
                                                              .endSale),
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
                                        ? const Text('Mô tả.')
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.15,
                                                child: const Text('Mô tả:',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87)),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.7,
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
                          // 'Các món ăn trong gói',
                          'Thực đơn',

                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),

                      DataTable(showCheckboxColumn: false, columns: const [
                        DataColumn(
                            label: Center(
                          child: Text(
                            'Ngày',
                            textAlign: TextAlign.center,
                          ),
                        )),
                        DataColumn(
                            label: Center(
                          child: Text(
                            'Nhóm món ăn',
                            textAlign: TextAlign.center,
                          ),
                        ))
                      ], rows: [
                        for (var i = 0;
                            i <
                                packageProvider
                                    .packageDetail!.packageItem.length;
                            i++)
                          DataRow(cells: [
                            DataCell(Text(
                                    nameOfPa(packageProvider.packageDetail!
                                            .packageItem[i].itemCode!) +
                                        inputFormat2.format(packageProvider
                                            .packageDetail!
                                            .packageItem[i]
                                            .deliveryDate!),
                                    style:
                                        const TextStyle(color: Colors.black87))
                                //   Column(
                                //   children: [
                                //     const SizedBox(
                                //       height: 6,
                                //     ),
                                //     Text(
                                //         nameOfPa(packageProvider.packageDetail!
                                //                 .packageItem[i].itemCode!) +
                                //             getMonthString(DateFormat('EEEE')
                                //                 .format(packageProvider
                                //                     .packageDetail!
                                //                     .packageItem[i]
                                //                     .deliveryDate!)),
                                //         style:
                                //             const TextStyle(color: Colors.black87)),
                                //     const SizedBox(
                                //       height: 6,
                                //     ),
                                //     Text(
                                //         inputFormat2.format(packageProvider
                                //             .packageDetail!
                                //             .packageItem[i]
                                //             .deliveryDate!),
                                //         style:
                                //             const TextStyle(color: Colors.black87))
                                //   ],
                                // )
                                ),
                            DataCell(Row(
                              children: [
                                Text(packageProvider.packageDetail!
                                    .packageItem[i].foodGroup!.name!),
                                IconButton(
                                    onPressed: () async {
                                      await foodGroupProvider
                                          .getFoodGroupDetail(
                                              context,
                                              packageProvider
                                                  .packageDetail!
                                                  .packageItem[i]
                                                  .foodGroup!
                                                  .id!);
                                      await _showDialoghihi(
                                          size,
                                          packageProvider
                                              .orderRequest[i].packageItemId!);
                                    },
                                    icon: const Icon(Icons.remove_red_eye))
                              ],
                            ))
                          ]),
                      ])
                      // SizedBox(
                      //   height: size.height * 0.35,
                      //   width: size.width,
                      //   child: Padding(
                      //       padding: const EdgeInsets.only(bottom: 20, top: 4),
                      //       child: GridView.builder(
                      //           gridDelegate:
                      //               const SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 2,
                      //           ),
                      //           itemCount:
                      //               packageProvider.listPackageFood.length,
                      //           itemBuilder: (BuildContext context, int index) {
                      //             return PackageFood(
                      //                 food: packageProvider
                      //                     .listPackageFood[index]);
                      //           })),
                      // ),
                    ],
                  )),
                )),
          ],
        ),
      ),
    );
  }
}
