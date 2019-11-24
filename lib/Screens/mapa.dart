import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


class Mapa extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return MapaState();
  }
}

class MapaState extends State<Mapa> {
  GoogleMapController mapController;
  Geolocator locate = Geolocator();
  LatLng _center = LatLng(-22.905336, -43.141555);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Rota de Fuga'),
          backgroundColor: Colors.deepPurple,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
      );
  }
}

LatLng getLocation() {
  LatLng coords;
  Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
      .then((value) {
    coords = LatLng(value.latitude, value.longitude);
  });
  return coords;
}