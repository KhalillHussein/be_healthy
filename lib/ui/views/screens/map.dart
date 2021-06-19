import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          body: Stack(
            children: [
              FlutterMap(
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
                        width: 120.0,
                        height: 120.0,
                        point: LatLng(47.221809, 39.720261),
                        builder: (ctx) => Container(
                          child: IconButton(
                            onPressed: () => {
                              Navigator.pushNamed(context, AppointScreen.route),
                            },
                            icon: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: new BoxDecoration(
                                    color: Colors.white.withOpacity(.8),
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(100.0),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.medical_services_rounded,
                                    size: 36,
                                    color: Colors.red.withOpacity(.8),
                                  ),
                                ),
                                Text(
                                  'Клиника №49',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Marker(
                        width: 120.0,
                        height: 120.0,
                        point: LatLng(47.228534176338826, 39.71555047347306),
                        builder: (ctx) => Container(
                          child: IconButton(
                            onPressed: () => {
                              Navigator.pushNamed(context, AppointScreen.route),
                            },
                            icon: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: new BoxDecoration(
                                    color: Colors.white.withOpacity(.8),
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(100.0),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.medical_services_rounded,
                                    size: 36,
                                    color: Colors.red.withOpacity(.8),
                                  ),
                                ),
                                Text(
                                  'Клиника Гармония',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Marker(
                        width: 120.0,
                        height: 120.0,
                        point: LatLng(47.219790623761426, 39.6982985062793),
                        builder: (ctx) => Container(
                          child: IconButton(
                            onPressed: () => {
                              Navigator.pushNamed(context, AppointScreen.route),
                            },
                            icon: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: new BoxDecoration(
                                    color: Colors.white.withOpacity(.8),
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(100.0),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.medical_services_rounded,
                                    size: 36,
                                    color: Colors.red.withOpacity(.8),
                                  ),
                                ),
                                Text(
                                  'Клиника Сокол',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Marker(
                        width: 120.0,
                        height: 120.0,
                        point: LatLng(47.2334882159564, 39.733832409272786),
                        builder: (ctx) => Container(
                          child: IconButton(
                            onPressed: () => {
                              Navigator.pushNamed(context, AppointScreen.route),
                            },
                            icon: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: new BoxDecoration(
                                    color: Colors.white.withOpacity(.8),
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(100.0),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.medical_services_rounded,
                                    size: 36,
                                    color: Colors.red.withOpacity(.8),
                                  ),
                                ),
                                Text(
                                  'Клиника Эксперт',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SearchWidget(),
            ],
          ),
        );
      },
    );
  }
}

class SearchWidget extends StatelessWidget {
  TextEditingController controller =
      TextEditingController(/* text: 'Введите адрес или название' */);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(12),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Введите адрес или название',
            fillColor: Colors.white.withOpacity(.8),
            filled: true,
            suffixIcon: Icon(
              Icons.search_rounded,
            ),
            border: new OutlineInputBorder(
              borderSide: BorderSide(
                  width: 0, color: Colors.white, style: BorderStyle.none),
              borderRadius: const BorderRadius.all(
                const Radius.circular(12.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
