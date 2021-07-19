import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math';

class GeoDistancyPage extends StatefulWidget {
  @override
  _GeoDistancyPage createState() => _GeoDistancyPage();
}

class _GeoDistancyPage extends State<GeoDistancyPage> {
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
            body: Center(
          child: TextButton(
            onPressed: () {
              _RunDistancy([8.3526, -62.6801], [8.3695, -62.6613]);
            },
            child: Text('Geo Distance'),
          ),
        )),
      );

  void _RunDistancy(punto1, punto2) {
    var punto_1 = [radians(punto1[0]), radians(punto1[1])];
    var punto_2 = [radians(punto2[0]), radians(punto2[1])];

    var distancia = acos(sin(punto_1[0]) * sin(punto_2[0]) +
        cos(punto_1[0]) * cos(punto_2[0]) * cos(punto_1[1] - punto_2[1]));

    print(distancia * 6371.01);
  }
}
