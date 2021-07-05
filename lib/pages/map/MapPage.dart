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
      body: Center(
        child: MapboxMap(
          accessToken:
              'pk.eyJ1Ijoic3VhcmV6ZHN6IiwiYSI6ImNrcXBuNHgzazE4czYycHBxbDJkZjRkYmYifQ.3o54WARdIacyOXJkxIfVwg',
          onMapCreated: _onMapCreated,
          onStyleLoadedCallback: () => addCircle(mapController),
          initialCameraPosition:
              const CameraPosition(target: LatLng(8.353311, -62.680403)),
        ),
      ),
    );
  }

  void addCircle(MapboxMapController mapBoxController) {
    mapBoxController
        .addCircle(CircleOptions(geometry: LatLng(8.353311, -62.680403)));
  }
}
