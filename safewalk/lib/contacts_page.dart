import 'package:flutter/material.dart';
import 'package:safewalk/home_page.dart';
import 'package:safewalk/profile_page.dart';
import 'package:safewalk/settings_page.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Maintenance!'),
                        content: const Text('Mohon maaf, fitur ini sedang dalam pengembangan.'),
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
              'Contacts',
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
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactsPage()),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.shield_outlined, color: Colors.black),
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
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            bottom: 56,
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    contacts[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contacts[index].information),
                      Text(contacts[index].email),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Contact {
  final String name;
  final String information;
  final String email;

  Contact({
    required this.name,
    required this.information,
    required this.email,
  });
}

List<Contact> contacts = [
  Contact(
    name: 'John Doe',
    information: 'Information about John Doe',
    email: 'johndoe@example.com',
  ),
  Contact(
    name: 'Jane Smith',
    information: 'Information about Jane Smith',
    email: 'janesmith@example.com',
  ),
  Contact(
    name: 'Michael Johnson',
    information: 'Information about Michael Johnson',
    email: 'michaeljohnson@example.com',
  ),
  Contact(
    name: 'Michael Johnson',
    information: 'Information about Michael Johnson',
    email: 'michaeljohnson@example.com',
  ),
  Contact(
    name: 'Emily Davis',
    information: 'Information about Emily Davis',
    email: 'emilydavis@example.com',
  ),
  Contact(
    name: 'David Wilson',
    information: 'Information about David Wilson',
    email: 'davidwilson@example.com',
  )
  //add contacts here
];
