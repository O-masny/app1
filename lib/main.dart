import 'package:applifting/components/card_detail_page.dart';
import 'package:applifting/components/launch_card.dart';
import 'package:applifting/components/main_navigation.dart';
import 'package:applifting/services/api.dart';
import 'package:applifting/services/enums.dart';
import 'package:flutter/material.dart';

void main() {
 final spacex = ApiSpacex();
spacex.fetchCompany();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      routes: {
        'card_detail': (context) => const CardDetailPage(),
      },
      home: MainNavigation(),
    );
  }
}
