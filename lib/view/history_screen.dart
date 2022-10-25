import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/constants.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        title: Text(
          'Lịch sử',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
              child: Container(
            height: 70,
            width: size.width,
            // decoration: BoxDecoration(
            //     boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.5))]),
            // color: Colors.amberAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: kBackgroundColor),
                    child: Center(
                      child: Text(
                        "Sắp tới",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigator.pushNamed();
                    print('Sắp tới');
                    // const ExpenseList().launch(context);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: kBackgroundColor),
                    child: Center(
                      child: Text(
                        "Đã đặt",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Navigator.pushNamed();
                    print('đã đặt');
                    // const ExpenseList().launch(context);
                  },
                ),
              ],
            ),
          )),
          Center(
            child: Container(
              padding: EdgeInsets.only(
                top: 70,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [OrderItems(), OrderItems(), OrderItemPass()],
              ),
            ),
          )
        ]),
      ),
    ));
  }

  Widget OrderItems() => Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          height: 90,
          width: 380,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/packageitem.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                  height: 100,
                  width: 170,
                  padding: const EdgeInsets.only(top: 10, left: 3, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Tên gói ăn',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '22-10-2022',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Gói ăn trải nghiệm',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(top: 20, left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '200.000 đ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Colors.red),
                        child: Center(
                          child: Text(
                            "Hủy",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        // Navigator.pushNamed();
                        print('đã đặt');
                        // const ExpenseList().launch(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget OrderItemPass() => Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          height: 90,
          width: 380,
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/packageitem.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                  height: 100,
                  width: 170,
                  padding: const EdgeInsets.only(top: 10, left: 3, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Tên gói ăn',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '22-10-2022',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Gói ăn trải nghiệm',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(top: 20, left: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '200.000 đ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Đã giao hàng',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  Widget miniTab() => Card();
}
