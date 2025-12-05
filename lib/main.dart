import 'package:flutter/material.dart';

void main() => runApp(const MeapGamesApp());

class MeapGamesApp extends StatelessWidget {
  const MeapGamesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFF3333),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("MEAP", style: TextStyle(fontSize: 100, color: Colors.white, fontWeight: FontWeight.bold)),
              Text("GAMES", style: TextStyle(fontSize: 100, color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 50),
              Text("ÇALIŞIYOR LAN!", style: TextStyle(fontSize: 40, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
