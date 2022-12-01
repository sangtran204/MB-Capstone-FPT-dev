import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/apis/rest_api.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PackageCategory>? listPackageCategory = [];
  List<Package>? listPackgeActive = [];
  Result? profileResult;

  String _value = 'Đại Học FPT';
  @override
  void initState() {
    super.initState();
    final SecureStorage secureStorage = SecureStorage();
    secureStorage.readSecureData("token").then((token) => {
          PackageCategoryRepoImpl()
              .getPackageCategory(RestApi.getCategoryPackage, token)
              .then((value) {
            setState(() {
              listPackageCategory = value.result;
            });
          }),
          PackageRepoImpl()
              .getActivePackage(RestApi.getActivePackage, token)
              .then((value) {
            setState(() {
              listPackgeActive = value.result;
            });
          }),
          ProfileRepoImpl()
              .getProfile(RestApi.profileMyPath, token)
              .then((value) {
            setState(() {
              profileResult = value.result;
            });
          })
        });
  }

  @override
  Widget build(BuildContext context) {
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
            const Icon(
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
              items: <DropdownMenuItem<String>>[
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
      endDrawer: NavigationDrawer(
        name: profileResult == null
            ? "Null Name"
            : profileResult!.profile.fullName,
        avatar: profileResult == null
            ? "Null Avatar"
            : profileResult!.profile.avatar,
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
                    profileResult == null
                        ? const Center(child: CircularProgressIndicator())
                        : Container(
                            margin: const EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  Text(
                                    'Chào, ' + profileResult!.profile.fullName,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Bạn muốn ăn gì?',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    listPackageCategory!.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            height: 112,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: listPackageCategory!.length,
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
                                                listPackageCategory![index])),
                                  ],
                                );
                              },
                            ),
                          )
                  ],
                ),
              ),
              listPackgeActive!.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      width: size.width,
                      margin: const EdgeInsets.only(top: 210),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Gói ăn ',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                shrinkWrap: true,
                                itemCount: listPackgeActive!.length,
                                itemBuilder: (context, index) {
                                  return CardPackage(
                                      package: listPackgeActive![index]);
                                }),
                          )
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
