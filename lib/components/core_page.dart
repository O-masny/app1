import 'package:applifting/components/cards_custom.dart';
import 'package:applifting/services/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spacex_api/models/company/company.dart';

import '../services/enums.dart';

class CorePage extends StatefulWidget {
  final PageType type;

  CorePage(this.type, {Key? key}) : super(key: key);

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  final api = ApiSpacex();
  late var company;

  @override
  void initState() {
    company = api.fetchCompany();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getType(widget.type);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              widget.type == PageType.about
                  ? about_body()
                  : Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              title,
                              style: const TextStyle(fontSize: 25),
                            )),
                        const FlightCard(SpaceFlights.upcomingFlights, ''),
                        const FlightCard(SpaceFlights.previousFlights, ''),
                      ],
                    ),
            ],
          ),
        ),
        const IgnorePointer(
          child: Positioned.fill(
            //
            child: Opacity(
              opacity: 0.2,
              child: Image(
                image: AssetImage('assets/spacex_bg.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
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

  Widget about_body() => FutureBuilder<Company>(
        future: company,
        builder: (BuildContext context, AsyncSnapshot<Company?> snapshot) =>
            snapshot.hasData
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CompanyTag(
                            title: 'CEO',
                            path: 'assets/space.jpg',
                            description: snapshot.data?.ceo ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CompanyTag(
                            title: 'CEO',
                            path: 'assets/space.jpg',
                            description: snapshot.data?.ceo ?? ''),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  ),
      );
}
