import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapBoxPage extends StatefulWidget {
  @override
  _MapBoxPage createState() => _MapBoxPage();
}

class _MapBoxPage extends State<MapBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(8.366244, -62.644979),
            zoom: 15.0,
          ),
          layers: [
            new TileLayerOptions(
              urlTemplate: ""
                  "https://api.mapbox.com/styles/v1/suarezdsz/ckkcvujel0in317tgak8f3ckt/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic3VhcmV6ZHN6IiwiYSI6ImNranl0dzNmNzAxM2Qyb3BwaHpwOGEyZmQifQ.0lJNB2nXWow3hoPnVkwwmw",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1Ijoic3VhcmV6ZHN6IiwiYSI6ImNranl0dzNmNzAxM2Qyb3BwaHpwOGEyZmQifQ.0lJNB2nXWow3hoPnVkwwmw',
                'id': 'mapbox.mapbox-streets-v8',
              },
            ),
            new MarkerLayerOptions(
              markers: [
                Marker(
                  width: 50.0,
                  height: 50.0,
                  point: LatLng(8.366244, -62.644979),
                  builder: (ctx) => Container(child: Icon(Icons.ac_unit)),
                )
              ],
            ),
            PolylineLayerOptions(polylines: [
              Polyline(
                points: [
                  LatLng(8.366244, -62.644979),
                  LatLng(8.353007, -62.680867)
                ],
                // isDotted: true,
                color: Color(0xFF669DF6),
                strokeWidth: 3.0,
                borderColor: Color(0xFF1967D2),
                borderStrokeWidth: 0.1,
              )
            ])
          ],
        ),
      ),
    );
  }
}
