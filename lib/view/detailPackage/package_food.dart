import 'package:flutter/material.dart';
// import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
// import 'package:mobile_capstone_fpt/models/entity/package.dart';
// import 'package:provider/provider.dart';

class PackageFood extends StatefulWidget {
  const PackageFood({Key? key}) : super(key: key);
  // final Package? package;

  @override
  State<PackageFood> createState() => _PackageFoodState();
}

class _PackageFoodState extends State<PackageFood> {
  @override
  Widget build(BuildContext context) {
    // PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    // Size size = MediaQuery.of(context).size;
    return Container(
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
        children: const <Widget>[
          Image(
            image: AssetImage('assets/images/salad1.jpg'),
            height: 130,
          ),
          Text(
            'Salad rau trộn',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
