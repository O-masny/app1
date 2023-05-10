import 'package:applifting/components/core_page.dart';
import 'package:flutter/material.dart';

import '../services/api.dart';
import '../services/enums.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  MainNavigationState createState() => MainNavigationState();
}

class MainNavigationState extends State {
  int _selectedTab = 0;
  final api = ApiSpacex();
  ScrollController _scrollController = ScrollController();
  late var company;

  int counter = 0;
  bool loading = false;
  PageType? type = PageType.homepage;
  late var launches;
  late var starlionks;

  final List pages = [
    CorePage(PageType.homepage),
    CorePage(PageType.launches),
    CorePage(PageType.about),
  ];

  @override
  void initState() {
    super.initState();
    if (type == PageType.launches) {
      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          starlionks = api.queryStarlinks();
        }
      });
    }
    if (type == PageType.homepage) {
      company = api.fetchCompany();
    }
  }

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
      if (pages[_selectedTab] == PageType.launches) {}
      if (pages[_selectedTab] == PageType.homepage) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CorePage(
        PageType.values[_selectedTab],
        key: UniqueKey(),
      ),
      appBar: AppBar(
        title: Text('SpaceX'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
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
