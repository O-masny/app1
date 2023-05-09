import 'package:applifting/components/core_page.dart';
import 'package:applifting/services/enums.dart';
import 'package:flutter/material.dart';

class HomepageCore extends StatefulWidget {
  const HomepageCore({Key? key}) : super(key: key);

  @override
  State<HomepageCore> createState() => _HomepageCoreState();
}

class _HomepageCoreState extends State<HomepageCore> {
  @override
  Widget build(BuildContext context) {
    return const CorePage(PageType.homepage);
  }
}
