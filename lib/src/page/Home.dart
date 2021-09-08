import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _mapStyle;
  var mapController;
  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entregar'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text("mapa"),
          SizedBox(
            height: 15,
          ),
          Container(height: 300, child: _map()),
        ],
      ),
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
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          mapController.setMapStyle(_mapStyle);
        });
  }
}
