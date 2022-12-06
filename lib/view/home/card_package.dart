import 'package:flutter/material.dart';
// import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/models/entity/package.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class CardPackage extends StatefulWidget {
  const CardPackage({Key? key, this.package}) : super(key: key);
  final Package? package;

  @override
  State<CardPackage> createState() => _CardPackageState();
}

class _CardPackageState extends State<CardPackage> {
  @override
  Widget build(BuildContext context) {
    // PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    // Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white10, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.none,
      elevation: 20,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 32, left: 15, right: 15),
      child: InkWell(
        // onTap: () async {
        // await packageProvider.getPackageDetail(context, widget.package!.id);
        // await Navigator.pushReplacementNamed(context, '/PackageDetail');
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return PackageDetailScreen(
        //     package: widget.package,
        //   );
        // }));
        // },
        child: SizedBox(
          // height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(widget.package!.image),
                          fit: BoxFit.fill)),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 220, top: 110, right: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffffcc33),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            widget.package!.price.toString().toVND(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ))),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.package!.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.package!.timeFrame!.name,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.package!.description,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
