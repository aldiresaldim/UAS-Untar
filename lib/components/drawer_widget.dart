import 'package:flutter/material.dart';
import 'package:marvel/constants/string_constants.dart';
import '../utils/routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black54),
            accountEmail: const Text("aldi.825200008@stu.untar.ac.id"),
            accountName: const Text("Aldi"),
            currentAccountPicture: const CircleAvatar(
              child: Text("A"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text(StringConstants.myCount),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(color: Colors.white),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text(StringConstants.myCount),
            onTap: () {
              Navigator.pushNamed(context, Routes.myListPage);
            },
          ),
          const Divider(color: Colors.white),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.white),
            title: const Text(StringConstants.favorites),
            onTap: () {
              Navigator.pushNamed(context, Routes.favorites);
            },
          ),
          const Divider(color: Colors.white),
        ],
      ),
    );
  }
}
