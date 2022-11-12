import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/constants.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/entity/subscription-history.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _value = "Đang đặt";
  List<Subscription> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SubProvider subProvider = Provider.of<SubProvider>(context);
    list = subProvider.list;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'Lịch sử',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Positioned(
              child: Container(
            height: 70,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 20),
                Container(
                  height: 35,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade800, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: DropdownButton<String>(
                    value: _value,
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                    ),
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem(
                        child: Text('Đang đặt'),
                        value: 'Đang đặt',
                        onTap: () {
                          subProvider.getSubByStatus(context, 'inProgress');
                          setState(() {});
                        },
                      ),
                      DropdownMenuItem(
                        child: Text('Chưa thanh toán'),
                        value: 'Chưa thanh toán',
                        onTap: () {
                          setState(() {
                            subProvider.getSubByStatus(context, 'unConfirmed');
                          });
                        },
                      ),
                      DropdownMenuItem(
                        child: Text('Hoàn thành'),
                        value: 'Hoàn thành',
                        onTap: () {
                          subProvider.getSubByStatus(context, 'done');
                          setState(() {});
                        },
                      ),
                      DropdownMenuItem(
                        child: Text('Đã hủy'),
                        value: 'Đã hủy',
                        onTap: () {
                          subProvider.getSubByStatus(context, 'cancel');
                          setState(() {});
                        },
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _value = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Center(
            child: list == null
                ? Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 80),
                      child: Text('Không có đăng ký'),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(
                      top: 70,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int i = 0; i < list.length; i++)
                          OrderItems(list[i]),
                      ],
                    ),
                  ),
          )
        ]),
      ),
    ));
  }

  Widget OrderItems(Subscription sub) => Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: GestureDetector(
          onTap: (() {
            print('Sub detail');
          }),
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
                          image: NetworkImage(sub.packageImg),
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
                          '${sub.packageName}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${sub.startDelivery.toIso8601String().substring(0, 10)}',
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
                        '${sub.totalPrice.toString().replaceAll('0000', '0 000')} đ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      if (sub.status == 'inProgress')
                        GestureDetector(
                          child: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.5, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.red),
                            child: Center(
                              child: Text(
                                "Hủy",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
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
                      if (sub.status == 'unConfirmed')
                        GestureDetector(
                          child: Container(
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.5, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: kBackgroundColor),
                            child: Center(
                              child: Text(
                                "Thanh toán",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          onTap: () {
                            print('thanh toán');
                          },
                        ),
                      if (sub.status == 'done')
                        Container(
                          height: 30,
                          width: 90,
                          child: Center(
                            child: Text(
                              "Hoàn thành",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      if (sub.status == 'cancel')
                        Container(
                          height: 30,
                          width: 90,
                          child: Center(
                            child: Text(
                              "Hoàn thành",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
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
