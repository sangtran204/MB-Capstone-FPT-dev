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
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      height: size.height * 0.35,
      width: size.width,
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
          Container(
            height: 120,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage('${widget.food!.image}'),
                    fit: BoxFit.fill)),
            // child: Image(
            //   fit: BoxFit.fill,
            //   image: NetworkImage('${widget.food!.image}'),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.food!.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
