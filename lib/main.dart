import 'package:flutter/material.dart';
import 'screens/search_screen.dart'; // Make sure this path is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GIF Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(), 
    );
  }
}
