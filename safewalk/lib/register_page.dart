import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Center(
        child: const Text(
          'Welcome to the Register Page!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
