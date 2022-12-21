import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/config/provider/subscription_provider.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key, required this.name, required this.avatar})
      : super(key: key);
  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItem(context),
            ],
          ),
        ),
      );

  buildHeader(BuildContext context) => Container(
        color: yellowColor,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  buildMenuItem(BuildContext context) {
    SubscriptionProvider subProvider =
        Provider.of<SubscriptionProvider>(context);
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          InkWell(
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      // color: kBackgroundColor
                      image: DecorationImage(
                        image: NetworkImage(avatar),
                        fit: BoxFit.fill,
                      )),
                  // child: Image(
                  //   image: AssetImage('assets/images/salad1.jpg'),
                  //   height: 50,
                  //   width: 50,
                  //   fit: BoxFit.fill,
                  // ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/Profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Trang chủ'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/HomePage');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Lịch sử'),
            onTap: () {
              subProvider.getSubByStatus(context, 'inProgress');
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.notifications),
          //   title: const Text('Thông báo'),
          //   onTap: () {},
          // )
        ],
      ),
    );
  }
}
