import 'package:flutter/material.dart';
import 'Home/Homepage.dart'; // Update the path to the correct directory

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(), // Added const keyword here
    );
  }
}
