import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polyline_builder/polyline_builder.dart';

class PolylineBuilderDemo extends StatefulWidget {
  @override
  _PolylineBuilderDemoState createState() => _PolylineBuilderDemoState();
}

class _PolylineBuilderDemoState extends State<PolylineBuilderDemo> {
  final _initialPosition = const CameraPosition(
    target: LatLng(18.4844, -69.9242),
    zoom: 12.63242053,
  );

  GoogleMapController controller;

  @override
  void initState() {
    super.initState();

    PolylineBuilder.MAPBOX_ACCESS_TOKEN =
        "pk.eyJ1Ijoic3VhcmV6ZHN6IiwiYSI6ImNrcXBuNHgzazE4czYycHBxbDJkZjRkYmYifQ.3o54WARdIacyOXJkxIfVwg";
  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          body: PolylineBuilder(
            polylineFitPadding: 20,
            builder: (polylines, distance, duration, geometry) {
              try {
                print('Distance(m): $distance');
                print('Duration(s): $duration');
                print('Geometry(s): $geometry');
              } catch (e) {}

              return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _initialPosition,
                  polylines: polylines,
                  onMapCreated: (controller) =>
                      setState(() => this.controller = controller));
            },

            /// Use polylinesGeometry or locations
            polylinesGeometry:
                'enxfb@hslmdCaQvu@g_BgAei@at@t`ATlJd~Ayz@vSzXwv@t{A`F~Xtp@of@~Usb@{sByqDokWsi@mfQkrBwbJxtAopJpfA_dc@dq@ot@roHwl@lOobGvDuaD}gDarH}]y`DwuEisEuZuuDilF}xJdk@k~Or@gG`Rih@dkCzVzyElFnt@xbDyu@f_@|j@piBkhQ~eAepJcYkiKy~BsoCfuBo`BuTsfIi|MuIaoJm|Vyu@kvG{{EiuCe_@qyDpsAccBqFsvFwzBkgAmhDkxBv{@g{AyvAom^bt@kpWu|N_aDkVezJhu@',
            locations: [
              LatLng(18.47790717495005, -69.96671598404646),
              LatLng(18.483361274620748, -69.87782824784517),
              LatLng(18.579517508133268, -69.8544293269515),
            ],
            // Used to fit polyline on map camera
            controller: this.controller,
          ),
        ),
      );
}
