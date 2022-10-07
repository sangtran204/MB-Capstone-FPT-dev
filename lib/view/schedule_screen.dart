import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String meal = '';
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
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            child: Text("Gói ăn nhanh"), alignment: Alignment.center),
        leading: const Icon(Icons.arrow_back_ios_new),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.add_alert,
                        text: 'Likes',
                      ),
                      GButton(
                        icon: Icons.search,
                        text: 'Search',
                      ),
                      GButton(
                        icon: Icons.add_alert,
                        text: 'Profile',
                      ),
                      GButton(
                        icon: Icons.add_alert,
                        text: 'Profile',
                      ),
                      GButton(
                        icon: Icons.add_alert,
                        text: 'Profile',
                      ),
                      GButton(
                        icon: Icons.add_alert,
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
                ),
              ],
            ),
          ),
          //phần của đặt Buổi sáng
          // MealOfDate(),
          MealOfDate('Sáng'),

          // code sumary

          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('SUMARY:'),
              Text('total'),
            ],
          ),

          //code button
          const Spacer(),
          Column(
            children: [
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: Align(
                    alignment: Alignment.center, child: const Text('data')),
                color: Colors.red,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () {},
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

  Widget MealOfDate(String? meal) => Container(
        padding: const EdgeInsets.all(10),
        // color: Colors.amberAccent,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)]),
        child: SizedBox(
          height: 150,
          child: Row(
            children: <Widget>[
              Container(
                child: const Align(
                  child: Text('Check', style: TextStyle(fontSize: 15)),
                  alignment: Alignment.topCenter,
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      const Align(
                        child: Text('Sáng', style: TextStyle(fontSize: 12)),
                        alignment: Alignment.topCenter,
                      ),
                      Text('data'),
                      SizedBox(
                        height: 120,
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
                                  onPressed: () {},
                                  icon: Icon(Icons.edit_note_outlined),
                                  color: Colors.black,
                                  iconSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.amber,
                                child: IconButton(
                                  onPressed: () {},
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
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text('Thời gian giao Hàng'),
                  DropdownButton<String>(
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
