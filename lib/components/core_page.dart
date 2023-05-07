import 'package:applifting/components/cards_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/enums.dart';
import '../services/page_selector.dart';

class CorePage extends StatelessWidget with PageSelector {
  final PageType type;

  const CorePage(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('SpaceX'),centerTitle: true,),
      body: Column(
        children: [
          Text('TITLE', style: TextStyle(fontSize: 25),),
          const MyWidget(),
          const MyWidget(),

        ],
      ),
    );
  }

  String? getType(type) {
    switch (type) {
      case PageType.ABOUT: {  return("About SpaceX"); }
      break;

      case PageType.HOMEPAGE: {  return("Homepage"); }
      break;

      case PageType.LANCHES: {  return("Launches"); }
      break;

      default:
      break;
    }
  }
}
class CorePageContent extends StatefulWidget {
  const CorePageContent({Key? key}) : super(key: key);

  @override
  State<CorePageContent> createState() => _CorePageContentState();
}

class _CorePageContentState extends State<CorePageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('TITLE', style: TextStyle(fontSize: 25),),
        const MyWidget(),
        const MyWidget(),

      ],
    );
  }
}
