import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';

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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String dateFilter = '110000110000110000';
    String subDate = dateFilter.substring(0, 3);
    List<String> date = [];
    for (int i = 0; i < dateFilter.length + 3; i++) {
      date.add(dateFilter.substring(0, 3));
      dateFilter = dateFilter.substring(3, dateFilter.length);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, '/packageDetail');
          },
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                //phần của icon
                dateOfMeal(date),
              ],
            ),
          ),
          //phần của đặt Buổi sáng
          mealOfDate('Sáng'),
          mealOfDate('Trưa'),
          mealOfDate('Chiều'),

          // code sumary
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sơ lược:',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Số món đã chọn:',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),

          //code button
          const Spacer(),
          Column(
            children: [
              // Container(
              //   height: 30,
              //   width: MediaQuery.of(context).size.width,
              //   child: Align(
              //       alignment: Alignment.center, child: const Text('data')),
              //   color: Colors.red,
              // ),
              SizedBox(
                height: 5,
              ),
              Container(
                // color: Colors.amber,
                margin: EdgeInsets.only(bottom: 10),
                height: 60,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    print(dateFilter);
                    print(date);
                    // print(newString);

                    date.forEach((item) {
                      print(item);
                    });
                  },
                  child: Text(
                    'Xác Nhận',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
// }

  Widget dateOfMeal(List date) {
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
        tabs: [
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
            text: 'Home',
          ),
          GButton(
            icon: Icons.looks_3,
            text: 'Likes',
          ),
          GButton(
            icon: Icons.looks_4,
            text: 'Search',
          ),
          GButton(
            icon: Icons.looks_5,
            text: 'Profile',
          ),
          GButton(
            icon: Icons.looks_6,
            text: 'Profile',
          ),
          GButton(
            icon: Icons.looks_one,
            text: 'Profile',
          ),
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

  Widget mealOfDate(String meal) {
    // final String meal;
    return Container(
      padding: const EdgeInsets.all(10),
      // color: Colors.amberAccent,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
      child: Container(
        height: 150,
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border:
                      Border(right: BorderSide(width: 1, color: Colors.grey))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 50,
                  child: Text(
                    // 'Sáng ',
                    meal,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(width: 1, color: Colors.grey))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Align(
                        child: Text(
                          'Món ăn',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                      SizedBox(
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.amber,
                                child: IconButton(
                                  onPressed: () {
                                    print('edit');
                                  },
                                  icon: Icon(Icons.edit_note_outlined),
                                  color: Colors.black,
                                  iconSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.amber,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/selectFood');
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
                  style: TextStyle(color: Colors.black, fontSize: 16),
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
    );
  }
}
