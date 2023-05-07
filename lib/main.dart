import 'package:applifting/components/card_detail_page.dart';
import 'package:applifting/components/launch_card.dart';
import 'package:applifting/services/enums.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spacex_api/models/capsule.dart';
import 'package:spacex_api/models/pagenated_response.dart';
import 'package:spacex_api/models/query/options.dart';
import 'package:spacex_api/models/starlink/starlink.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_api/utils.dart';
import 'dart:convert' as convert;

import 'components/homepage.dart';

void main() {
  final api = SpaceXApi();
  _fetchSingleCapsule(api);

  // Get all objects
  _fetchAllStarlink(api);

  // Query objects
  _queryStarlinks(api);
  runApp(const MainApp());
}

Future<void> _fetchSingleCapsule(SpaceXApi api) async {
  final response = await api.getCapsuleById(id: "5e9e2c5cf359183bb73b266e");
  if (response.statusCode == 200) {
    final json = Utils.parseResponseAsJson(response);
    final capsule = Capsule.fromJson(json);
    print("Fetch Single Capsule serial -> ${capsule.serial}");
  }
}

Future<void> _fetchAllStarlink(SpaceXApi api) async {
  final response = await api.getAllStarlinks();
  if (response.statusCode == 200) {
    List<Starlink> data = Utils.convertResponseToList<Starlink>(
        response, (e) => Starlink.fromJson(e));
    print("Fetch Starlinks ${data.length}");
  }
}

Future<void> _queryStarlinks(SpaceXApi api) async {
  final query = Options();
  query.limit = 25;
  query.page = 1;
  query.pagination = true;
  query.select = [
    "version",
    "height_km",
    "longitude",
  ];
  var queryJson = convert.jsonEncode(query.toJson());

  final response = await api.queryStarlinks(query: queryJson);
  if (response.statusCode == 200) {
    final jsonResp = Utils.parseResponseAsJson(response);
    PagenatedResponse pagenatedResponse = PagenatedResponse.fromJson(jsonResp);
    List<Starlink> data = pagenatedResponse.docs
        .map((e) => Starlink.fromJson(e))
        .cast<Starlink>()
        .toList();
    print("Qeury Starlinks ${data.length}");
  }

  // Alternative solution
  // final json = _parseResponse(response);
  // if (json != null) {
  //   PagenatedResponse resp = PagenatedResponse.fromJson(json);

  //   List<Starlink> data =
  //       resp.docs.map((e) => Starlink.fromJson(e)).cast<Starlink>().toList();
  //   print("Qeury Starlinks ${data.length}");
  // }
}

// More examples
_parseResponse(Response response) {
  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

fromJsonList<T>(List json, Function func) {
  List caps = json.map((e) => func(e)).cast<T>().toList();
  return caps;
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
      home: HomepageCore(),
    );
  }
}
