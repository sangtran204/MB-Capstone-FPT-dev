import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/models/response/package_food_res.dart';

class PackageFood extends StatefulWidget {
  const PackageFood({Key? key, this.food}) : super(key: key);
  final Result? food;

  @override
  State<PackageFood> createState() => _PackageFoodState();
}

class _PackageFoodState extends State<PackageFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(
              0.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image(
            image: NetworkImage('${widget.food!.image}'),
            height: 110,
            width: 110,
          ),
          Text(
            '${widget.food!.name}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
