import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile_capstone_fpt/components/custom_button.dart';
import 'package:mobile_capstone_fpt/config/provider/food_group_provider.dart';
// import 'package:mobile_capstone_fpt/config/provider/food_group_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
// import 'package:mobile_capstone_fpt/config/provider/time_slot_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/entity/food.dart';

import 'package:mobile_capstone_fpt/models/entity/package_detail.dart';
import 'package:mobile_capstone_fpt/models/entity/package_item.dart';
import 'package:mobile_capstone_fpt/models/entity/station.dart';
import 'package:mobile_capstone_fpt/models/entity/time_slot.dart';
import 'package:mobile_capstone_fpt/repositories/implement/station_impl.dart';
import 'package:mobile_capstone_fpt/repositories/implement/time_slot_impl.dart';
import 'package:mobile_capstone_fpt/view/schedule/card_food.dart';
// import 'package:mobile_capstone_fpt/view/detailPackage/package_detail_screen.dart';
// import 'package:mobile_capstone_fpt/models/entity/package_item.dart';
// import 'package:mobile_capstone_fpt/models/entity/time_slot.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key, this.packageDetail}) : super(key: key);
  final PackageDetail? packageDetail;

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<Station> listStationActive = [];
  Station? selectedStation;
  Food? selectFood;
  List<TimeSlot>? listTimeSlot = [];
  // Map<String, Station> listStationActive = Map<String, Station>();
