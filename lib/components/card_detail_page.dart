import 'package:applifting/components/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardDetailPage extends StatefulWidget {
  final String? title;
  const CardDetailPage({this.title, super.key});

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20),
            Text(
              'Detail page of $widget.title',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
