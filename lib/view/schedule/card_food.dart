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
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        height: 70,
        // width: size.width * 0.5,
        // color: Colors.purple,

        child: Row(
          children: [
            Container(
              height: 70,
              width: 90,
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
            const SizedBox(
              width: 5,
            ),
            Container(
                height: 100,
                width: 120,
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  widget.food!.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )),
          ],
        ),
      ),
    );
  }
}