// use for dropdowButton 1
  String _value = '0';
  // use for dropdowButton 2
  // String _value1 = '1';
  // use for dropdowButton 3
  // String _value2 = '2';
  // use for dropdowButton 4
  // String _value3 = '3';
  // int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    final SecureStorage secureStorage = SecureStorage();
    secureStorage.readSecureData("token").then((token) => {
          StationRepoImpl()
              .getStationActive(RestApi.getStationActive, token)
              .then((value) {
            setState(() {
              listStationActive = value.result!;
            });
          }),
          TimeSlotRepoImpl()
              .getTimeSlot(RestApi.getTimeSlot, token)
              .then((value) {
            setState(() {
              listTimeSlot = value.result;
            });
          })
        });
  }

  DropdownButton<Station> getListStation() {
    return DropdownButton(
        items: listStationActive.map((Station station) {
          return DropdownMenuItem<Station>(
            child: Text(
              station.name,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        onChanged: (Station? newStation) {
          setState(() {
            selectedStation = newStation!;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    FoodGroupProvider foodGroupProvider =
        Provider.of<FoodGroupProvider>(context);

    List<PackageItem> listPackageItem = [];
    
    List<int> code = [];
    List<String> listIdFG = [];
    for (int j = 0;
        j < packageProvider.packageDetail!.packageItem.length;
        j++) {
      listPackageItem.add(packageProvider.packageDetail!.packageItem[j]);
    }

    for (int item = 0; item < listPackageItem.length; item++) {
      code.add(listPackageItem[item].itemCode);
      listIdFG.add(listPackageItem[item].foodGroup!.id);
    }
    code.sort();

    String nameOfItem(int itemCode) {
      if (itemCode > 18 || itemCode < 1) return "Invalid";
      const name = [
        "Sáng thứ 2",
        "Trưa thứ 2",
        "Chiều thứ 2",
        "Sáng thứ 3",
        "Trưa thứ 3",
        "Chiều thứ 3",
        "Sáng thứ 4",
        "Trưa thứ 4",
        "Chiều thứ 4",
        "Sáng thứ 5",
        "Trưa thứ 5",
        "Chiều thứ 5",
        "Sáng thứ 6",
        "Trưa thứ 6",
        "Chiều thứ 6",
        "Sáng thứ 7",
        "Trưa thứ 7",
        "Chiều thứ 7",
      ];
      return name[--itemCode];
    }

    Future _showMaterialDialog(idFGhihi) async {
      try {
        // foodGroupProvider.resetFoodGroup();
        await foodGroupProvider.getFoodGroupDetail(context, idFGhihi);

        if (foodGroupProvider.listFoodFG!.isNotEmpty) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Chọn 1 món'),
                  content: SizedBox(
                      height: size.height,
                      width: size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: foodGroupProvider.listFoodFG!.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              child: CardFood(
                                  food: foodGroupProvider.listFoodFG![index]),
                              onTap: () {
                                setState(() {
                                  selectFood =
                                      foodGroupProvider.listFoodFG![index];
                                });
                                Navigator.pop(context);
                                print("Food Choice: " +
                                    foodGroupProvider.listFoodFG![index].name);
                              },
                            );
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

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: kBackgroundColor,
              leading: BackButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/HomePage", (route) => false);
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
                      child: Text(
                        "Xác nhận",
                        style: textTheme.headline6!.copyWith(
                          color: kblackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/ConfirmOrder');
                      },
                      backGroundColor: kBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
                child: code.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: size.height,
                        width: size.width,
                        child: ListView.builder(
                            itemCount: code.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 4)
                                    ]),
                                child: SizedBox(
                                  height: 160,
                                  child: Row(children: <Widget>[
                                    Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 150,
                                          width: 50,
                                          child: Text(
                                            nameOfItem(code[index]),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Column(
                                            children: [
                                              const Align(
                                                child: Text(
                                                  'Món ăn',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                alignment: Alignment.topCenter,
                                              ),
                                              SizedBox(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                        height: 90,
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 8,
                                                                left: 8),
                                                        child: Column(
                                                          children: [
                                                            const SizedBox(
                                                              height: 5,
                                                            ),
                                                            selectFood == null
                                                                ? const SizedBox(
                                                                    child:
                                                                        Image(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    height: 45,
                                                                    width: 45,
                                                                    image: AssetImage(
                                                                        'assets/images/salad1.jpg'),
                                                                  ))
                                                                // Text(
                                                                //   'Tên món ăn',
                                                                //   textAlign:
                                                                //       TextAlign
                                                                //           .center,
                                                                //   style: TextStyle(
                                                                //     fontSize: 16,
                                                                //     fontWeight:
                                                                //         FontWeight
                                                                //             .bold,
                                                                //     color:
                                                                //         Colors.grey,
                                                                //   ),
                                                                // )
                                                                :
                                                                // SizedBox(
                                                                //     child:
                                                                //         Image(
                                                                //     fit: BoxFit
                                                                //         .cover,
                                                                //     height: 45,
                                                                //     width: 45,
                                                                //     image: AssetImage(
                                                                //         'assets/images/salad1.jpg'),
                                                                //   )),
                                                                Text(
                                                                    selectFood!
                                                                        .name,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  )
                                                          ],
                                                        )),
                                                    Container(
                                                      // height: 45,
                                                      // width: 100,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          // Align(
                                                          //   alignment: Alignment
                                                          //       .bottomRight,
                                                          //   child: Container(
                                                          //     height: 30,
                                                          //     width: 30,
                                                          //     color:
                                                          //         Colors.amber,
                                                          //     child: IconButton(
                                                          //       onPressed: () {
                                                          //         print('edit');
                                                          //       },
                                                          //       icon: const Icon(
                                                          //           Icons
                                                          //               .edit_note_outlined),
                                                          //       color: Colors
                                                          //           .black,
                                                          //       iconSize: 15,
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                          // const SizedBox(
                                                          //   width: 10,
                                                          // ),
                                                          Align(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child: Container(
                                                              height: 30,
                                                              width: 30,
                                                              color:
                                                                  Colors.amber,
                                                              child: IconButton(
                                                                onPressed: () async {
                                                                  await _showMaterialDialog(
                                                                      listIdFG[
                                                                          index]);
                                                                },
                                                                icon: const Icon(
                                                                    Icons.add),
                                                                color: Colors
                                                                    .black,
                                                                iconSize: 15,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          'Thời gian giao Hàng',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                        listTimeSlot!.isEmpty
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : DropdownButton(
                                                underline: Container(
                                                    decoration:
                                                        const ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(),
                                                            color:
                                                                Colors.amber)),
                                                value: _value,
                                                icon: const Icon(
                                                    Icons.arrow_drop_down),
                                                items: const <
                                                    DropdownMenuItem<String>>[
                                                  DropdownMenuItem(
                                                    child:
                                                        Text('7:30 - 8:00 AM'),
                                                    value: '0',
                                                  ),
                                                  DropdownMenuItem(
                                                    child:
                                                        Text('7:30 - 8:00 AM'),
                                                    value: '1',
                                                  ),
                                                ],
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _value = newValue!;
                                                  });
                                                },
                                              ),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        listStationActive.isEmpty
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : const Text("Station")
                                        // DropdownButton<Station>(
                                        //     items: listStationActive
                                        //         .map((Station station) {
                                        //       return DropdownMenuItem<
                                        //           Station>(
                                        //         child: Text(
                                        //           station.name,
                                        //           style: const TextStyle(
                                        //               color: Colors.black),
                                        //         ),
                                        //       );
                                        //     }).toList(),
                                        //     onChanged:
                                        //         (Station? newStation) {
                                        //       setState(() {
                                        //         selectedStation =
                                        //             newStation!;
                                        //       });
                                        //     })
                                        // DropdownButtonHideUnderline(
                                        //     child: getListStation())
                                        // DropdownButton<Station>(
                                        //     // value: _value1,
                                        //     icon: const Icon(
                                        //         Icons.arrow_drop_down),
                                        //     items: listStationActive
                                        //         .map((Station? station) {
                                        //       return DropdownMenuItem<
                                        //           Station>(
                                        //         child: Text(station.name),
                                        //         value: station,
                                        //       );
                                        //     }),
                                        //     onChanged: (String? newValue) {
                                        //       setState(() {
                                        //         _value1 = newValue!;
                                        //       });
                                        //     },
                                        //   ),
                                      ],
                                    ),
                                  ]),
                                ),
                              );
                            }))
                // Container(
                //   width: double.infinity,
                //   color: Colors.white,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Sơ lược:',
                //         style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.black,
                //             fontWeight: FontWeight.bold),
                //       ),
                //       Text(
                //         'Số món đã chọn:',
                //         style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.grey.shade700,
                //             fontWeight: FontWeight.w500),
                //       ),
                //     ],
                //   ),
                // ),
                // ],
                // ),
                // )
                )));
  }
}
