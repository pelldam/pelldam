import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/logic/const.dart';
import 'package:foodie/user_screen/screen/home_screen.dart';
import 'package:foodie/user_screen/screen/searchA_screen.dart';

//import 'package:foodigital_vendor/ui/features/home/dashboard/dashbord_page.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavigationBottomBar extends StatelessWidget {
  final PersistentTabController? controller;
  final bool? hideNavBar;

  NavigationBottomBar({this.controller, this.hideNavBar});

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      // DashboardPage(),
      NavSearchScreen(),
      Scaffold(),
      Scaffold()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      padding: NavBarPadding.only(top: 13, bottom: 13),
      stateManagement: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? kBottomNavigationBarHeight
          : 70,
      hideNavigationBarWhenKeyboardShows: true,
      popActionScreens: PopActionScreensType.once,
      bottomScreenMargin: 0.0,
      selectedTabScreenContext: (context) {
        context = context;
      },
      onItemSelected: (index) {
        print(index);
      },
      hideNavigationBar: hideNavBar,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        colorBehindNavBar: Color(0xFF05121E),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: "Home",
      activeColorPrimary: UIData.kbrightColor,
      inactiveColorPrimary: UIData.klightColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.search),
      title: "Search",
      activeColorPrimary: UIData.kbrightColor,
      inactiveColorPrimary: UIData.klightColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.ticket),
      title: "Orders",
      activeColorPrimary: UIData.kbrightColor,
      inactiveColorPrimary: UIData.klightColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person),
      title: "Profile",
      activeColorPrimary: UIData.kbrightColor,
      inactiveColorPrimary: UIData.klightColor,
    ),
  ];
}
