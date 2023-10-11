import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:coffee_shop/presentation/pages/HomePage/home_page.dart';
import 'package:coffee_shop/presentation/pages/Orders/orders_page.dart';
import 'package:coffee_shop/presentation/pages/Profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 1;
  final NotchBottomBarController controller =
      NotchBottomBarController(index: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: AnimatedNotchBottomBar(
          color: MyColors.kPrimaryColor,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(
                Icons.coffee,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.coffee,
                color: MyColors.kSecondaryColor,
              ),
              itemLabel: 'Orders',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home_filled,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.home_filled,
                color: MyColors.kSecondaryColor,
              ),
              itemLabel: 'Home',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.person,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.person,
                color: MyColors.kSecondaryColor,
              ),
              itemLabel: 'Profile',
            ),
          ],
          notchBottomBarController: controller,
          onTap: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
        backgroundColor: MyColors.kPrimaryColor,
        body: _body(context));
  }

  _body(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(bottom: false, child: _getThePage()),
    );
  }

  _getThePage() {
    switch (currentIndex) {
      case 0:
        return const OrdersPage();
      case 1:
        return const HomePage();
      case 2:
        return const ProfilePage();
    }
  }
}
