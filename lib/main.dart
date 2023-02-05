import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:airport/airports.dart';
import 'package:airport/main.dart';
import 'package:airport/models/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(-37, 173);

  static final resultado = Airports.getAirport("SBSP");

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flight track calculator'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 5.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'From Airport',
                      ),
                    ),
                  ),
                ),
                new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10),
                        labelText: 'To Airport',
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
