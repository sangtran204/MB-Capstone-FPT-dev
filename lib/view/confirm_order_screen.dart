import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/icons/app_icons_icons.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

enum SingingCharacter { lafayette, jefferson }

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  // SingingCharacter? _character = SingingCharacter.lafayette;
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text('Xác nhận thông tin'),
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, '/order');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
//Thông tin người nhận
            Container(
              width: size.width,
              // height: 100,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          AppIcons.user_check,
                          color: Colors.black87,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        titlePart('Thông tin người nhận')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Nhi PT',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '0346754666',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
//Thông tin đơn hàng
            Container(
              color: Colors.white,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.description_outlined,
                          color: Colors.black87,
                          size: 26,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        titlePart('Thông tin đơn hàng')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 15),
                      child: SizedBox(
                        child: Row(children: [
                          Container(
                            height: 70,
                            width: 100,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/salad1.jpg',
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          titlePart('Gói ăn nhanh'),
                          Padding(
                            padding: const EdgeInsets.only(top: 70, left: 30),
                            child: titlePart('500.000 đ'),
                          )
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
//Tổng thanh toán
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 15, bottom: 8, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Tổng thanh toán: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      '500.000 đ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kBackgroundColor),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),

//Hình thức thanh toán
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.payment_outlined,
                          color: Colors.black87,
                          size: 26,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        titlePart('Hình thức thanh toán')
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // GestureDetector(
                        //   onTap: () => setState(() => _value = 0),
                        //   child: Container(
                        //     width: size.width * 0.4,
                        //     padding: const EdgeInsets.only(
                        //         top: 8, left: 15, bottom: 8),
                        //     color: _value == 0
                        //         ? kBackgroundColor
                        //         : Colors.transparent,
                        //     child: Row(
                        //       children: <Widget>[
                        //         Container(
                        //           height: 35,
                        //           width: 35,
                        //           decoration: BoxDecoration(
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(15)),
                        //               image: DecorationImage(
                        //                   image: AssetImage(
                        //                     'assets/images/momologo.png',
                        //                   ),
                        //                   fit: BoxFit.cover)),
                        //         ),
                        //         SizedBox(
                        //           width: 20,
                        //         ),
                        //         Text(
                        //           'Momo ',
                        //           style: TextStyle(
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.black87),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () => setState(() => _value = 1),
                          child: Container(
                            width: size.width * 0.4,
                            padding: const EdgeInsets.only(
                                top: 8, left: 15, bottom: 8),
                            color: _value == 1
                                ? kBackgroundColor
                                : Colors.transparent,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/logovnpay.png',
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text(
                                  'VN Pay',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
//Ghi chú
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  children: [
                    Row(children: [
                      const Icon(
                        AppIcons.note,
                        color: Colors.black87,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      titlePart('Ghi chú'),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Ghi chú ...'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Container(
            //   // color: Colors.amber,
            //   margin: const EdgeInsets.only(bottom: 10),
            //   height: 60,
            //   width: MediaQuery.of(context).size.width * 0.7,
            //   decoration: const BoxDecoration(
            //       color: Colors.amber,
            //       borderRadius: BorderRadius.all(Radius.circular(30))),
            //   child:
            //   TextButton(
            //     style: TextButton.styleFrom(primary: Colors.black),
            //     onPressed: () {
            //       Navigator.pushNamed(context, '/history');
            //     },
            //     child: const Text(
            //       'Thanh Toán',
            //       style: TextStyle(fontSize: 25),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }

  Widget titlePart(String title) => Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontSize: 18, fontStyle: FontStyle.italic),
      );
}
