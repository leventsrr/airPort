import 'dart:async';

import 'package:air_ports/logic/cubit/cityCubit/airport_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../screens/airpot_details_page.dart';

class MapPage extends StatefulWidget {
  AirportSelected? airportSelected;
  MapPage({required this.airportSelected});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  late double lat;
  late double lon;
  late CameraPosition _kLake;
  void setCameraPosition() {
    lat = widget.airportSelected!.airportName!.first.location.lat;
    lon = widget.airportSelected!.airportName!.first.location.lon;
    _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lat, lon),
        tilt: 59.440717697143555,
        zoom: 10);
  }

  List<Marker> markers = [];
  void createMarkers() {
    for (int i = 0; i < widget.airportSelected!.airportName!.length; i++) {
      markers.add(Marker(
        markerId: MarkerId('$i'),
        position: LatLng(widget.airportSelected!.airportName![i].location.lat,
            widget.airportSelected!.airportName![i].location.lon),
        infoWindow: InfoWindow(
            title: '${widget.airportSelected!.airportName![i].name}'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    createMarkers();
    setCameraPosition();
    return Expanded(
      child: Container(
        child: GoogleMap(
          markers: Set<Marker>.of(markers),
          mapType: MapType.hybrid,
          initialCameraPosition: _kLake,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
