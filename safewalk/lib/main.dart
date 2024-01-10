import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home : new LoginPage(),
  ));
}

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("Test, This is SafeWalk!"),
    );
  }

}
