import 'package:applifting/components/cards_custom.dart';
import 'package:applifting/services/api.dart';
import 'package:applifting/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spacex_api/models/company/company.dart';
import 'package:spacex_api/models/starlink/starlink.dart';

import '../services/enums.dart';
import 'company_tag.dart';

class CorePage extends StatefulWidget {
  final PageType type;

  CorePage(this.type, {Key? key}) : super(key: key);

  @override
  State<CorePage> createState() => CorePageState();
}

class CorePageState extends State<CorePage> {
  final api = ApiSpacex();
  late var company;

  late var launches;

  @override
  void initState() {
    super.initState();
    if (widget.type == PageType.launches) {
      launches = api.queryStarlinks();
    }
    if (widget.type == PageType.about) {
      company = api.fetchCompany();
    }
  }

  @override
  Widget build(BuildContext context) {
    getType(widget.type);

    return Stack(
      fit: StackFit.passthrough,
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.type == PageType.about
                  ? about_body()
                  : widget.type == PageType.launches
                      ? _getStarlinks()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CompanyTag(
                              title: 'CEO',
                              path: 'assets/space.jpg',
                              description: snapshot.data?.ceo ?? ''),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          child: Divider(
                            color: Colors.orange,
                            height: 8,
                            thickness: 5,
                          ),
                        ),
                        const Text(
                          'About SpaceX',
                          style: MyTheme.titleStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data?.summary ?? '',
                            style: MyTheme.descriptionStyle,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CompanyTag(
                                title: 'CEO',
                                path: 'assets/spacex_building.jpeg',
                                description:
                                    snapshot.data?.headquarters.address ?? ''),
                          ],
                        )
                      ],
                    ),
                  )
                : Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      child: const CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  ),
      );

  Widget _getStarlinks() => FutureBuilder<List<Starlink?>>(
        future: launches,
        builder: (BuildContext context,
                AsyncSnapshot<List<Starlink?>> snapshot) =>
            snapshot.hasData
                ? Center(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(snapshot.data![index]?.launch ?? ''),
                              trailing:
                                  Text(snapshot.data![index]?.version ?? ''),
                              subtitle: Text(snapshot.data![index]?.id ?? ''));
                        }))
                : Center(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      child: const CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                  ),
      );
}
