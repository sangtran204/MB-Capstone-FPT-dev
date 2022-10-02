export 'home_screen.dart';
export 'package_detail_screen.dart';
export 'select_food.dart';

// // import 'package:flutter/material.dart';

// // class Home extends StatefulWidget {
// //   const Home({Key? key}) : super(key: key);

// //   @override
// //   _HomeState createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return const Scaffold(
// //       body: Center(
// //         child: Text(
// //           'Home',
// //           style: TextStyle(fontSize: 40),
// //         ),
// //       ),
// //     );
// //   }
// // }

// //-------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String _value = 'Đại Học FPT';
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   void _openEndDrawer() {
//     _scaffoldKey.currentState!.openEndDrawer();
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mqHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       // backgroundColor: Colors.amber,
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Icon(
//               Icons.location_on_outlined,
//               color: Colors.black,
//               size: 30,
//             ),
//             SizedBox(width: 20),
//             DropdownButton<String>(
//               value: _value,
//               icon: const Icon(Icons.arrow_forward_ios_rounded),
//               items: const <DropdownMenuItem<String>>[
//                 DropdownMenuItem(
//                   child: Text('Đại Học FPT'),
//                   value: 'Đại Học FPT',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('Đại Học HUTECH'),
//                   value: 'Đại Học HUTECH',
//                 ),
//               ],
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _value = newValue!;
//                 });
//               },
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.notifications_active_outlined,
//               color: Colors.black,
//             ),
//             onPressed: () {},
//           ),
//           // iconButton for andrew
//           IconButton(
//             icon: Icon(
//               Icons.person,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               _openEndDrawer();
//             },
//           )
//         ],
//       ),
// //---------------app bar--------------

//       endDrawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: Text('item 1'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text('item 2'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             )
//           ],
//         ),
//       ),

//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             // const SizedBox(
//             //   height: 5,
//             // ),
//             Container(
//               color: Color(0xffffcc33),
//               height: mqHeight / 2,
//               child: Stack(
//                 children: <Widget>[
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Column(
//                           children: const <Widget>[
//                             Text(
//                               'Chào, MinhT',
//                               style: TextStyle(
//                                 fontSize: 30,
//                                 fontFamily: 'AirbnbCerealBold',
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'Bạn muốn ăn gì?',
//                               style: TextStyle(
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Container(
//                       //   color: Colors.amber,
//                       // ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       // Container(
//                       //   height: 100,
//                       //   width: double.infinity,
//                       //   color: Colors.blueAccent,
//                       //   child: ListView.builder(
//                       //       scrollDirection: Axis.horizontal,
//                       //       shrinkWrap: true,
//                       //       itemCount: 5,
//                       //       itemBuilder: (BuildContext context, int index) {
//                       //         return Card(
//                       //           child: Container(
//                       //             height: 80,
//                       //             width: 80,
//                       //             // color: Colors.transparent,
//                       //             decoration: BoxDecoration(
//                       //                 borderRadius: BorderRadius.circular(20),
//                       //                 color: Colors.greenAccent),
//                       //             child: Text('Category'),
//                       //           ),
//                       //         );
//                       //       }),
//                       // ),
//                       // SizedBox(
//                       //   height: 10,
//                       // ),
//                       SizedBox(
//                         height: 120,
//                         child: ListView.builder(
//                           physics: ClampingScrollPhysics(),
//                           scrollDirection: Axis.horizontal,
//                           shrinkWrap: true,
//                           itemCount: 5,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Container(
//                               width: 100,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 boxShadow: null,
//                               ),

//                               // color: Colors.blueAccent,
//                               child: Card(
//                                   // shape: RoundedRectangleBorder(

//                                   //   side: const BorderSide(
//                                   //       color: Colors.red, width: 2),
//                                   //   borderRadius: BorderRadius.circular(20),
//                                   // ),
//                                   elevation: 20,
//                                   child: Icon(Icons.card_giftcard)),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Positioned(
//                   //   top: mqHeight / 5.5,
//                   //   left: 0.0,
//                   //   right: 0.0,
//                   //   bottom: 0.0,
//                   //   child: SizedBox(
//                   //     // height: 100,
//                   //     child: ListView.builder(
//                   //       physics: ClampingScrollPhysics(),
//                   //       scrollDirection: Axis.horizontal,
//                   //       shrinkWrap: true,
//                   //       itemCount: 5,
//                   //       itemBuilder: (BuildContext context, int index) {
//                   //         return Container(
//                   //           width: 100,
//                   //           height: 100,
//                   //           child: Card(
//                   //               shape: RoundedRectangleBorder(
//                   //                 side: const BorderSide(
//                   //                     color: Colors.white10, width: 1),
//                   //                 borderRadius: BorderRadius.circular(30),
//                   //               ),
//                   //               elevation: 20,
//                   //               child: Icon(Icons.card_giftcard)),
//                   //         );
//                   //       },
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//             Container(
//               // width: double.infinity,
//               // decoration: const BoxDecoration(
//               //   color: Colors.orange,
//               //   borderRadius: BorderRadius.only(
//               //     topLeft: Radius.circular(50),
//               //     topRight: Radius.circular(50),
//               //   ),
//               // ),
//               child: Column(
//                 children: [
//                   ListView.builder(
//                     physics: ClampingScrollPhysics(),
//                     scrollDirection: Axis.vertical,
//                     shrinkWrap: true,
//                     itemCount: 2,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: EdgeInsets.only(top: 5),
//                         height: mqHeight / 1.9,
//                         // width: double.infinity,
//                         // color: Colors.green,
//                         child: Column(
//                           children: [
//                             Card(
//                               shape: RoundedRectangleBorder(
//                                 side: const BorderSide(
//                                     color: Colors.white10, width: 1),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               clipBehavior: Clip.none,
//                               elevation: 20,
//                               child: SizedBox(
//                                 height: 280,
//                                 width: 370,
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/anh_1.png',
//                                       height: 100,
//                                       width: 100,
//                                     ),
//                                     Text('data'),
//                                     Text('data'),
//                                   ],
//                                 ),
//                               ),
//                               color: Colors.white,
//                             )
//                           ],
//                         ), //),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
