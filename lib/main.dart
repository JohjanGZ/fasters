import 'package:flutter/material.dart';

//page
import './pages/map/MapPage.dart';

//page - test
import './pages/map/PolylinePage.dart';
import './pages/map/LocationPage.dart';
import './pages/map/MapSearchPage.dart';
import './pages/map/GeoDistancyPage.dart';
import './pages/map/DirectionsMapPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapPage(),
    );
  }
}
