import 'package:flutter/material.dart';
// import 'package:mobile_capstone_fpt/widgets/button_field.dart';
import 'package:mobile_capstone_fpt/widgets/text_input.dart';
// import 'package:mobile_capstone_fpt/widgets/widgets.dart';

class InputInfoScreen extends StatelessWidget {
  const InputInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffcc33),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        // color: Color(0xffffcc33),
        color: Colors.grey.shade200,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Sẵn sàng với \nMeSup',
                      style: TextStyle(
                        color: Color(0xffffcc33),
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // TextInput(

                    //     hintText: 'Họ và Tên',
                    //     textCapitalization: TextCapitalization.words),
                    const SizedBox(
                      height: 20,
                    ),
                    // TextInput(
                    //   hintText: 'Địa chỉ',
                    //   textCapitalization: TextCapitalization.sentences,
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ButtonField(
                    //   text: 'Hoàn tất',
                    //   path: '/login',
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// PreferredSizeWidget appBar() {
//   return AppBar(
//     backgroundColor: Color(0xffffcc33),
//     // title: Container(child: Text('Notification')),
//   );
// }
