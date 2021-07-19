import 'package:fasters/pages/map/MapSearchPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'dart:io';
import 'dart:math';

class MapPage extends StatefulWidget {
  @override
  _MapPage createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            flex: 1,
            child: Column(
              children: [MapSearchPage()],
            )),
        Expanded(
            flex: 3,
            child: Container(
              child: MapboxMap(
                accessToken:
                    'pk.eyJ1Ijoic3VhcmV6ZHN6IiwiYSI6ImNrcXBuNHgzazE4czYycHBxbDJkZjRkYmYifQ.3o54WARdIacyOXJkxIfVwg',
                onMapCreated: _onMapCreated,
                onMapLongClick: _onMapLongClickCallback,
                onStyleLoadedCallback: () => addCircle(mapController),
                initialCameraPosition:
                    const CameraPosition(target: LatLng(8.353311, -62.680403)),
              ),
            )),
      ],
    ));
  }

  void addCircle(MapboxMapController mapBoxController) {
    mapBoxController.addLine(
      LineOptions(
        geometry: [
          LatLng(-62.680143, 8.352714),
          LatLng(-62.680141, 8.352715),
          LatLng(-62.680049, 8.352749),
          LatLng(-62.679288, 8.353042),
          LatLng(-62.678031, 8.353567),
          LatLng(-62.677241, 8.35393),
          LatLng(-62.676277, 8.354417),
          LatLng(-62.676253, 8.354429),
          LatLng(-62.676234, 8.354439),
          LatLng(-62.676178, 8.354467),
          LatLng(-62.675396, 8.354875),
          LatLng(-62.675275, 8.354938),
          LatLng(-62.675092, 8.355034),
          LatLng(-62.674936, 8.355113),
          LatLng(-62.674271, 8.355452),
          LatLng(-62.67352, 8.355851),
          LatLng(-62.672438, 8.35642),
          LatLng(-62.672256, 8.356515),
          LatLng(-62.672178, 8.356556),
          LatLng(-62.672108, 8.356593),
          LatLng(-62.671968, 8.356667),
          LatLng(-62.671545, 8.356887),
          LatLng(-62.671098, 8.357125),
          LatLng(-62.670652, 8.357375),
          LatLng(-62.669995, 8.357768),
          LatLng(-62.669147, 8.358322),
          LatLng(-62.668589, 8.358676),
          LatLng(-62.667921, 8.359111),
          LatLng(-62.667231, 8.359577),
          LatLng(-62.66659, 8.360039),
          LatLng(-62.66638, 8.36019),
        ],
        lineColor: "#ff0000",
        lineWidth: 7.0,
        lineOpacity: 0.5,
      ),
    );
  }

  void _onMapLongClickCallback(Point<double> point, LatLng coordinates) {
    print(coordinates);
    mapController.addSymbol(
        SymbolOptions(geometry: coordinates, iconImage: "airport-15"));
  }
}
