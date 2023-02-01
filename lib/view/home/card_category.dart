import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/models/PackageCategory/entity/package_category.dart';
// import 'package:mobile_capstone_fpt/models/entity/package_category.dart';
import 'package:provider/provider.dart';

class CardCategoryItem extends StatefulWidget {
  const CardCategoryItem({Key? key, this.packageCategory}) : super(key: key);
  final PackageCategory? packageCategory;

  @override
  State<CardCategoryItem> createState() => _CardCategoryItemState();
}

class _CardCategoryItemState extends State<CardCategoryItem> {
  @override
  Widget build(BuildContext context) {
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    // Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white60, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
          onTap: () async {
            await packageProvider.getPackageByCategory(
                context, widget.packageCategory!.id);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 65,
                width: 70,
                child: Image.network(
                  widget.packageCategory!.image,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                widget.packageCategory!.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              )
            ],
          )),
    );
  }
}
