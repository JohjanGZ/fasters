import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class PolylinePoint extends StatefulWidget {
  @override
  _PolylinePoint createState() => _PolylinePoint();
}

class _PolylinePoint extends State<PolylinePoint> {
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
            body: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
              onSurface: Colors.red,
            ),
            onPressed: () {
              _RunPoint();
            },
            child: Text('PolyLine'),
          ),
        )),
      );

  void _RunPoint() {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result =
        polylinePoints.decodePolyline("sl~q@rkq}JegBozB");
    print(result);
  }
}
