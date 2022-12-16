import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
import 'package:mobile_capstone_fpt/config/provider/package_category_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/package_provider.dart';
import 'package:mobile_capstone_fpt/config/provider/profile_provider.dart';
import 'package:mobile_capstone_fpt/config/services/secure_storage.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:mobile_capstone_fpt/models/entity/package.dart';
import 'package:mobile_capstone_fpt/models/entity/package_category.dart';
import 'package:mobile_capstone_fpt/models/entity/profile_result.dart';
import 'package:mobile_capstone_fpt/view/home/drawer.dart';
import 'package:mobile_capstone_fpt/view/home/card_package.dart';
import 'package:mobile_capstone_fpt/view/home/card_category.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PackageCategory> listPackageCategory = [];
  List<Package> listPackgeActive = [];
  Result? profileResult;
  // List<Package> listPackgeActive = [];
  // List<PackageCategory> listPackageCategory = [];
  // String _value = 'Đại Học FPT';

  final SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).getProfile(context);
    Provider.of<PackageProvider>(context, listen: false)
        .getPackageCustomer(context);
    Provider.of<PackageCategoryProvider>(context, listen: false)
        .getPackageCategory(context);
  }

  @override
  Widget build(BuildContext context) {
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    PackageCategoryProvider packageCategoryProvider =
        Provider.of<PackageCategoryProvider>(context);
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      //-----AppBar----
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: null,
        backgroundColor: const Color(0xffffcc33),
        toolbarHeight: 60,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      // color: kBackgroundColor
                      image: DecorationImage(
                        image: NetworkImage(
                            profileProvider.info.result?.profile.avatar == null
                                ? "Avatar"
                                : profileProvider.info.result!.profile.avatar),
                        fit: BoxFit.fill,
                      )),
                  // child: profileProvider.info.result!.profile.avatar == null
                  //     ? 'avata'
                  //     : Image(
                  //         image: NetworkImage(
                  //             profileProvider.info.result!.profile.avatar)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  profileProvider.info.result?.profile.fullName == null
                      ? "Name"
                      : profileProvider.info.result!.profile.fullName,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Image.network(profileProvider.info.result!.profile.avatar)
          ],
        ),
      ),
//---------------
      endDrawer: NavigationDrawer(
        // ignore: prefer_if_null_operators
        name: profileProvider.info.result?.profile.fullName == null
            ? "Name"
            : profileProvider.info.result!.profile.fullName,
        avatar: profileProvider.info.result?.profile.avatar == null
            ? "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/800px-Default_pfp.svg.png"
            : profileProvider.info.result!.profile.avatar,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: size.width,
                height: size.height * 0.5,
                color: kBackgroundColor,
                child: Column(
                  children: [
                    profileProvider.info.result == null
                        ? const Center(child: CircularProgressIndicator())
                        : Container(
                            margin: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // Text(
                                  //   'Chào, ' +
                                  //       profileProvider
                                  //           .info.result!.profile.fullName,
                                  //   style: const TextStyle(
                                  //       fontSize: 24,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  // const SizedBox(
                                  //   height: 10,
                                  // ),
                                  const Text(
                                    'Tuần này bạn ăn gì?',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    packageCategoryProvider.listPackageCategory.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            height: 112,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: packageCategoryProvider
                                  .listPackageCategory.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                        width: 90,
                                        // height: 120,
                                        decoration: const BoxDecoration(
                                          boxShadow: null,
                                        ),
                                        child: CardCategoryItem(
                                            packageCategory:
                                                packageCategoryProvider
                                                        .listPackageCategory[
                                                    index])),
                                  ],
                                );
                              },
                            ),
                          )
                  ],
                ),
              ),
              packageProvider.listPackgeActive.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      width: size.width,
                      margin: const EdgeInsets.only(top: 180),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      // child: Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     const Text(
                      //       'Gói ăn ',
                      //       textAlign: TextAlign.left,
                      //     ),
                      //     const SizedBox(
                      //       height: 20,
                      //     ),
                      //     SizedBox(
                      //       child: ListView.builder(
                      //           padding: const EdgeInsets.all(8),
                      //           shrinkWrap: true,
                      //           itemCount:
                      //               packageProvider.listPackgeActive.length,
                      //           itemBuilder: (context, index) {
                      //             return CardPackage(
                      //                 package: packageProvider
                      //                     .listPackgeActive[index]);
                      //           }),
                      //     )
                      //   ],
                      // ),
                      // child: SizedBox(
                      //   height: size.height,
                      //   child: ListView.builder(
                      //       padding: const EdgeInsets.all(8),
                      //       shrinkWrap: true,
                      //       itemCount: packageProvider.listPackgeActive.length,
                      //       itemBuilder: (context, index) {
                      //         return CardPackage(
                      //             package:
                      //                 packageProvider.listPackgeActive[index]);
                      //       }),
                      // ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart,
                                      color: kBackgroundColor,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Đặt ngay!',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                      // textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          for (int i = 0;
                              i < packageProvider.listPackgeActive.length;
                              i++)
                            GestureDetector(
                              onTap: () {
                                packageProvider.getPackageDetail(context,
                                    packageProvider.listPackgeActive[i].id);
                              },
                              child: Column(
                                children: [
                                  CardPackage(
                                      package:
                                          packageProvider.listPackgeActive[i]),
                                  const SizedBox(
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
}
