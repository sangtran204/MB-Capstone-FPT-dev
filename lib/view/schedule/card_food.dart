import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/models/entity/food.dart';

class CardFood extends StatefulWidget {
  const CardFood({Key? key, this.food}) : super(key: key);
  final Food? food;

  @override
  State<CardFood> createState() => _CardFoodState();
}

class _CardFoodState extends State<CardFood> {
  @override
  Widget build(BuildContext context) {
    // PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    // Size size = MediaQuery.of(context).size;
    return Card(
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
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.food!.image,
                      ),
                      fit: BoxFit.cover)),
            ),
            Container(
                height: 100,
                width: 170,
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  widget.food!.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                )),
            // SizedBox(
            //   height: 100,
            //   width: 50,
            //   child:
            //   Checkbox(
            //       checkColor: Colors.white,
            //       value: food!,
            //       onChanged: (bool? value) {
            //         setState(() {
            //           final newVal = !food.value;
            //           food.value = newVal;
            //         });
            //       }),
            // )
          ],
        ),
      ),
    );
  }
}
