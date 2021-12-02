import 'dart:async';
import 'dart:math';

import 'package:domicilios_delivery/preferencias_usuario/preferencias.dart';
import 'package:domicilios_delivery/src/utils/DireccionProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String _mapStyle;
  var _mapController;
  final LatLng fromPoint = LatLng(10.909075, -74.802325);
  final LatLng toPoint = LatLng(10.988433, -74.788153);
  final _prefs=new PreferenciasUsuario();

  @override
  void initState() {
    EasyLoading.dismiss();
    super.initState();

    // rootBundle.loadString('assets/map_style.txt').then((string) {
    //   _mapStyle = string;
    // });
  }

  @override
  Widget build(BuildContext context) {
    print("Token es: "+_prefs.token);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title: Center(child: Text('Entregar',style: TextStyle(),)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  height: 400,
                  child: Consumer<DireccionProvider>(
                    builder: (BuildContext context , DireccionProvider api,Widget child){
                      return _map(api);
                    },
                    )),
              _direccion(),
              _pedido(),
              _valor(),
              _boton(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.zoom_in),
        onPressed: (){_centerView();},
        ),
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    tmp.add(Marker(
      markerId: MarkerId("value"),
      position: fromPoint

    ));
    tmp.add(Marker(
      markerId: MarkerId('destino'),
      position: toPoint
    ));
    return tmp;
  }

  Widget _map(DireccionProvider api) {
    return GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(10.909075, -74.802325),
          zoom: 16,
        ),
        polylines: api.currentRoute,
        markers: _createMarkers(),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
          _centerView();
          //mapController.setMapStyle(_mapStyle);
          var api = Provider.of<DireccionProvider>(context,listen:false);
          api.findDirections(fromPoint,toPoint);
        });
  }
  _centerView()async{
    await _mapController.getVisibleRegion();
    var left= min(fromPoint.latitude,toPoint.latitude);
    var right= max(fromPoint.latitude,toPoint.latitude);
    var botton= min(fromPoint.longitude,toPoint.longitude);
    var top = max(fromPoint.longitude,toPoint.longitude);
    var bounds = LatLngBounds(southwest:LatLng(left,botton),northeast: LatLng(right,top));
    var cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    _mapController.animateCamera(cameraUpdate);
  }
}

Widget _direccion() {
  return (Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
            child: Text(
              "Direccion",
              style: TextStyle(fontSize: 20),
            )),
        Container(
            padding: EdgeInsets.fromLTRB(0, 25, 10, 0),
            child: Text("Cra 46 #53-160", style: TextStyle(fontSize: 20)))
      ],
    ),
  ));
}

Widget _pedido() {
  return (Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
            child: Text(
              "Pedido",
              style: TextStyle(fontSize: 20),
            )),
        Container(
            padding: EdgeInsets.fromLTRB(0, 25, 10, 0),
            child: Text("Contra entrega", style: TextStyle(fontSize: 20)))
      ],
    ),
  ));
}

Widget _valor() {
  return (Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
            child: Text(
              "Valor",
              style: TextStyle(fontSize: 20),
            )),
        Container(
            padding: EdgeInsets.fromLTRB(0, 25, 10, 0),
            child: Text("150.000", style: TextStyle(fontSize: 20)))
      ],
    ),
  ));
}

Widget _boton() {
  return (Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(0, 30, 10, 10),
        child: TextButton(
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.red),
          onPressed: () {},
          child: Text('Pedido entregado'),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.red, spreadRadius: 3),
          ],
        ),
        height: 50,
      ),
    ],
  ));
}
