import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/enums.dart';

class FlightCard extends StatelessWidget {
  final SpaceFlights type;
  final String rocket;

  const FlightCard(this.type, this.rocket, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('card_detail');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type == SpaceFlights.previousFlights
                ? 'Previous flights'
                : 'Upcoming flights',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              // Define the child widgets of the card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Cards Title 2",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey[800],
                          ),
                        ),
                        // Add a space between the title and the text
                        Container(height: 10),
                        // Display the card's text using a font size of 15 and a light grey color
                        Text(
                          'MyStringsSample.card_text,',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        // Add a row with two buttons spaced apart and aligned to the right side of the card
                        Row(
                          children: <Widget>[
                            // Add a spacer to push the buttons to the right side of the card
                            const Spacer(),
                            // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                              ),
                              child: const Text(
                                "EXPLORE",
                                style: TextStyle(color: Colors.amber),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Add a small space between the card and the next widget
                  Container(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
