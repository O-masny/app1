
import 'package:applifting/services/theme.dart';
import 'package:flutter/cupertino.dart';

class CompanyTag extends StatelessWidget {
  final String title;
  final String description;
  final String path;

  const CompanyTag(
      {Key? key,
        required this.title,
        required this.description,
        required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: MyTheme.titleStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Image(
            height: width - 15,
            image: AssetImage(path),
          ),
        ),
        Text(
          description,
          style: MyTheme.titleStyle,
        ),
      ],
    );
  }
}
