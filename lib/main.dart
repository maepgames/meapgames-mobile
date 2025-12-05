import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MeapGamesApp());
}

class MeapGamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) return HomeScreen();
        return LoginScreen();
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool loading = false;

  void login() async {
    setState(() => loading = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: pass.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: pass.text,
        );
      }
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF3333),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("MEAP GAMES", style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 50),
            TextField(controller: email, decoration: InputDecoration(hintText: "E-posta", filled: true)),
            SizedBox(height: 20),
            TextField(controller: pass, obscureText: true, decoration: InputDecoration(hintText: "Şifre", filled: true)),
            SizedBox(height: 30),
            loading
                ? CircularProgressIndicator()
                : ElevatedButton(onPressed: login, child: Text("GİRİŞ / KAYIT")),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Color(0xFFFF3333),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hoş geldin ${user.email}", style: TextStyle(fontSize: 30, color: Colors.white)),
            ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text("Çıkış Yap"),
            ),
          ],
        ),
      ),
    );
  }
}
