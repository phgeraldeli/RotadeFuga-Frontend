import 'package:flutter/material.dart';


class Mapa extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return MapaState();
  }
}

class MapaState extends State<Mapa> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[50],
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "inserir mapa aqui",
        ),
      ),
    );
  }
}