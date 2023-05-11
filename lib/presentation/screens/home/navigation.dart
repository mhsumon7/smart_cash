import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/dashboard_controller.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/style_manager.dart';


class NavigationBarDrawer extends StatelessWidget {
  const NavigationBarDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Scaffold(
        body: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colormanager.white,
              ),
              child: Center(child: Text('Smart Cash',style: getBoldStyle(color: Colormanager.primary,fontSize: 40),)),
            ),
            ListTile(
              leading: Icon(
                Icons.bar_chart,
                color: Colormanager.primary,
              ),
              selectedColor: Colormanager.primary.withOpacity(0.7),
              contentPadding:
              const EdgeInsets.only(left: 14),
              title: Text(
                'Your Activity',
                style: getBoldStyle(
                    color: Colormanager.darkGrey,
                    fontSize: 16),
              ),
              onTap: () {
              },
            ),
             const Divider(),
            ListTile(
              leading: const Icon(Icons.flag_outlined),
              selectedColor: Colormanager.primary.withOpacity(0.7),
              contentPadding:
              const EdgeInsets.only(left: 14),
              iconColor: Colormanager.primary,
              title: Text(
                'Clims',
                style: getBoldStyle(
                    color: Colormanager.darkGrey,
                    fontSize: 16),
              ),
              onTap: () {
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.rocket_launch,
                color: Colormanager.red,
              ),
              selectedColor: Colormanager.primary.withOpacity(0.7),
              contentPadding:
              const EdgeInsets.only(left: 14),
              title: Text(
                'Boosts',
                softWrap: true,
                style: getBoldStyle(
                    color: Colormanager.darkGrey,
                    fontSize: 16),
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.money),
              selectedColor: Colormanager.primary.withOpacity(0.7),
              contentPadding:
              const EdgeInsets.only(left: 14),
              iconColor: Colormanager.primary,
              title: Text(
                'Bonus Cashback',
                softWrap: true,
                style: getBoldStyle(
                    color: Colormanager.darkGrey,
                    fontSize: 16),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              selectedColor: Colormanager.primary.withOpacity(0.7),
              contentPadding: const EdgeInsets.only(left: 14),
              iconColor: Colormanager.primary,
              title: Text(
                'Logout',
                softWrap: true,
                style: getBoldStyle(
                    color: Colormanager.darkGrey, fontSize: 16),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.find<DashboardController>().getLogout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
