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
          LatLng(8.353007, -62.680867),
          LatLng(8.353007, -62.680867),
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
