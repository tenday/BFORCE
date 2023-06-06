import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rive_animation/screens/entryPoint/components/drop_down_menu.dart';


class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(45.464664, 9.188540),
    zoom: 19.151926040649414,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
         child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },

           // TO-DO customizzare il cursore
           markers: {
            const Marker(
              markerId: MarkerId("1"),
              position: LatLng(45.464664, 9.188540),
              draggable: true
            )
           },
        ),
          ),
        FloatingActionButton(
        backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        onPressed: (){
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                  value: "CREA NUOVA BOLLA",
                  child: Text("CREA NUOVA BOLLA",),
              )
            ],
            color: Colors.red,

          );
        },
        child: const Icon(
          Icons.add
        ),
      ),


      ],)


    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}