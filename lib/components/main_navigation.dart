import 'package:applifting/components/cards_custom.dart';
import 'package:applifting/components/core_page.dart';
import 'package:applifting/components/homepage.dart';
import 'package:flutter/material.dart';

import '../services/enums.dart';

class MainNavigation extends StatefulWidget {

  const MainNavigation({Key? key}) : super(key: key);

  @override
  MainNavigationState createState() => MainNavigationState();
}

class MainNavigationState extends State {
  int _selectedTab = 0;

  final List _pages = [
    CorePage(PageType.ABOUT),  CorePage(PageType.ABOUT),  CorePage(PageType.ABOUT),




  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab], appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Company"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3_outlined), label: "Launches"),
        ],

      ),
    );
  }
}