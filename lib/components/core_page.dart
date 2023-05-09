import 'package:applifting/components/cards_custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/enums.dart';

class CorePage extends StatefulWidget {
  final PageType type;

  const CorePage(this.type, {Key? key}) : super(key: key);

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  @override
  Widget build(BuildContext context) {
    getType(widget.type);
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('SpaceX'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 25),
                )),
            FlightCard(SpaceFlights.upcomingFlights, ''),
            FlightCard(SpaceFlights.previousFlights, ''),
          ],
        ),
      ),
      const Positioned.fill(
        //
        child: Opacity(
          opacity: 0.1,
          child: Image(
            image: AssetImage('assets/spacex_bg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ]);
  }

  var title;

  void getType(PageType type) {
    setState(() {
      switch (type) {
        case PageType.about:
          {
            title = ("About SpaceX");
          }
          break;

        case PageType.homepage:
          {
            title = ("Homepage");
          }
          break;

        case PageType.launches:
          {
            title = ("Launches");
          }
          break;

        default:
          title = '';
          break;
      }
    });
  }
}
