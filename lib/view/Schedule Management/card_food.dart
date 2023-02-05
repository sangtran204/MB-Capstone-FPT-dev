import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/models/Food/entity/food.dart';

class CardFood extends StatefulWidget {
  const CardFood({Key? key, this.food}) : super(key: key);
  final Food? food;

  @override
  State<CardFood> createState() => _CardFoodState();
}

class _CardFoodState extends State<CardFood> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        height: 80,
        // width: size.width * 0.5,
        // color: Colors.purple,

        child: Row(
          children: [
            Container(
              height: 90,
              width: 120,
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
                height: 80,
                width: 90,
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
