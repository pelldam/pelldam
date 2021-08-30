import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';

import 'package:foodie/user_screen/screen/home_screen.dart';
import 'package:foodie/user_screen/screen/my_order.dart';

import 'package:foodie/user_screen/screen/searchA_screen.dart';

import 'profile/nav_profile.dart';

class UserNavScreen extends StatefulWidget {
  UserNavScreen({Key? key}) : super(key: key);

  static const routeName = "/nav_screen";

  @override
  _UserNavScreenState createState() => _UserNavScreenState();
}

class _UserNavScreenState extends State<UserNavScreen> {
  late List<Widget> _screens;

  @override
  void initState() {
    _screens = [
      HomeScreen(),

      // Search
      NavSearchScreen(),

      // Orders
      MyOrder(),

      NavProfile()
      // Profile
    ];
    super.initState();
  }

  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.grey,
          selectedItemColor: UIData.kbrightColor,
          currentIndex: _selectedIndex,
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).bottomAppBarColor,
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).bottomAppBarColor,
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).bottomAppBarColor,
              icon: Icon(Icons.receipt),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).bottomAppBarColor,
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
