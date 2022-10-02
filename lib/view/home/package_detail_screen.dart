import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/widgets/button_field.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({Key? key}) : super(key: key);

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Container(
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
                          color: Colors.greenAccent,
                          child: Stack(
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/images/packageitem.jpg'),
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
                                          'Gói ăn chay',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w500),
                                          // textAlign: TextAlignVertical.center,
                                        ),
                                      )))
                            ],
                          )),
                      Container(
                        width: size.width,
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
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // height: 20,
                                width: size.width,
                                child: Text(
                                  'Chi tiết gói ăn:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textInfo('Gói 2 bữa Sáng - Trưa'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    textInfo("Ngày giao: Thứ 2 - Thứ 6"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    textInfo('Món ăn: 16 món'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    textInfo(
                                        'Mô tả: Gói ăn bao gồm các món chay phù hợp với những người ăn chay, giảm cân.')
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
                          'Món ăn trong gói',
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
            Positioned(
                top: size.height * 0.8,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: size.width,
                  child: Row(
                    children: [
                      Container(
                        width: size.width * 0.5,
                        height: 60,
                        // color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25, top: 15),
                          child: Text(
                            '200.000' + ' Đ',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w500),
                            // textAlign: TextAlignVertical.center,
                          ),
                        ),
                        decoration: BoxDecoration(
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
                            color: Colors.white,
                            border: Border(
                                right:
                                    BorderSide(color: Colors.black, width: 3))),
                      ),
                      Container(
                        width: size.width * 0.5,
                        height: 60,
                        child: RaisedButton(
                          onPressed: () {
                            print('Chọn gói');
                          },
                          color: Color(0xffffcc33),
                          child: Text(
                            'Chọn gói',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w500),
                          ),
                        ),
                        decoration: BoxDecoration(
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
                          color: Color(0xffffcc33),
                        ),
                      )
                    ],
                  ),
                ))
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
