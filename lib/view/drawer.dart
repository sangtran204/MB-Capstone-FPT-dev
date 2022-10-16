import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
            ListTile(
              leading: const Icon(Icons.home),
              title: Text('Trang chủ'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: Text('Lịch sử'),
              onTap: () {},
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
