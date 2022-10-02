import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/view/home/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _value = 'Đại Học FPT';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      //-----AppBar----
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffffcc33),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 24,
            ),
            SizedBox(width: 20),
            DropdownButton<String>(
              value: _value,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text('Đại Học FPT'),
                  value: 'Đại Học FPT',
                ),
                DropdownMenuItem(
                  child: Text('Đại Học HUTECH'),
                  value: 'Đại Học HUTECH',
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _value = newValue!;
                });
              },
            ),
          ],
        ),
      ),
//---------------
      endDrawer: NavigationDrawer(),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white70,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: size.width,
                height: 210,
                decoration: BoxDecoration(
                    color: Color(0xffffcc33),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: const <Widget>[
                            Text(
                              'Chào, MinhT',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Bạn muốn ăn gì?',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 80,
                            height: 120,
                            decoration: BoxDecoration(
                              boxShadow: null,
                            ),
                            child: CategoryItem(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 230),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: size.height / 2.5,
                          child: Column(
                            children: [
                              PackageItem(),
                            ],
                          ), //),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

Widget CategoryItem() => Card(
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white60, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 20,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.card_giftcard),
        Text(
          'Category hihi',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    ));

Widget PackageItem() => Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white10, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.none,
      elevation: 20,
      child: Container(
        height: 250.0,
        width: 380.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 160,
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/packageitem.jpg',
                        ),
                        fit: BoxFit.fill)),
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 230, top: 110, right: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffffcc33),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '  200.000' + 'đ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ))),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gói chay',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Sáng - Trưa',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600),
                  ),
                  Text(
                    'Phù hợp cho người ăn chay!',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.white,
    );