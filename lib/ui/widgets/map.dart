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
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(51.5, -0.09),
              builder: (ctx) => IconButton(
                onPressed: () =>
                    Provider.of<AppointProvider>(context, listen: false)
                        .changeStep(Steps.third),
                icon: Icon(
                  Icons.medical_services_rounded,
                  size: 36,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
