import 'package:flutter/material.dart';

void main() => runApp(MeapGamesApp());

class MeapGamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF3333),
      body: Center(
        child: Text(
          "MEAP GAMES\nUYGULAMA ÇALIŞIYOR!",
          style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
