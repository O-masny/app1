import 'package:applifting/components/single_tile.dart';
import 'package:flutter/material.dart';
import 'package:spacex_api/models/company/company.dart';

import 'company_tag.dart';

class CompanyContent extends StatelessWidget {
  final Company company;

  const CompanyContent(this.company, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompanyTag(
            title: 'Headquarters',
            path: 'assets/spacex_building.jpeg',
            description: company.headquarters.address ?? ''),
        SingleTile('Employees', company.employees.toString(), Icons.people),
        SingleTile('City', company.headquarters.city.toString(), Icons.house),
        SingleTile('State', company.headquarters.state, Icons.location_city),
        SingleTile('Founded in', company.founded.toString(),
            Icons.lightbulb_circle_outlined),
        SingleTile('Launchsites', company.launchSites.toString(), Icons.rocket),
      ],
    );
  }
}
