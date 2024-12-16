import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:patch_assignment/features/home/view/home_view.dart';
import 'package:patch_assignment/app/resources/app_strings.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({super.key});
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  final List<Widget> _screens = [
    HomeView()
  ];

  final List<PersistentBottomNavBarItem> _navBarItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      activeColorPrimary: Colors.purpleAccent,
      inactiveColorPrimary: Colors.black38
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_bag_outlined),
      activeColorPrimary: Colors.purpleAccent,
      inactiveColorPrimary: Colors.black38
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add_circle_outline_rounded),
      activeColorPrimary: Colors.purpleAccent,
      inactiveColorPrimary: Colors.black38
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.inbox_outlined),
      activeColorPrimary: Colors.purpleAccent,
      inactiveColorPrimary: Colors.black38
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.person_2_outlined),
      activeColorPrimary: Colors.purpleAccent,
      inactiveColorPrimary: Colors.black38
    )
  ];


  @override
  Widget build(BuildContext context) {
    return 
      PersistentTabView(
        context, 
        controller: _controller,
        screens: _screens,
        items: _navBarItems,
        animationSettings: const NavBarAnimationSettings(navBarItemAnimation: ItemAnimationSettings(curve: Curves.bounceIn)),
    );
  }
}