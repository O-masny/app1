import 'package:applifting/services/enums.dart';
import 'package:flutter/material.dart';

import 'main_navigation.dart';
import 'cards_custom.dart';
import 'launch_card.dart';
class HomepageCore extends StatefulWidget {
  const HomepageCore({Key? key}) : super(key: key);

  @override
  State<HomepageCore> createState() => _HomepageCoreState();
}

class _HomepageCoreState extends State<HomepageCore> {
  @override
  Widget build(BuildContext context) {
    return const MainNavigation();
  }
}
