import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashy/splashy.dart';
import 'package:m_welness/screens/AuthenticationPage.dart';
import 'package:m_welness/screens/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Splashy(
      imagePath:
          'assets/images/medic.png', // ! Add image path in pubsec.yaml before adding here.
      logoHeight: 250,
      logoWidth: 250,
      backgroundColor: Color(0xFF81BAD8),
      bottomLoader: CircularProgressIndicator(
        strokeWidth: 5,
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF81BAD8)),
      ),
      curve: Curves.bounceInOut,
      duration: 150,
      customFunction: customFunction(),
    );
  }
}

Future<Widget> customFunction() {
  User user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    return Future.value(AuthPage());
  } else {
    return Future.value(HomePage());
  }
}
