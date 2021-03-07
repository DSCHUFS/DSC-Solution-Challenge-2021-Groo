import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groo/screens/main_screen.dart';
import 'package:groo/screens/settings_screen.dart';
import 'package:groo/screens/sign_in_screen.dart';
import 'package:groo/services/auth.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          if (user == null) {
            return SignInScreen(
              auth: auth,
            );
          }
          return MainScreen();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
