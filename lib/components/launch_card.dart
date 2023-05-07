import 'package:flutter/material.dart';

class LaunchCard extends StatefulWidget {
  final String title;
  const LaunchCard(this.title, {super.key});

  @override
  State<LaunchCard> createState() => _LaunchCardState();
}

class _LaunchCardState extends State<LaunchCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        height: size.height / 3,
        width: (size.width / 2) - 16,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 25),
              ),
              Divider(),
              Text(
                'mored info',
                style: TextStyle(fontSize: 15),
              ),
              Divider(),
              Text(
                'mored info',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
