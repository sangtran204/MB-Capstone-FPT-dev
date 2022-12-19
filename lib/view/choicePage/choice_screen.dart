import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:intl/intl.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/components/custom_button.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/entity/station.dart';
import 'package:mobile_capstone_fpt/models/entity/time_slot.dart';
import 'package:mobile_capstone_fpt/repositories/implement/station_impl.dart';
import 'package:mobile_capstone_fpt/repositories/implement/time_slot_impl.dart';
import 'package:provider/provider.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  List<TimeSlot> listTimeSlotS = [];
  List<TimeSlot> listTimeSlotT = [];
  List<TimeSlot> listTimeSlotC = [];

  List<Station> listStationActive = [];
  String? sChoice;
  String? tChoice;
  String? cChoice;
  String? stationChoice;
  String date = DateFormat('EEEE').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  final SecureStorage secureStorage = SecureStorage();
  _asyncMethod() async {
    final token = await secureStorage.readSecureData("token");
    final data1 = await StationRepoImpl()
        .getStationActive(RestApi.getStationActive, token);
    final data2 = await TimeSlotRepoImpl()
        .getTimeSlotByFlag('${RestApi.getTimeSlot}/0', token);
    final data3 = await TimeSlotRepoImpl()
        .getTimeSlotByFlag('${RestApi.getTimeSlot}/1', token);
    final data4 = await TimeSlotRepoImpl()
        .getTimeSlotByFlag('${RestApi.getTimeSlot}/2', token);
    setState(() {
      listStationActive = data1.result!;
      listTimeSlotS = data2.result!;
      listTimeSlotT = data3.result!;
      listTimeSlotC = data4.result!;
    });
  }

  DropdownButton<String> getListStationRandom() {
    PackageProvider packageProvider =
        Provider.of<PackageProvider>(context, listen: false);
    return DropdownButton<String>(
      value: stationChoice,
      icon: const Icon(
        Icons.arrow_downward,
        size: 18,
      ),
      elevation: 16,
      underline: Container(
        height: 2,
        color: kBackgroundColor,
      ),
      onChanged: (String? value) {
        setState(() {
          stationChoice = value!;
        });
        packageProvider.setTimeSlotAndStationRandom(value!, 'station');
      },
      items: listStationActive.map<DropdownMenuItem<String>>((Station value) {
        return DropdownMenuItem<String>(
          value: value.id,
          child: SizedBox(
            width: 160,
            child: Text(
              value.name,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );
      }).toList(),
    );
  }

  DropdownButton<String> getListTimeSlotS() {
    PackageProvider packageProvider =
        Provider.of<PackageProvider>(context, listen: false);
    return DropdownButton<String>(
      value: sChoice,
      icon: const Icon(
        Icons.arrow_downward,
        size: 18,
      ),
      // elevation: 1,
      style: const TextStyle(color: kblackColor),
      underline: Container(
        height: 2,
        color: kBackgroundColor,
      ),
      onChanged: (String? value) {
        setState(() {
          sChoice = value!;
        });
        packageProvider.setTimeSlotAndStationRandom(value!, 'timeSlotS');
      },
      items: listTimeSlotS.map<DropdownMenuItem<String>>((TimeSlot value) {
        return DropdownMenuItem<String>(
          value: value.id,
          child: SizedBox(
            width: 85,
            child: Text(value.startTime.substring(0, 5) +
                ' - ' +
                value.endTime.substring(0, 5)),
          ),
        );
      }).toList(),
    );
  }

  DropdownButton<String> getListTimeSlotT() {
    PackageProvider packageProvider =
        Provider.of<PackageProvider>(context, listen: false);
    return DropdownButton<String>(
      value: tChoice,
      icon: const Icon(
        Icons.arrow_downward,
        size: 18,
      ),
      // elevation: 1,
      style: const TextStyle(color: kblackColor),
      underline: Container(
        height: 2,
        color: kBackgroundColor,
      ),
      onChanged: (String? value) {
        setState(() {
          tChoice = value!;
        });
        packageProvider.setTimeSlotAndStationRandom(value!, 'timeSlotT');
      },
      items: listTimeSlotT.map<DropdownMenuItem<String>>((TimeSlot value) {
        return DropdownMenuItem<String>(
          value: value.id,
          child: SizedBox(
            width: 85,
            child: Text(value.startTime.substring(0, 5) +
                ' - ' +
                value.endTime.substring(0, 5)),
          ),
        );
      }).toList(),
    );
  }

  DropdownButton<String> getListTimeSlotC() {
    PackageProvider packageProvider =
        Provider.of<PackageProvider>(context, listen: false);
    return DropdownButton<String>(
      value: cChoice,
      icon: const Icon(
        Icons.arrow_downward,
        size: 18,
      ),
      // elevation: 1,
      style: const TextStyle(color: kblackColor),
      underline: Container(
        height: 2,
        color: kBackgroundColor,
      ),
      onChanged: (String? value) {
        setState(() {
          cChoice = value!;
        });
        packageProvider.setTimeSlotAndStationRandom(value!, 'timeSlotC');
      },
      items: listTimeSlotC.map<DropdownMenuItem<String>>((TimeSlot value) {
        return DropdownMenuItem<String>(
          value: value.id,
          child: SizedBox(
            width: 85,
            child: Text(value.startTime.substring(0, 5) +
                ' - ' +
                value.endTime.substring(0, 5)),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    PackageProvider packageProvider =
        Provider.of<PackageProvider>(context, listen: false);
    SubscriptionProvider subscriptionProvider =
        Provider.of<SubscriptionProvider>(context, listen: false);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Cài đặt mặc định'),
            backgroundColor: kBackgroundColor,
            leading: BackButton(
              onPressed: () async {
                // String subId =
                //     await secureStorage.readSecureData("idSubscription");
                // if (subId.isNotEmpty) {
                //   subscriptionProvider.deleteSub(context, subId);
                //   secureStorage.deleteSecureData(subId);
                // }
                await packageProvider.clearBackPackage();
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
                // SizedBox(
                // width: 200,
                // child:
                Expanded(
                    child: CustomButton(
                  backGroundColor: kBackgroundColor,
                  child: Text(
                    'Chọn ngẫu nhiên',
                    style: textTheme.bodyLarge!.copyWith(
                      color: kblackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  borderColor: kblackColor,
                  onTap: () async {
                    for (var i = 0;
                        i < packageProvider.orderRequest.length;
                        i++) {
                      await packageProvider.setFoodGroupRandom(
                          packageProvider.orderRequest[i].packageItemId!);
                    }
                    subscriptionProvider.submitDataSub(
                        context,
                        packageProvider.packageDetail!.price,
                        DateTime.now(),
                        packageProvider.packageDetail!.id);
                    // await Navigator.pushReplacementNamed(
                    //     context, '/SchedulePage');
                  },
                )),
                // ),
                Expanded(
                  child: CustomButton(
                    // backGroundColor: kBackgroundColor,
                    child: Text(
                      "Tùy chọn",
                      style: textTheme.bodyLarge!.copyWith(
                        color: kblackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    borderColor: kblackColor,
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
          body: Container(
            height: size.height,
            margin: const EdgeInsets.only(top: 16, right: 8, left: 8),
            // width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Chọn thời gian giao',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Typicons.cloud_sun,
                            color: kBackgroundColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Buổi sáng:',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      getListTimeSlotS()
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Typicons.sun,
                            color: kBackgroundColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Buổi trưa:',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      getListTimeSlotT()
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            FontAwesome5.cloud_moon,
                            color: kBackgroundColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Buổi chiều:',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      getListTimeSlotC()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: Column(
                    children: [
                      const Text(
                        'Chọn địa điểm giao: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      getListStationRandom()
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.warning,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Lưu ý: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '- Ở chế độ tự động chọn món, hệ thống sẽ tự động chọn món ăn cho bạn, bạn cũng có thể sửa chúng.',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            if (!(date == 'Sunday'))
                              const Text(
                                '- Đăng ký này sẽ được áp dụng cho tuần sau.',
                                // overflow: TextOverflow.clip,
                                maxLines: 2,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                            if (date == 'Sunday')
                              const Text(
                                '- Đăng ký này sẽ áp dụng cho tuần kế tiếp.',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 16),
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
        ));
  }
}
