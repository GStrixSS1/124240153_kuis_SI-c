// lib/main.dart
import 'package:flutter/material.dart';
import 'login_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culinarizz',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const LoginPage(), 
      debugShowCheckedModeBanner: false,
    );
  }
}