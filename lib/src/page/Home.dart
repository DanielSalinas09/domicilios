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
        backgroundColor: Colors.red,
        title: Text('Entregar'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  "Entregar",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                height: 400,
                child: _map()),
            Container(
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
                      child: Text("Cra 46 #53-160",
                          style: TextStyle(fontSize: 20)))
                ],
              ),
            ),
            Container(
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
                      child: Text("Contra entrega",
                          style: TextStyle(fontSize: 20)))
                ],
              ),
            ),
            Container(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 10, 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red
                    ),
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
            ),
          ],
        ),
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
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(10.909075, -74.802325),
        zoom: 12,
      ),
      markers: _createMarkers(),
    );
  }
}
