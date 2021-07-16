import 'package:flutter/material.dart';

//plugin
import 'package:flutter_mapbox_autocomplete/flutter_mapbox_autocomplete.dart';

class MapSearchPage extends StatefulWidget {
  @override
  _MapSearchPage createState() => _MapSearchPage();
}

class _MapSearchPage extends State<MapSearchPage> {
  final _startPointController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: CustomTextField(
        hintText: "Select starting point",
        textController: _startPointController,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapBoxAutoCompleteWidget(
                apiKey:
                    "pk.eyJ1Ijoic3VhcmV6ZHN6IiwiYSI6ImNrcXBuNHgzazE4czYycHBxbDJkZjRkYmYifQ.3o54WARdIacyOXJkxIfVwg",
                hint: "Select starting point",
                onSelect: (place) {
                  // TODO : Process the result gotten
                  _startPointController.text =
                      place.geometry.coordinates.toString();
                },
                limit: 10,
              ),
            ),
          );
        },
        enabled: true,
      ),
    );
  }
}
