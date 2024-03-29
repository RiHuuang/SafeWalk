import 'dart:async';

import 'package:flutter/material.dart';
import 'package:safewalk/contacts_page.dart';
import 'package:safewalk/emergency_page.dart';
import 'package:safewalk/profile_page.dart';
import 'package:safewalk/settings_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController>? _controller;
  LocationData? currentLocation;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  double? previousZoom;
  bool isActive = false;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      setState(() {
        currentLocation = location;
      });
    });

    GoogleMapController? googleMapController = await _controller?.future;

    location.onLocationChanged.listen((newLoc) {
      setState(() {
        currentLocation = newLoc;
      });

      googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: previousZoom ?? 10,
            target: LatLng(
              newLoc?.latitude ?? 0.0,
              newLoc?.longitude ?? 0.0,
            ),
          ),
        ),
      );
    });
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      'assets/images/Sample_User_Icon.png',
    ).then((onValue) {
      setState(() {
        currentLocationIcon = onValue;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = Completer<GoogleMapController>();
    getCurrentLocation();
    // setCustomMarkerIcon();
  }

  @override
  void dispose() {
    _controller?.future.then((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 20.0,
              child: 
              Container(
                // Naekin dikit biar keliatan scaler nya
                child: currentLocation == null
                    ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            currentLocation?.latitude ?? 0.0,
                            currentLocation?.longitude ?? 0.0,
                          ),
                          zoom: previousZoom ?? 14.4746,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId("currentLocation"),
                            icon: currentLocationIcon,
                            position: LatLng(
                              currentLocation?.latitude ?? 0.0,
                              currentLocation?.longitude ?? 0.0,
                            ),
                          )
                        },
                        onMapCreated: (GoogleMapController controller) {
                          if (!_controller!.isCompleted) {
                            _controller!.complete(controller);
                          }
                        },
                      ),
              ),
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
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileSettingsPage()),
                          );
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
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Maintenance!'),
                        content: const Text('Sorry, this features is currently under development.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
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
            Positioned(
              bottom: 70,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
                icon: Icon(
                  isActive ? Icons.location_on : Icons.location_off,
                  color: isActive ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 132, 132, 132),
                ),
                label: Text(
                  isActive ? 'Tracked Status: Active' : 'Tracked Status: Inactive',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 147, 147, 147),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isActive ? Color.fromARGB(255, 0, 0, 0) :Color.fromARGB(255, 255, 255, 255), // Use backgroundColor instead of primary
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
              Align(
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
                          icon: const Icon(Icons.home, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.contacts, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ContactsPage()),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.shield_outlined, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EmergencyPage()),
                            );
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return AlertDialog(
                            //       title: const Text('Maintenance!'),
                            //       content: const Text('Sorry, this features is currently under development.'),
                            //       actions: [
                            //         TextButton(
                            //           onPressed: () {
                            //             Navigator.of(context).pop();
                            //           },
                            //           child: const Text('OK'),
                            //         ),
                            //       ],
                            //     );
                            //   },
                            // );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SettingsPage()),
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
      ),
    );
  }
}
