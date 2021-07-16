import 'package:flutter/material.dart';
import 'package:polyline_decoded_kur/polyline.dart';

class PolyLine extends StatefulWidget {
  @override
  _PolyLine createState() => _PolyLine();
}

class _PolyLine extends State<PolyLine> {
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
    Polyline polyline;

    /// List<List<double> coordinates;
    const coordinates = [
      [8.35290, -62.68106],
      [8.36957, -62.66130]
    ];
    const precision = 5;

    polyline = Polyline.Encode(decodedCoords: coordinates, precision: 5);

    print('Encoded coords:  ${polyline.encodedString}');

    String encoded = polyline.encodedString;
    polyline = Polyline.Decode(encodedString: encoded, precision: precision);
    polyline = Polyline.Distance(encodedString: encoded, unit: 'kilometers');
    print(
        'Distance: ${polyline.distance.floor()}km , Encoded String: ${polyline.encodedString} Decoded Coords: ${polyline.decodedCoords}');
    /*  const encoded = 'mxhmEfeyaO}w}F_aeTrxk[nabDv}lJsytA';

    // Encode a list of coordinates with precision 5 to produce the encoded string
    polyline = Polyline.Encode(decodedCoords: coordinates, precision: 5);
    print(
        'Encoded String: ${polyline.encodedString}, Coords: ${polyline.decodedCoords}');

    // Decode an encoded string to a list of coordinates
    polyline = Polyline.Decode(encodedString: encoded, precision: precision);
    print('Decoded Coords: ${polyline.decodedCoords}');
    print('String: ${polyline.encodedString}');

    // Calculate the distance of an encoded polyline, and decode the polyline
    polyline = Polyline.Distance(encodedString: encoded, unit: 'kilometers');
    // By calling  length the encodedString, decodedCoords, and distance variables
    // of the Polyline class are available
    print(
        'Distance: ${polyline.distance.floor()}km , Encoded String: ${polyline.encodedString} Decoded Coords: ${polyline.decodedCoords}');*/
  }
}
