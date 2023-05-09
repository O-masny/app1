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

  final List pages = [
     CorePage(PageType.homepage),
     CorePage(PageType.launches),
     CorePage(PageType.about),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: pages[_selectedTab],
      appBar: AppBar(title: Text('SpaceX'),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Launches"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3_outlined), label: "About"),
        ],
      ),
    );
  }
}
