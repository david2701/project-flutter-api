// Importing the Pakages
import 'package:flutter/material.dart';
import 'home_page.dart';

// Main Function
void main() => runApp(MyApp());

// MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      title: 'Servicios Activos',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


