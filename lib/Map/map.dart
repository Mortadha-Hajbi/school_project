import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String locationMessage = 'Get current location';
  late double lat = 34.929413080442146;
  late double long = 9.192763749021166;
  final MapController _mapController = MapController();
  List<Marker> _markers = [];
  @override
  void initState() {
    super.initState();
    _getschoolsLocations();
  }

  void _getschoolsLocations() {
    FirebaseFirestore.instance
        .collection('schools')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        GeoPoint userLocation = doc.get('location');
        _markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(userLocation.latitude, userLocation.longitude),
            builder: (ctx) => Stack(
              children: [
                // Marker circle
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                // User image
                Positioned(
                  top: 5,
                  left: 5,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('lib/images/cat.jpeg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 40, 40),
        title: Center(
            child: Text(
          'الخريطة',
          style: GoogleFonts.poppins(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        )),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: LatLng(lat, long),
          zoom: 16.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(lat, long),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ),
              ..._markers,
            ],
          ),
        ],
      ),
    );
  }
}
