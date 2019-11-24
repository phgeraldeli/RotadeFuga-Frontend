//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Rota de Fuga',
//      theme: new ThemeData(primarySwatch: Colors.blue),
//      home: new LoginPage(),
//    );
//  }
//}
//
//class LoginPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => new _LoginPageState();
//}
//
//// Used for controlling whether the user is loggin or creating an account
//enum FormType { login, register }
//
//class _LoginPageState extends State<LoginPage> {
//  final TextEditingController _emailFilter = new TextEditingController();
//  final TextEditingController _passwordFilter = new TextEditingController();
//  String _email = "";
//  String _password = "";
//  FormType _form = FormType
//      .login; // our default setting is to login, and we should switch to creating an account when the user chooses to
//
//  _LoginPageState() {
//    _emailFilter.addListener(_emailListen);
//    _passwordFilter.addListener(_passwordListen);
//  }
//
//  void _emailListen() {
//    if (_emailFilter.text.isEmpty) {
//      _email = "";
//    } else {
//      _email = _emailFilter.text;
//    }
//  }
//
//  void _passwordListen() {
//    if (_passwordFilter.text.isEmpty) {
//      _password = "";
//    } else {
//      _password = _passwordFilter.text;
//    }
//  }
//
//  // Swap in between our two forms, registering and logging in
//  void _formChange() async {
//    setState(() {
//      if (_form == FormType.register) {
//        _form = FormType.login;
//      } else {
//        _form = FormType.register;
//      }
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: _buildBar(context),
//      body: new Container(
//        padding: EdgeInsets.all(16.0),
//        child: new Column(
//          children: <Widget>[
//            _buildTextFields(),
//            _buildButtons(),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget _buildBar(BuildContext context) {
//    return new AppBar(
//      title: new Text("Rota de Fuga"),
//      centerTitle: true,
//    );
//  }
//
//  Widget _buildTextFields() {
//    return new Container(
//      child: new Column(
//        children: <Widget>[
//          new Container(
//            child: new TextField(
//              controller: _emailFilter,
//              decoration: new InputDecoration(labelText: 'Email'),
//            ),
//          ),
//          new Container(
//            child: new TextField(
//              controller: _passwordFilter,
//              decoration: new InputDecoration(labelText: 'Senha'),
//              obscureText: true,
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget _buildButtons() {
//    if (_form == FormType.login) {
//      return new Container(
//        child: new Column(
//          children: <Widget>[
//            new RaisedButton(
//              child: new Text('Entrar'),
//              onPressed: _pushMapScreen,
//            ),
//            new FlatButton(
//              child: new Text('Não possui uma conta? Toque aqui para se cadastrar.'),
//              onPressed: _formChange,
//            ),
//            new FlatButton(
//              child: new Text('Esqueceu a senha?'),
//              onPressed: _passwordReset,
//            )
//          ],
//        ),
//      );
//    } else {
//      return new Container(
//        child: new Column(
//          children: <Widget>[
//            new RaisedButton(
//              child: new Text('Criar uma conta'),
//              onPressed: _createAccountPressed,
//            ),
//            new FlatButton(
//              child: new Text('Já possui uma conta? Clique aqui para entrar.'),
//              onPressed: _formChange,
//            )
//          ],
//        ),
//      );
//    }
//  }
//
//  // These functions can self contain any user auth logic required, they all have access to _email and _password
//
//  void _loginPressed() {
//    print('The user wants to login with $_email and $_password');
//  }
//
//  void _createAccountPressed() {
//    print('The user wants to create an accoutn with $_email and $_password');
//  }
//
//  void _passwordReset() {
//    print("The user wants a password reset request sent to $_email");
//  }
//
//  void _pushMapScreen() {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => MapsPage()));
//  }
//}
//
//class MapsPage extends StatefulWidget {
//  @override
//  _MapsPageState createState() => _MapsPageState();
//}
//
//class _MapsPageState extends State<MapsPage> {
//  GoogleMapController mapController;
//  Geolocator locate = Geolocator();
//  LatLng _center = LatLng(-22.905336, -43.141555);
//
//  void _onMapCreated(GoogleMapController controller) {
//    mapController = controller;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Rota de fuga'),
//          backgroundColor: Colors.blue,
//        ),
//        body: GoogleMap(
//          onMapCreated: _onMapCreated,
//          initialCameraPosition: CameraPosition(
//            target: _center,
//            zoom: 11.0,
//          ),
//          myLocationEnabled: true,
//          myLocationButtonEnabled: true,
//        ),
//      ),
//    );
//  }
//}
//
//LatLng getLocation() {
//  LatLng coords;
//  Geolocator()
//      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//      .then((value) {
//    coords = LatLng(value.latitude, value.longitude);
//  });
//  return coords;
//}
import 'dart:async';
import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Widgets/FadeRoute.dart';


void main() => runApp(new MaterialApp(
  home: new MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
          context,
          FadeRoute(page: Login()),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.deepPurple),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius:  65.0,
                        child: Icon(
                          Icons.gps_fixed,
                          color: Colors.deepPurple,
                          size: 95.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0) ,
                      ),
                      Text(
                        "rota de fuga",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex:1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "carregando",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
