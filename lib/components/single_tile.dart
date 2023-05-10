import 'package:applifting/services/theme.dart';
import 'package:flutter/material.dart';

class SingleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const SingleTile(
    this.title,
    this.subtitle,
    this.icon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            tileColor: Colors.white.withOpacity(0.1),
            title: Text(title),
            subtitle: Text(subtitle),
            leading: Icon(icon),
          ),
        ),
        Divider(color: MyTheme.color1, thickness: 5,)
      ],
    );
  }
}
