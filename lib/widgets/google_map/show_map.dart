import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildGoogleMap extends StatefulWidget {
  final countryData;

  const BuildGoogleMap({Key key, this.countryData}) : super(key: key);

  @override
  _BuildGoogleMapState createState() => _BuildGoogleMapState();
}

class _BuildGoogleMapState extends State<BuildGoogleMap> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(20.5937, 78.9629);
  final Map<String, Marker> _markers = Map();

  Future _onMapCreated(GoogleMapController mapController) {
    var data = widget.countryData;

    setState(() {
      _markers.clear();
      for (final country in data) {
        final marker = Marker(
          markerId: MarkerId(country[0]),
          position: LatLng(
            (country[4] ?? 35.41454).toDouble(),
            (country[5] ?? 139.68180).toDouble(),
          ),
          infoWindow: InfoWindow(
            title: country[0],
            snippet: 'Total cases: ' +
                country[1].toString() +
                ' Deaths: ' +
                country[2].toString() +
                ' Recovered: ' +
                country[3].toString(),
          ),
        );
        _markers[country[0]] = marker;
      }
      print(_markers);
    });

    // mapController.
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 1920.w,
        width: 1080.h,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 0,
          ),
          markers: _markers.values.toSet(),
          minMaxZoomPreference: MinMaxZoomPreference(-20.0, 10.0),
          rotateGesturesEnabled: false,
        ),
      ),
    );
  }
}
