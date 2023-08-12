import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:the_job_finder/features/home/presentation/view/bottom_view/search_view.dart';

import '../../../search/presentation/view/Add_Job_view.dart';
import 'bottom_view/bookmark_view.dart';
import 'bottom_view/home_view.dart';
import 'bottom_view/profile_view.dart';

class dashBoardView extends StatefulWidget {
  const dashBoardView({super.key});

  @override
  State<dashBoardView> createState() => _dashBoardViewState();
}

class _dashBoardViewState extends State<dashBoardView> {
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
  void _showAddJobModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: AnimatedContainer(
            duration: const Duration(seconds: 5),
            curve: Curves.easeInOut,
            child: const Scaffold(
              body: AddJobView(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: lstBottomScreen[bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddJobModal,
        backgroundColor: const Color.fromARGB(255, 106, 180, 108),
        elevation: 1,
        shape: const CircleBorder(),
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
