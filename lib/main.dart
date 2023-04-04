import 'package:flutter/material.dart';
import 'authservice.dart';
import 'loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuth(),
    );
  }
}
