import 'package:flutter/material.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({Key? key}) : super(key: key); // Added named 'key' parameter

  @override
  _EmergencyPageState createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController; // Added 'late' keyword
  late Animation<double> _animation; // Added 'late' keyword

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3), // Added 'const' keyword
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'), // Added 'const' keyword
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) { // Updated parameter type
              return Container(
                width: 160 * _animation.value,
                height: 160 * _animation.value,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 4 * _animation.value,
                  ),
                ),
                child: const Icon(
                  Icons.warning, // Added 'const' keyword
                  size: 80,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
