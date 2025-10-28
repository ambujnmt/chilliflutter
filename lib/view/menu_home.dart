import 'package:flutter/material.dart';
import 'package:simple_floating_bottom_nav_bar/floating_bottom_nav_bar.dart';
import 'package:simple_floating_bottom_nav_bar/floating_item.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({super.key});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  final List<FloatingBottomNavItem> bottomNavItems = [
    FloatingBottomNavItem(
      inactiveIcon: Image.asset(
        'assets/image/home.png',
        width: 22,
        height: 22,
        color: Colors.white,
      ),
      activeIcon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          'assets/image/home.png',
          width: 22,
          height: 22,
          color: Colors.black,
        ),
      ),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Image.asset(
        'assets/image/search_icons.png',
        width: 22,
        height: 22,
      ),
      activeIcon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          'assets/image/search_icons.png',
          width: 22,
          height: 22,
          color: Colors.black,
        ),
      ),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Image.asset(
        'assets/image/store.png',
        width: 22,
        height: 22,
      ),
      activeIcon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          'assets/image/store.png',
          width: 22,
          height: 22,
          color: Colors.black,
        ),
      ),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Image.asset(
        'assets/image/add.png',
        width: 22,
        height: 22,
      ),
      activeIcon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          'assets/image/add.png',
          width: 22,
          height: 22,
          color: Colors.black,
        ),
      ),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Image.asset(
        'assets/image/group.png',
        width: 22,
        height: 22,
      ),
      activeIcon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          'assets/image/group.png',
          width: 22,
          height: 22,
          color: Colors.black,
        ),
      ),
    ),
    FloatingBottomNavItem(
      inactiveIcon: Image.asset(
        'assets/image/boy.png',
        width: 22,
        height: 22,
      ),
      activeIcon: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          'assets/image/boy.png',
          width: 22,
          height: 22,
        ),
      ),
    ),
  ];

  final List<Widget> pages = [
    const Text('first screen'),
    const Text('second screen'),
    const Text('third screen'),
    const Text('fourth screen'),
    const Text('five screen'),
    const Text('six screen'),
  ];

  @override
  Widget build(BuildContext context) {
    return FloatingBottomNavBar(
      pages: pages,
      items: bottomNavItems,
      initialPageIndex: 0,
      backgroundColor: Colors.grey.shade800,
      elevation: 0,
      radius: 100,
      width: 320,
      height: 65,
    );
  }
}
