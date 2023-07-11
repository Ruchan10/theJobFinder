import 'package:flutter/material.dart';
import 'package:the_job_finder/features/bookmark/presentation/view/add_bookmark_view.dart';
import 'package:the_job_finder/features/home/presentation/view/bottom_view/search_view.dart';

import 'bottom_view/home_view.dart';
import 'bottom_view/profile_view.dart';

class dashBoardView extends StatefulWidget {
  const dashBoardView({super.key});

  @override
  State<dashBoardView> createState() => _dashBoardViewState();
}

class _dashBoardViewState extends State<dashBoardView> {
  int _selectedIndex = 0;
  List lstBottomScreen = [
    const homeView(),
    const AddBookmarkView(),
    const SearchView(),
    const profileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 106, 180, 108),
        elevation: 12,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color.fromARGB(255, 101, 180, 103),
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Bookmarks'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
