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
import 'package:mobile_capstone_fpt/repositories/implement/package_category_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/implement/package_repo_impl.dart';
import 'package:mobile_capstone_fpt/repositories/implement/profile_repo_impl.dart';
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
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   // PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    //   setState(() {
    //     Provider.of<PackageCategoryProvider>(context, listen: false)
    //         .getPackageCategory(context);
    //     // packageProvider.getPackageCustomer(context);
    //     // listPackgeActive = packageProvider.listPackgeActive;
    //   });
    // });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   PackageCategoryProvider cateProvider =
    //       Provider.of<PackageCategoryProvider>(context);
    //   listPackageCategory = cateProvider.listPackageCategory;
    // });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    Provider.of<ProfileProvider>(context, listen: false).getProfile(context);
    Provider.of<PackageProvider>(context, listen: false)
        .getPackageCustomer(context);
    Provider.of<PackageCategoryProvider>(context, listen: false)
        .getPackageCategory(context);
    // });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<PackageProvider>(context, listen: false)
    //       .getPackageCustomer(context);
    // });
    // secureStorage.readSecureData("token").then((token) => {
    // PackageCategoryRepoImpl()
    //     .getPackageCategory(RestApi.getCategoryPackage, token)
    //     .then((value) {
    //   setState(() {
    //     listPackageCategory = value.result!;
    //   });
    // }),
    // PackageRepoImpl()
    //     .getActivePackage(RestApi.getActivePackage, token)
    //     .then((value) {
    //   setState(() {
    //     listPackgeActive = value.result!;
    //   });
    // }),
    // ProfileRepoImpl()
    //     .getProfile(RestApi.profileMyPath, token)
    //     .then((value) {
    //   setState(() {
    //     profileResult = value.result;
    //   });
    // }),
    // PackageRepoImpl()
    //     .getActivePackage(RestApi.getActivePackage, token)
    //     .then((value) {
    //   setState(() {
    //     listPackgeActive = value.result!;
    //   });
    // }),
    // PackageCategoryRepoImpl()
    //     .getPackageCategory(RestApi.getCategoryPackage, token)
    //     .then((value) {
    //   setState(() {
    //     listPackageCategory = value.result!;
    //   });
    // })
    // });
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
        backgroundColor: const Color(0xffffcc33),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[],
        ),
      ),
//---------------
      endDrawer: NavigationDrawer(
        // ignore: prefer_if_null_operators
        name: profileProvider.info.result?.profile.fullName == null
            ? "Null Name"
            : profileProvider.info.result!.profile.fullName,
        avatar: profileProvider.info.result?.profile.avatar == null
            ? "Null Avatar"
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
                                children: [
                                  Text(
                                    'Chào, ' +
                                        profileProvider
                                            .info.result!.profile.fullName,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Tuần này bạn ăn gì?',
                                    style: TextStyle(
                                      fontSize: 20,
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
                      margin: const EdgeInsets.only(top: 210),
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
                          // const Text(
                          //   'Gói ăn ',
                          //   textAlign: TextAlign.left,
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
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
