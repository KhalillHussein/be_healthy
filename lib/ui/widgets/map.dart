import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:medicine_app/providers/appoint.dart';
import 'package:medicine_app/ui/widgets/gradient_button.dart';
import 'package:provider/provider.dart';

import '../views/screens/index.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          Provider.of<AppointProvider>(context, listen: false)
                              .changeStep(Steps.third),
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
                              '?????????????? ???49',
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
                          Provider.of<AppointProvider>(context, listen: false)
                              .changeStep(Steps.third),
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
                              '?????????????? ????????????????',
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
                          Provider.of<AppointProvider>(context, listen: false)
                              .changeStep(Steps.third),
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
                              '?????????????? ??????????',
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
                          Provider.of<AppointProvider>(context, listen: false)
                              .changeStep(Steps.third),
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
                              '?????????????? ??????????????',
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
  }
}

class SearchWidget extends StatelessWidget {
  TextEditingController controller =
      TextEditingController(/* text: '?????????????? ?????????? ?????? ????????????????' */);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: '?????????????? ?????????? ?????? ????????????????',
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
        ],
      ),
    );
  }
}
