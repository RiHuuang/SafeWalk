import 'package:flutter/material.dart';
import 'package:safewalk/contacts_page.dart';
import 'package:safewalk/login_page.dart';
import 'package:safewalk/settings_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/map_image.jpg'), // Replace with your map image asset path
                fit: BoxFit.cover,
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
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.person),
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
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.message),
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
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                      blurRadius: 4,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.contacts, color: Colors.black),
                      onPressed: () {
                        // Handle contacts icon press
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactsPage()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.shield_outlined , color: Colors.black),
                      onPressed: () {
                        // Handle settings icon press
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.settings, color: Colors.black),
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
    );
  }
}
