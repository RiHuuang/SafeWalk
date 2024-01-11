import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safewalk/login_page.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key); // Added named 'key' parameter

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();
  
  @override
  void dispose() {
    _controller.future.then((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  // void getCurrentLocation() async {
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // }

  // void getCurrentLocation(GoogleMapController mapController) async {
  //   Location location = await Location.fromPlatformDevice();
  //   LatLng latLng = LatLng(location.latitude, location.longitude);
  //   mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 15.0));
  //   // ... use the latLng to update your Google Map
  // }

  @override
  Widget build(BuildContext context) { // Added missing build method
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   color: const Color.fromARGB(255, 255, 255, 255),
          //   child: 
          // ),
          GoogleMap(
              // mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(-6.58916600, 106.79599900),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),

          Positioned(
            top: 36,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.person), // Added const keyword
                onPressed: () {
                  // Handle profile icon press
                },
              ),
            ),
          ),
          Positioned(
            top: 36,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.message), // Added const keyword
                onPressed: () {
                  // Handle message icon press
                },
              ),
            ),
          ),
          Positioned(
            top: 45,
            right: 0.5 * 312,
            child: const Text(
              'SafeWalk',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Align( //NavBar (Bottom)
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                // Handle bottom nav bar tap
              },
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      blurRadius: 4,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.home, color: Colors.black), // Added const keyword
                      onPressed: () {
                        // Handle home icon press
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.contacts, color: Colors.black), // Added const keyword
                      onPressed: () {
                        // Handle contacts icon press
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.black), // Added const keyword
                      onPressed: () {
                        // Handle settings icon press
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.logout, color: Colors.black), // Added const keyword
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()), // Added const keyword
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
