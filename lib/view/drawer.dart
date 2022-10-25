import 'package:flutter/material.dart';
import 'package:mobile_capstone_fpt/constants/app_color.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key, required this.name, required this.avatar})
      : super(key: key);
  String name;
  String avatar;

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
        color: Color(0xffffcc33),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  buildMenuItem(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
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
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text('Trang chủ'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: Text('Lịch sử'),
              onTap: () {
                Navigator.pushNamed(context, '/history');
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text('Thông báo'),
              onTap: () {},
            )
          ],
        ),
      );
}
