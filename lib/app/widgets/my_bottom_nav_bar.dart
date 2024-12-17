import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patch_assignment/features/home/view/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'package:patch_assignment/app/resources/app_theme.dart';
import 'package:patch_assignment/app/resources/app_strings.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeView(),
      const Center(child: Text("Cart Screen", style: TextStyle(fontSize: 20))),
      const Center(child: Text("Selling Screen", style: TextStyle(fontSize: 20))),
      const Center(child: Text("Inbox Screen", style: TextStyle(fontSize: 20))),
      const Center(child: Text("Profile Screen", style: TextStyle(fontSize: 20))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: AppStrings.discover, 
        activeColorPrimary: AppTheme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag_outlined),
        title: AppStrings.cart, 
        activeColorPrimary: AppTheme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_circle_outline_outlined),
        title: AppStrings.sell, 
        activeColorPrimary: AppTheme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline_rounded),
        title: AppStrings.inbox, 
        activeColorPrimary: AppTheme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: AppStrings.profile, 
        activeColorPrimary: AppTheme.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      navBarStyle: NavBarStyle.style3,
      backgroundColor: Colors.white,
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
