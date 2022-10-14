import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/foods/foodDTO.dart';
import 'package:mobile_capstone_fpt/widgets/button_field.dart';

class SelectFoodScreen extends StatefulWidget {
  const SelectFoodScreen({Key? key}) : super(key: key);

  @override
  State<SelectFoodScreen> createState() => _SelectFoodScreenState();
}

class _SelectFoodScreenState extends State<SelectFoodScreen> {
  final foods = [
    FoodDTO(name: "Cơm gà "),
    FoodDTO(name: "Mì xào"),
    FoodDTO(name: "Cháo dinh dưỡng"),
    FoodDTO(name: "Một món gì đó mà cái tên nó dài hơn")
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, '/order');
          },
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        // color: Colors.blueAccent.shade100,
        child: Stack(children: [
          Positioned(
              top: 0,
              child: Container(
                height: 120,
                width: size.width,
                // color: Colors.greenAccent,
                child: ListView.builder(
                  // physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 90,
                      height: 120,
                      child: CategoryFoodItem(),
                    );
                  },
                ),
              )),
          Positioned(
            top: 130,
            right: 10,
            child: ClipRRect(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                child: Container(
                  height: 40,
                  width: 70,
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'Lưu',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/order');
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 190),
            child: SingleChildScrollView(
              // Viết cái gì đó vô đây
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...foods.map(FoodItems).toList(),
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }

  Widget FoodItems(FoodDTO food) => Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          height: 90,
          width: 360,
          // color: Colors.purple,

          child: Row(
            children: [
              Container(
                height: 100,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/salad1.jpg',
                        ),
                        fit: BoxFit.cover)),
              ),
              Container(
                  height: 100,
                  width: 170,
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    food.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )),
              Container(
                height: 100,
                width: 50,
                child: Checkbox(
                    checkColor: Colors.white,
                    value: food.value,
                    onChanged: (bool? value) {
                      setState(() {
                        final newVal = !food.value;
                        food.value = newVal;
                      });
                    }),
              )
            ],
          ),
        ),
      );
}

Widget CategoryFoodItem() => Card(
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white60, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    // elevation: 20,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.card_giftcard),
        Text(
          'Category food',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        )
      ],
    ));
