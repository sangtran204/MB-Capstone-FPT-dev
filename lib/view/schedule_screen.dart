import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile_capstone_fpt/components/custom_button.dart';
import 'package:mobile_capstone_fpt/config/provider/food_group_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/entity/package_item.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  // static String dateFilter = '110000110000110000';
  // static String subDate = dateFilter.substring(0, 3);
  // var part = dateFilter.split(' ');
  // String newString = dateFilter.substring(3, dateFilter.length);

  // List<String>? date;

// use for dropdowButton 1
  String _value = '0';
  // use for dropdowButton 2
  String _value1 = '1';
  // use for dropdowButton 3
  String _value2 = '2';
  // use for dropdowButton 4
  String _value3 = '3';
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    FoodGroupProvider foodGroupProvider =
        Provider.of<FoodGroupProvider>(context);
    // PackageItemProvider packageItemProvider =
    //     Provider.of<PackageItemProvider>(context);
    // Size size = MediaQuery.of(context).size;

    List<PackageItem> list = [];
    for (int j = 0;
        j < packageProvider.packageDetail.result!.packageItem.length;
        j++) {
      list.add(packageProvider.packageDetail.result!.packageItem[j]);
    }
    List<int> code = [];
    List<String> listIdFG = [];
    for (int item = 0; item < list.length; item++) {
      code.add(list[item].itemCode);
      listIdFG.add(list[item].foodGroup!.id);
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

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: kBackgroundColor,
              leading: BackButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/packageDetail');
                },
              ),
              // bottom: const TabBar(tabs: [
              //   Tab(text: 'Zeroth'),
              //   Tab(text: 'First'),
              //   Tab(text: 'Second'),
              // ]),
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
                        "Xác nhận",
                        style: textTheme.headline6!.copyWith(
                          color: kblackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/confirm');
                        // const ExpenseList().launch(context);
                      },
                      backGroundColor: kBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
            body: packageProvider.packageDetail.result == null
                ? const Center(child: CircularProgressIndicator())
                :
                // const TabBarView(children: [
                //     // Icon(Icons.directions_car),
                //     // Icon(Icons.directions_transit),
                //     // Icon(Icons.directions_bike),
                //   ])
                SingleChildScrollView(
                    // clipBehavior: Clip.none,
                    // scrollDirection: Axis.horizontal,
                    // physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // SingleChildScrollView(
                        //   clipBehavior: Clip.none,
                        //   scrollDirection: Axis.horizontal,
                        //   physics: BouncingScrollPhysics(),
                        //   child:
                        //   Column(
                        //     children: [
                        //       //phần của icon
                        //       // for (int j = 0;
                        //       //     j <
                        //       //         packageProvider
                        //       //             .packageDetail.result!.packageItem!.length;
                        //       //     j++)
                        //       // packageProvider.packageDetail.result!.packageItem![j].itemCode
                        //       dateOfMeal(),
                        //     ],
                        //   ),
                        // ),
                        // phần của đặt Buổi sáng
                        for (int item = 0; item < list.length; item++)
                          // for (int item = 0; item < code.length; item++)
                          Container(
                            padding: const EdgeInsets.all(10),
                            // color: Colors.amberAccent,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 4)
                                ]),
                            child: Container(
                              height: 150,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 1, color: Colors.grey))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 150,
                                        width: 50,
                                        child: Text(
                                          nameOfItem(code[item]),
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
                                        padding: const EdgeInsets.all(8.0),
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
                                              height: 110,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  // Align(
                                                  //   alignment: Alignment
                                                  //       .bottomRight,
                                                  //   child: Container(
                                                  //     height: 30,
                                                  //     width: 30,
                                                  //     color: Colors.amber,
                                                  //     child: IconButton(
                                                  //       onPressed: () {
                                                  //         print('edit');
                                                  //       },
                                                  //       icon: Icon(Icons
                                                  //           .edit_note_outlined),
                                                  //       color: Colors.black,
                                                  //       iconSize: 15,
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  // SizedBox(
                                                  //   width: 8,
                                                  // ),
                                                  // for (int itemID = 0;
                                                  //     itemID <
                                                  //         listIdFG.length;
                                                  //     itemID++)
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      color: Colors.amber,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          foodGroupProvider
                                                              .getFoodGroupDetail(
                                                                  context,
                                                                  listIdFG[
                                                                      item]);
                                                          Navigator
                                                              .pushReplacementNamed(
                                                                  context,
                                                                  '/selectFood');
                                                        },
                                                        icon: Icon(Icons.add),
                                                        color: Colors.black,
                                                        iconSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Thời gian giao Hàng',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      DropdownButton<String>(
                                        underline: Container(
                                            decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(),
                                                color: Colors.amber)),
                                        value: _value,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        items: const <DropdownMenuItem<String>>[
                                          DropdownMenuItem(
                                            child: Text('7:30 - 8:00 AM'),
                                            value: '0',
                                          ),
                                          DropdownMenuItem(
                                            child: Text('7:30 - 8:00 AM'),
                                            value: '1',
                                          ),
                                        ],
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _value = newValue!;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      DropdownButton<String>(
                                        value: _value1,
                                        icon: const Icon(Icons.arrow_drop_down),
                                        items: const <DropdownMenuItem<String>>[
                                          DropdownMenuItem(
                                            child: Text('Đại Học FPT'),
                                            value: '1',
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Đại học HUTECH'),
                                            value: '2',
                                          ),
                                        ],
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _value1 = newValue!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        // code sumary
                        // const SizedBox(
                        //   height: 10,
                        // ),
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
                      ],
                    ),
                  )));
  }
// }

  Widget dateOfMeal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        activeColor: Colors.black,
        iconSize: 24,
        gap: 14,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.amber,
        color: Colors.black,
        tabs: const [
          // for (int i = 0; i < date.length; i++)
          //   if (date[1].toString().contains('1'))
          //     {
          //       GButton(
          //         icon: Icons.looks_two,
          //         text: 'Home',
          //       ),
          //     },

          GButton(
            icon: Icons.looks_two,
            text: 'HEN',
          ),

          GButton(
            icon: Icons.looks_3,
            text: 'XUI',
          ),
          GButton(
            icon: Icons.looks_4,
            text: 'BA DO',
          ),
          GButton(
            icon: Icons.looks_5,
            text: 'Likes',
          ),
          GButton(
            icon: Icons.looks_6,
            text: 'Search',
          ),

          GButton(
            icon: Icons.seven_k,
            text: 'Profile',
          ),
          // GButton(
          //   icon: Icons.looks_one,
          //   text: 'Profile',
          // ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  // Widget mealOfDate(String meal) {
  //   print(meal);
  //   packageItemProvider
  //   // final String meal;
  //   return
  // }
}
