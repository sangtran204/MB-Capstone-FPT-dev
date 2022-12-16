// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';

class SuccessPayScreen extends StatefulWidget {
  const SuccessPayScreen({Key? key}) : super(key: key);

  @override
  State<SuccessPayScreen> createState() => _SuccessPayScreenState();
}

class _SuccessPayScreenState extends State<SuccessPayScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime timeNow = DateTime.now();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: kPrimaryLightColor,
          child: Stack(
            children: [
              Positioned(
                  top: 90,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.only(top: 50),
                    height: 400,
                    width: size.width - 30,
                    decoration: BoxDecoration(
                        // color: Colors.lightBlue.shade50,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Thanh toán thành công',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          '123.000 đ',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text('Tên gói',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text('Gói MeSup1',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text('Thời gian thanh toán',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(timeNow.toString().substring(0, 16),
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.grey))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text('Mã đơn hàng',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text('562463',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.grey))
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/HomePage');
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              // ignore: prefer_const_constructors
                              child: Center(
                                child: const Text('Màn hình chính',
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                              ),
                              height: 50,
                              width: 220,
                              decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(15)),
                            ))
                        // CustomButton(
                        //     child: Text('Màn hình chính'),
                        //     onTap: () {
                        //       Navigator.pushReplacementNamed(
                        //           context, '/HomePage');
                        //     })
                      ],
                    ),
                  )),
              Positioned(
                top: 50,
                left: size.width / 2 - 40,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kBackgroundColor,
                  ),
                  child: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
