import 'package:flutter/material.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

class PolyLineList extends StatefulWidget {
  @override
  _PolyLineList createState() => _PolyLineList();
}

class _PolyLineList extends State<PolyLineList> {
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
              _RunPolyLine();
            },
            child: Text('PolyLine'),
          ),
        )),
      );

  void _RunPolyLine() {
    const coordinates = [
      [8.35290, -62.68106],
      [8.36957, -62.66130]
    ];
    print(coordinates);
// output is `_p~iF~ps|U_ulLnnqC_mqNvxq`@'

    final polyline = decodePolyline('sl~q@rkq}JegBozB');
    print(polyline);
  }
}
