import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

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
      body: Column(
        children: [
          Container(
            width: 1000,
            height: 500,
            child: MapboxMap(
              accessToken:
                  'pk.eyJ1Ijoic3VhcmV6ZHN6IiwiYSI6ImNrcXBuNHgzazE4czYycHBxbDJkZjRkYmYifQ.3o54WARdIacyOXJkxIfVwg',
              onMapCreated: _onMapCreated,
              onStyleLoadedCallback: () => addCircle(mapController),
              initialCameraPosition:
                  const CameraPosition(target: LatLng(8.353311, -62.680403)),
            ),
          )
        ],
      ),
    );
  }

  void addCircle(MapboxMapController mapBoxController) {
    mapBoxController.addSymbol(SymbolOptions(
        geometry: LatLng(8.366244, -62.644979), iconImage: "airport-15"));
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
}
