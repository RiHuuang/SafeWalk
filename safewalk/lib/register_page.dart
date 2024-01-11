import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safewalk/login_page.dart'; // Import the login page

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key); // Added named 'key' parameter to the constructor

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // Added form key

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController(); // Added retypePasswordController


  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    retypePasswordController.dispose(); // Dispose retypePasswordController

    super.dispose();
  }

  bool showError = false;
  bool isHovered = false; // Track if the button is hovered

  bool isPasswordValid() {
    if (passwordController.text.length < 8 ||
        !passwordController.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
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
            height: 630, // Increased the height of the container
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [ // Added 'const' keyword to improve performance
                BoxShadow(
                  color: Color.fromRGBO(186, 186, 186, 0.5),
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
                Form(
                  key: _formKey, // Set the form key
                  child: Column(
                    children: [
                      FormContainerWidget(
                        controller: usernameController,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 10), // Added 'const' keyword to improve performance
                      FormContainerWidget(
                        controller: emailController,
                        hintText: 'Email/Username',
                      ),
                      const SizedBox(height: 10), // Added 'const' keyword to improve performance
                      FormContainerWidget(
                        controller: passwordController,
                        hintText: 'Password',
                        errorText: showError && !isPasswordValid()
                            ? 'Password must be at least 8 characters long and contain a special character'
                            : null,
                      ),
                      const SizedBox(height: 10), // Added 'const' keyword to improve performance
                      FormContainerWidget(
                        controller: retypePasswordController,
                        hintText: 'Re-Type Password',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Added 'const' keyword to improve performance
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
                      if (_formKey.currentState!.validate() && isPasswordValid()) {
                        // TODO: Implement registration functionality
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          print("Created New Account ${emailController.text} ${passwordController.text}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ), // Navigate to the login page
                          );
                        }).onError((error, stackTrace) {
                          print("Error: ${error.toString()}");
                        });
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
                        'REGISTER', // Changed 'LOGIN' to 'REGISTER'
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
                    print("Clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ), // Navigate to the login page
                    );
                  },
                  child: Text(
                    'Already registered? Login', // Added text for login link
                    style: TextStyle(
                      color: const Color.fromARGB(255, 29, 29, 29), // Set the color of the link
                      decoration: TextDecoration.underline, // Add underline to the link
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

class FormContainerWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;

  const FormContainerWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.8 * 300,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          // Do something with the value
        },
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
          errorText: errorText,
        ),
      ),
    );
  }
  
}

