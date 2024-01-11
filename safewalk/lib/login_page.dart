import 'package:flutter/material.dart';
import 'package:safewalk/register_page.dart'; // Import the register page
import 'package:safewalk/home_page.dart'; // Import the home page

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key); // Added named 'key' parameter to the constructor

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password = '';
  bool showError = false;
  bool isHovered = false; // Track if the button is hovered

  bool isPasswordValid() {
    if (password.length < 8 || !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Container(
            width: 300,
            height: 500,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [ // Added 'const' keyword to improve performance
                BoxShadow(
                  color: Color.fromARGB(255, 218, 218, 218).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20), // Added 'const' keyword to improve performance
                Image.asset(
                  'assets/safewalk.png',
                  width: 100, // Set the desired width of the image
                  height: 100, // Set the desired height of the image
                ),
                const SizedBox(height: 20), // Added 'const' keyword to improve performance
                Text(
                  'SafeWalk',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 20), // Added 'const' keyword to improve performance
                SizedBox(
                  width: 0.8 * 300,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email/Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Added 'const' keyword to improve performance
                SizedBox(
                  width: 0.8 * 300,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                      errorText: showError && !isPasswordValid() ? 'Password must be at least 8 characters long and contain a special character' : null,
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Added 'const' keyword to improve performance
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30), // Added right padding
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Added 'const' keyword to improve performance
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200), // Added 'const' keyword to improve performance
                  curve: Curves.easeInOut, // Animation curve
                  height: 0.1 * 300, // Increase height by 30%
                  width: isHovered ? 180 : 150, // Increase width when hovered
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showError = true;
                      });
                      if (isPasswordValid()) {
                        // TODO: Implement login functionality
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()), // Navigate to the home page
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Invalid Password'), // Added 'const' keyword to improve performance
                              content: const Text('Password must be at least 8 characters long and contain a special character.'), // Added 'const' keyword to improve performance
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'), // Added 'const' keyword to improve performance
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Replaced 'primary' with 'backgroundColor'
                      elevation: 0,
                      minimumSize: Size(150, 0.1 * 300), // Set the minimum size based on the width and height
                    ),
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          isHovered = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          isHovered = false;
                        });
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10), // Added 'const' keyword to improve performance
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()), // Navigate to the register page
                    );
                  },
                  child: Text(
                    "Haven't registered yet? Sign Up",
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 61, 61, 61),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
