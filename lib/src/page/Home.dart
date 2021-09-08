import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entregar'),
      ),
      body: _map(),
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    tmp.add(Marker(
      markerId: MarkerId("value"),
      position: LatLng(10.909075, -74.802325),
    ));
    return tmp;
  }

  Widget _map() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(10.909075, -74.802325),
        zoom: 12,
      ),
      markers: _createMarkers(),
    );
  }
}
