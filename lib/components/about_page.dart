import 'package:applifting/components/core_page.dart';
import 'package:applifting/services/enums.dart';
import 'package:flutter/cupertino.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CorePage(PageType.about);
  }
}
