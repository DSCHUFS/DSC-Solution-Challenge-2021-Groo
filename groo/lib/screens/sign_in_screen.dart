import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groo/widgets/custom_elavated_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/text_logo.png',
              height: 200,
            ),
            SizedBox(
              height: 50,
            ),
            CustomElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/google-logo.png',
                    height: 30,
                  ),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Image.asset(
                      'assets/google-logo.png',
                      height: 30,
                    ),
                  ),
                ],
              ),
              height: 50,
              color: Colors.white,
              borderRadius: 10,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/facebook-logo.png',
                    height: 30,
                  ),
                  Text(
                    'Sign in with Facebook',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Image.asset(
                      'assets/facebook-logo.png',
                      height: 30,
                    ),
                  ),
                ],
              ),
              height: 50,
              color: Color(0xFF334D92),
              borderRadius: 10,
              onPressed: () {},
            ),
            SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/twitter-logo.png',
                    height: 32,
                  ),
                  Text(
                    'Sign in with Twitter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Image.asset(
                      'assets/twitter-logo.png',
                      height: 32,
                    ),
                  ),
                ],
              ),
              height: 50,
              color: Color(0xFF00ACEE),
              borderRadius: 10,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _signInWithGoogle() {
    // TODO: Auth with Google
  }
}
