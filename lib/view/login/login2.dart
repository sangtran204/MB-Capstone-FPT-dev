// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: SystemUiOverlayStyle.light,
//         child: GestureDetector(
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 // padding: EdgeInsets.only(top: 40),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: <Widget>[
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       Image.asset(
//                         'assets/images/fakelogo.png',
//                         height: 200,
//                         width: 200,
//                       ),
//                       Text("Meal Subscription Plan",
//                           style: TextStyle(
//                             color: Color(0xffffcc33),
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 30),
//                         child: Container(
//                           width: double.infinity,
//                           height: 700,
//                           decoration: BoxDecoration(
//                               color: Color(0xffc8eacc),
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(50),
//                                   topRight: Radius.circular(50))),
//                           child: Column(
//                             children: <Widget>[
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                               Text('Nhập số điện thoại để tiếp tục.',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.grey.shade700)),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               buildPhoneInput(),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               buildInputPassword(),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               buildLoginBtn(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildForgotPassword() {
//     return Form(child: Column(
//       children: [],
//     ));
//   }

//   Widget buildPhoneInput() {
//     return Container(
//       width: 350,
//       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.black.withOpacity(0.13)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           )
//         ],
//       ),
//       child: Stack(
//         children: [
//           InternationalPhoneNumberInput(
//             onInputChanged: (PhoneNumber number) {
//               print(number.phoneNumber);
//             },
//             onInputValidated: (bool value) {
//               print(value);
//             },
//             selectorConfig: SelectorConfig(
//               selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//               showFlags: true,
//               setSelectorButtonAsPrefixIcon: false,
//             ),
//             countrySelectorScrollControlled: false,
//             countries: ['VN'],
//             ignoreBlank: false,
//             autoValidateMode: AutovalidateMode.disabled,
//             selectorTextStyle: TextStyle(color: Colors.black),
//             formatInput: false,
//             maxLength: 10,
//             inputDecoration: InputDecoration(
//               contentPadding: EdgeInsets.only(bottom: 15, left: 0),
//               border: InputBorder.none,
//               hintText: 'Số điện thoại',
//               hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
//             ),
//           ),
//           Positioned(
//             left: 90,
//             top: 8,
//             bottom: 8,
//             child: Container(
//               height: 40,
//               width: 1,
//               color: Colors.black.withOpacity(0.23),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildInputPassword() {
//     return Container(
//         width: 350,
//         height: 58,
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: Colors.black.withOpacity(0.13)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10,
//               offset: Offset(0, 4),
//             )
//           ],
//         ),
//         child: TextField(
//           obscureText: true,
//           style: TextStyle(color: Colors.black87, fontSize: 16),
//           decoration: InputDecoration(
//               border: InputBorder.none,
//               prefixIcon: Icon(Icons.lock, color: Colors.grey.shade500),
//               hintText: 'Mật Khẩu',
//               hintStyle: TextStyle(color: Colors.grey.shade500)),
//         ));
//   }

//   Widget buildLoginBtn() {
//     return Container(
//       // padding: EdgeInsets.only(),
//       width: 250,
//       height: 58,
//       child: RaisedButton(
//         elevation: 5,
//         // onPressed: () => print('Login Pressed'),
//         onPressed: () {
//           Navigator.pushNamed(context, '/home');
//         },
//         // padding: EdgeInsets.all(15),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//         color: Color(0xffffcc33),
//         child: Text(
//           'Đăng Nhập',
//           style: TextStyle(
//               color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
