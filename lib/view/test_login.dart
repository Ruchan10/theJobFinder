import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../features/home/presentation/view/bottom_view/bookmark_view.dart';
import '../features/home/presentation/view/bottom_view/home_view.dart';
import '../features/home/presentation/view/bottom_view/profile_view.dart';
import '../features/home/presentation/view/bottom_view/search_view.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  int bottomNavIndex = 0; //default index of a first screen
  final iconList = <IconData>[
    Icons.home,
    Icons.bookmark,
    Icons.search,
    Icons.person,
  ];
  void onTabTapped(int index) {
    setState(() {
      bottomNavIndex = index;
    });
  }

  List lstBottomScreen = [
    const homeView(),
    const BookmarkView(),
    const SearchView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 106, 180, 108),
        elevation: 12,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.green,
        icons: iconList,
        backgroundColor: const Color.fromARGB(255, 180, 239, 181),
        splashColor: const Color.fromARGB(255, 0, 116, 8),
        splashSpeedInMilliseconds: 600,
        activeIndex: bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: onTabTapped,
      ),
    );
  }
}
