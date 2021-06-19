import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:medicine_app/ui/widgets/gradient_button.dart';

import 'index.dart';

class MapScreen extends StatefulWidget {
  static const route = '/map';

  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _trySubmit() async {}

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) {
        if (userSnapshot.hasData) {
          return StartScreen();
        }
        return Scaffold(
          body: FlutterMap(
            options: MapOptions(
              center: LatLng(47.221809, 39.720261),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(47.221809, 39.720261),
                    builder: (ctx) => Container(
                      child: IconButton(
                          onPressed: () => {
                                Navigator.pushNamed(
                                    context, AppointScreen.route),
                              },
                          icon: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.all(
                                    const Radius.circular(100.0),
                                  ),
                                ),
                                child: Icon(
                                  Icons.medical_services_rounded,
                                  size: 36,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
