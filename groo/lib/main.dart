import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groo/screens/landing_screen.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/services/database.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Groo',
        theme: ThemeData(
          primaryColor: Color(0xFF2DB400),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingScreen(
          databaseBuilder: (uid) => FirestoreDatabase(uid: uid),
        ),
      ),
    );
  }
}
