import 'package:flutter/material.dart';
import 'package:mapbox_api/mapbox_api.dart';

class DirectionsMapPage extends StatefulWidget {
  @override
  _DirectionsMapPage createState() => _DirectionsMapPage();
}

class _DirectionsMapPage extends State<DirectionsMapPage> {
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
            body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  _RunDirections([8.3526, -62.6801]);
                },
                child: Text('Directions Traffic'),
              ),
              TextButton(
                onPressed: () {
                  _RunforwardDirections([8.3526, -62.6801]);
                },
                child: Text('Directions Forward'),
              ),
            ],
          ),
        )),
      );

  Future _RunDirections(punto1) async {
    MapboxApi mapbox = MapboxApi(
      accessToken:
          'pk.eyJ1Ijoic3VhcmV6ZHN6IiwiYSI6ImNrcXBuNHgzazE4czYycHBxbDJkZjRkYmYifQ.3o54WARdIacyOXJkxIfVwg',
    );

    final response = await mapbox.directions.request(
      profile: NavigationProfile.DRIVING_TRAFFIC,
      overview: NavigationOverview.FULL,
      geometries: NavigationGeometries.GEOJSON,
      steps: true,
      coordinates: <List<double>>[
        <double>[
          8.3526, -62.6801 // longitude
        ],
        <double>[
          8.3695, -62.6613 // longitude
        ],
      ],
    );

    if (response.error == null) {
      print('traffic accepted');
      final route = response.routes[0];
      response.routes.forEach((element) {
        print(element.geometry);
      });
      final eta = Duration(
        seconds: route.duration.toInt(),
      );
      print(eta.toString());
      print('Test Distance');
      response.routes.forEach((element) {
        print(element.distance.isNaN);
      });
    }
  }

  Future _RunforwardDirections(punto1) async {
    MapboxApi mapbox = MapboxApi(
      accessToken:
          'pk.eyJ1Ijoic3VhcmV6ZHN6IiwiYSI6ImNrcXBuNHgzazE4czYycHBxbDJkZjRkYmYifQ.3o54WARdIacyOXJkxIfVwg',
    );

    final response = await mapbox.forwardGeocoding.request(
      searchText: 'tour eiffel',
      fuzzyMatch: true,
      language: 'fr',
      proximity: <double>[
        8.354700517824822, -62.681017281556066

        /// longitude
      ],
    );

    if (response.error == null) {
      print('Forward Traffic');
    }
  }
}
