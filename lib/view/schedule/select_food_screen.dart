// import 'package:flutter/material.dart';
// import 'package:mobile_capstone_fpt/config/provider/food_group_provider.dart';
// import 'package:mobile_capstone_fpt/constants/app_color.dart';
// import 'package:mobile_capstone_fpt/models/entity/food.dart';
// import 'package:provider/provider.dart';

// class SelectFoodScreen extends StatefulWidget {
//   const SelectFoodScreen({Key? key}) : super(key: key);

//   @override
//   State<SelectFoodScreen> createState() => _SelectFoodScreenState();
// }

// class _SelectFoodScreenState extends State<SelectFoodScreen> {
//   // final foods = [
//   //   Food(name: "Cơm gà "),
//   //   Food(name: "Mì xào"),
//   //   Food(name: "Cháo dinh dưỡng"),
//   //   Food(name: "Một món gì đó mà cái tên nó dài hơn")
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     FoodGroupProvider foodGroupProvider =
//         Provider.of<FoodGroupProvider>(context);
//     Size size = MediaQuery.of(context).size;
//     List<Food> listFood = [];
//     for (int j = 0;
//         j < foodGroupProvider.foodGroupDetail.result!.foods!.length;
//         j++) {
//       listFood.add(foodGroupProvider.foodGroupDetail.result!.foods![j]);
//     }
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         backgroundColor: kBackgroundColor,
//         leading: BackButton(
//           onPressed: () {
//             Navigator.pushNamedAndRemoveUntil(
//                 context, '/SchedulePage', (route) => false);
//           },
//         ),
//       ),
//       body: foodGroupProvider.foodGroupDetail.result == null
//           ? const Center(child: CircularProgressIndicator())
//           : SizedBox(
//               height: size.height,
//               width: size.width,
//               // color: Colors.blueAccent.shade100,
//               child: Stack(children: [
//                 // Positioned(
//                 //     top: 0,
//                 //     child: Container(
//                 //       height: 120,
//                 //       width: size.width,
//                 //       // color: Colors.greenAccent,
//                 //       child: ListView.builder(
//                 //         // physics: ClampingScrollPhysics(),
//                 //         scrollDirection: Axis.horizontal,
//                 //         shrinkWrap: true,
//                 //         itemCount: 6,
//                 //         itemBuilder: (BuildContext context, int index) {
//                 //           return Container(
//                 //               width: 90,
//                 //               height: 120,
//                 //               child: CategoryFoodItem());
//                 //         },
//                 //       ),
//                 //     )),
//                 // Positioned(
//                 //   top: 20,
//                 //   right: 10,
//                 //   child: ClipRRect(
//                 //     child: ElevatedButton(
//                 //       style:
//                 //           ElevatedButton.styleFrom(primary: Colors.amberAccent),
//                 //       child: Container(
//                 //         height: 40,
//                 //         width: 70,
//                 //         padding: const EdgeInsets.only(top: 8),
//                 //         child: const Text(
//                 //           'Lưu',
//                 //           style: TextStyle(
//                 //               fontSize: 22, fontWeight: FontWeight.bold),
//                 //           textAlign: TextAlign.center,
//                 //         ),
//                 //       ),
//                 //       onPressed: () {
//                 //         Navigator.pushNamed(context, '/order');
//                 //       },
//                 //     ),
//                 //   ),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 50),
//                   child: SingleChildScrollView(
//                     // Viết cái gì đó vô đây
//                     padding: const EdgeInsets.only(left: 10, right: 10),
//                     child: Column(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         for (int item = 0; item < listFood.length; item++)
//                           // ...foods.map(FoodItems).toList(),
//                           GestureDetector(
//                             child: FoodItems(listFood[item]),
//                             onTap: () {
//                               print('Food ID' + item.toString());
//                             },
//                           )
//                       ],
//                     ),
//                   ),
//                 )
//               ]),
//             ),
//     ));
//   }

//   // ignore: non_constant_identifier_names
//   Widget FoodItems(Food food) => Card(
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: Theme.of(context).colorScheme.outline,
//           ),
//           borderRadius: const BorderRadius.all(Radius.circular(12)),
//         ),
//         child: SizedBox(
//           height: 90,
//           width: 360,
//           // color: Colors.purple,

//           child: Row(
//             children: [
//               Container(
//                 height: 100,
//                 width: 130,
//                 decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(12),
//                         bottomLeft: Radius.circular(12)),
//                     image: DecorationImage(
//                         image: NetworkImage(
//                           food.image,
//                         ),
//                         fit: BoxFit.cover)),
//               ),
//               Container(
//                   height: 100,
//                   width: 170,
//                   padding: const EdgeInsets.only(top: 25),
//                   child: Text(
//                     food.name,
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.w400),
//                     textAlign: TextAlign.center,
//                   )),
//               // Container(
//               //   height: 100,
//               //   width: 50,
//               //   child:
//               //   Checkbox(
//               //       checkColor: Colors.white,
//               //       value: food.,
//               //       onChanged: (bool? value) {
//               //         setState(() {
//               //           final newVal = !food.value;
//               //           food.value = newVal;
//               //         });
//               //       }),
//               // )
//             ],
//           ),
//         ),
//       );
// }

