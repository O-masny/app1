import 'package:http/http.dart';
import 'package:spacex_api/models/capsule.dart';
import 'package:spacex_api/models/company/company.dart';
import 'package:spacex_api/models/pagenated_response.dart';
import 'package:spacex_api/models/query/options.dart';
import 'package:spacex_api/models/starlink/starlink.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:spacex_api/utils.dart';
import 'dart:convert' as convert;

class ApiSpacex {
  final api = SpaceXApi();

  Future<void> _fetchSingleCapsule(SpaceXApi api) async {
    final response = await api.getCapsuleById(id: "5e9e2c5cf359183bb73b266e");
    if (response.statusCode == 200) {
      final json = Utils.parseResponseAsJson(response);
      final capsule = Capsule.fromJson(json);
      print("Fetch Single Capsule serial -> ${capsule.waterLandings}");
    }
  }

  Future<void> _fetchCapsule(String id) async {
    final response = await api.getCapsuleById(id: id);
    if (response.statusCode == 200) {
      final json = Utils.parseResponseAsJson(response);
      final capsule = Capsule.fromJson(json);
      print("Fetch Single Capsule serial -> ${capsule.type}");
    }
  }

  Future<List<Starlink>?> fetchAllStarlink() async {
    try {
      final response = await api.getAllStarlinks();
      if (response.statusCode == 200) {
        List<Starlink> data = Utils.convertResponseToList<Starlink>(
            response, (e) => Starlink.fromJson(e));
        return data;
      }
    } catch (err) {
      err.toString();
    }
  }
  Future<Company?> fetchCompany() async {
    try {
      final response = await api.getCompany();
      if (response.statusCode == 200) {

        final json = Utils.parseResponseAsJson(response);
        final company = Company.fromJson(json);
        return company;
      }
    } catch (err) {
      err.toString();
    }
  }
  Future<void> _queryStarlinks() async {
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
      PagenatedResponse pagenatedResponse =
          PagenatedResponse.fromJson(jsonResp);
      List<Starlink> data = pagenatedResponse.docs
          .map((e) => Starlink.fromJson(e))
          .cast<Starlink>()
          .toList();
      print("Qeury Starlinks ");
      data.forEach((element) {
        _fetchSingleCapsule(api);

        print(element.id);
      });
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
}
