
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;


class DireccionProvider extends ChangeNotifier{

  GoogleMapsDirections directionsApi= GoogleMapsDirections(
    apiKey: 'AIzaSyC_x7pumhDUUfLUqtyQBagFnWcB-b-R3Vk'
  );
  Set<maps.Polyline> _route = Set();
  Set<maps.Polyline> get currentRoute=>_route;

  findDirections(maps.LatLng from, maps.LatLng to)async{
    var origin = Location(lat: from.latitude, lng: from.longitude);
    var destination = Location(lat: to.latitude, lng: to.longitude);
    var result = await directionsApi.directionsWithLocation(origin, destination,travelMode: TravelMode.bicycling);

    Set<maps.Polyline> newRoute= Set();
    if(result.isOkay){
      var route=result.routes[0];
      var legs = route.legs[0];
      List <maps.LatLng>points=[];
      legs.steps.forEach((step) {
        points.add(maps.LatLng(step.startLocation.lat,step.startLocation.lng));
        points.add(maps.LatLng(step.endLocation.lat,step.endLocation.lng));
       });
       var line =maps.Polyline(
         points: points,
         polylineId: maps.PolylineId("mejor ruta"),
         color: Colors.redAccent,
         width: 4,

       );
       newRoute.add(line);
       _route=newRoute;
       notifyListeners();
    }
    
  }
}