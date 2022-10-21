import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/package_category_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/entity/package.dart';
import 'package:mobile_capstone_fpt/models/entity/package_category.dart';
import 'package:mobile_capstone_fpt/view/drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _value = 'Đại Học FPT';
  // List<Package>? listPackage = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    PackageCategoryProvider packageCategoryProvider =
        Provider.of<PackageCategoryProvider>(context);
    // listPackage = packageProvider.packageActive.result?.cast();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      //-----AppBar----
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffffcc33),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.location_on_outlined,
              color: Colors.black,
              size: 24,
            ),
             const SizedBox(width: 20),
            DropdownButton<String>(
              value: _value,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text('Đại Học FPT'),
                  value: 'Đại Học FPT',
                ),
                DropdownMenuItem(
                  child: Text('Đại Học HUTECH'),
                  value: 'Đại Học HUTECH',
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _value = newValue!;
                });
              },
            ),
          ],
        ),
      ),
//---------------
      endDrawer: const NavigationDrawer(),
      body: packageProvider.listPackge == null ||
              packageCategoryProvider.packageCategory.result == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: size.height,
              width: size.width,
              // color: Colors.white70,
              color: Colors.white,

              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.5,
                      color: kBackgroundColor,
                      // decoration: const BoxDecoration(
                      //     // color: Colors.white,
                      //     // borderRadius: BorderRadius.only(
                      //     //     bottomLeft: Radius.circular(30),
                      //     //     bottomRight: Radius.circular(30))
                      //     ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: const <Widget>[
                                  Text(
                                    'Chào, MinhT',
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Bạn muốn ăn gì?',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 112,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    for (int j = 0;
                                        j <
                                            packageCategoryProvider
                                                .packageCategory.result!.length;
                                        j++)
                                      Container(
                                        width: 90,
                                        // height: 120,
                                        decoration: const BoxDecoration(
                                          boxShadow: null,
                                        ),
                                        child: GestureDetector(
                                          onTap: () async {
                                            packageProvider
                                                .getPackageByCategory(
                                                    context,
                                                    packageCategoryProvider
                                                        .packageCategory
                                                        .result![j]
                                                        .id);
                                            setState(() {
                                              // packageProvider.listPackge =
                                              //     packageCategoryProvider
                                              //         .packageCategory.result;
                                            });
                                          },
                                          child: CategoryItem(
                                              packageCategoryProvider
                                                  .packageCategory.result![j]),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // color: Colors.green,
                      width: size.width,
                      // height: size.height,
                      margin: EdgeInsets.only(top: 210),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Gói ăn ',
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          for (int i = 0;
                              i < packageProvider.listPackge!.length;
                              i++)
                            GestureDetector(
                              onTap: () {
                                packageProvider.getPackageDetail(
                                    context, packageProvider.listPackge![i].id);
                                Navigator.pushReplacementNamed(
                                    context, '/packageDetail');
                              },
                              child: Column(
                                children: [
                                  PackageItem(packageProvider.listPackge![i]),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    ));
  }

  Widget CategoryItem(PackageCategory cate) => Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white60, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      // elevation: 20,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(Icons.card_giftcard),
          // Image.network('src'),
          Container(
            height: 65,
            width: 70,
            child: Image.network(cate.image),
          ),
          Text(
            cate.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget PackageItem(Package dto) => Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white10, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.none,
        elevation: 20,
        // child: GestureDetector(
        child: Container(
          height: 250.0,
          width: 360.0,
          // margin: EdgeInsets.only(top:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 160,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(dto.image), fit: BoxFit.fill)),
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 230, top: 110, right: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffffcc33),
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '${dto.price.toString()} đ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ))),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dto.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      dto.timeFrame!.name,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    ),
                    Text(
                      dto.description,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        color: Colors.white,
      );
}
