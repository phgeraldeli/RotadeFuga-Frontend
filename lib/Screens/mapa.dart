import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;


class Rota {
  final List<LatLng> pontos;
  Rota({this.pontos});
  factory Rota.fromJson(List<dynamic> json) {
    Map<String, dynamic> data = json[0];
    List<dynamic> pts = data['pontos'];
    List<LatLng> temp = new List();
    for(Map<String, dynamic> pt in pts)
    {
      temp.add(LatLng(pt['latitude'].toDouble(),(pt['longitude']).toDouble()));
    }
    print(temp.toString());
    return Rota( pontos: temp);
  }
}

class Mapa extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return MapaState();
  }
}

Future<Rota> getRota() async {
  final response = await http.get('https://teste-nodejs-rota.herokuapp.com/rotas/5ddddffabe21b30022a06fa7');
  if (response.statusCode == 200){
    return Rota.fromJson(json.decode(response.body));
  } else {
    throw Exception('Falha na requisição');
  }
}

class MapaState extends State<Mapa> {
  GoogleMapController mapController;
  Geolocator locate = Geolocator();
  LatLng _center = LatLng(-22.905336, -43.141555);
  Future<Rota> _rota;
  final Set<Polyline> _polyline={};

  void _onMapCreated(GoogleMapController controller) {
        mapController = controller;
        _rota.then((data)=>{setState(() => { _polyline.add(Polyline(polylineId: PolylineId("Rota Default"), visible: true, points:data.pontos, color: Colors.blue))})});
    }

  @override
  void initState(){
    super.initState();
    _rota = getRota();
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
          polylines: _polyline,
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