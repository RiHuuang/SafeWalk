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

class SafeWalkPage extends StatefulWidget {
  const SafeWalkPage({Key? key}) : super(key: key); // Added named 'key' parameter

  @override
  _SafeWalkPageState createState() => _SafeWalkPageState();
}

class _SafeWalkPageState extends State<SafeWalkPage> {
  double buttonWidth = 150.0;
  bool isHovered = false;

  void animateButton() {
    setState(() {
      buttonWidth = buttonWidth == 150.0 ? 200.0 : 150.0;
    });
  }

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
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor: MaterialStateProperty.all<Color>(
                    isHovered ? Colors.grey : Colors.transparent,
                  ),
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
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Added 'const' keyword
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  overlayColor: MaterialStateProperty.all<Color>(
                    isHovered ? Colors.grey : Colors.transparent,
                  ),
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
                    'SIGN UP',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
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
