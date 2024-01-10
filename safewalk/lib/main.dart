import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Added named 'key' parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeWalkPage(),
    );
  }
}

class SafeWalkPage extends StatelessWidget {
  const SafeWalkPage({Key? key}) : super(key: key); // Added named 'key' parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/safewalklogo.png', // Path to your logo image
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 10), // Added 'const' keyword
            Text(
              'SafeWalk',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24 * 1.75, // Increase font size by 75%
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50), // Added 'const' keyword
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size?>(
                    const Size(150, 0.1 * 300)), // Fixed type mismatch
              ),
              child: Text(
                'LOGIN',
                style: const TextStyle( // Added 'const' keyword
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 20), // Added 'const' keyword
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize: MaterialStateProperty.all<Size?>(
                    const Size(150, 0.1 * 300)), // Fixed type mismatch
              ),
              child: Text(
                'SIGN UP',
                style: const TextStyle( // Added 'const' keyword
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
