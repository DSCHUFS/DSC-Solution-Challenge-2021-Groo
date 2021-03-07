import 'package:flutter/material.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/widgets/custom_elavated_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

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
              onPressed: _signInWithGoogle,
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
              onPressed: _signInWithFacebook,
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
              onPressed: _signInAnonymously,
            ),
          ],
        ),
      ),
    );
  }
}
