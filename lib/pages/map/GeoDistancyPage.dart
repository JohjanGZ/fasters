import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

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
              _RunDistancy();
            },
            child: Text('Geo Distance'),
          ),
        )),
      );

  void _RunDistancy() {
    var rad = radians(8.35298);
    print(rad);
  }
}
