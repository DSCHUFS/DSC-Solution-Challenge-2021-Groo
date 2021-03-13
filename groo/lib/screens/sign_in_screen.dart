import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/widgets/custom_elavated_button.dart';
import 'package:groo/widgets/show_exception_alert_dialog.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithFacebook();
    } on FirebaseAuthException catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithTwitter(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithTwitter();
    } on FirebaseAuthException catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
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
                  onPressed:
                      _isLoading ? null : () => _signInWithGoogle(context),
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
                  onPressed:
                      _isLoading ? null : () => _signInWithFacebook(context),
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
                  onPressed:
                      _isLoading ? null : () => _signInWithTwitter(context),
                ),
              ],
            ),
            Opacity(
              opacity: _isLoading ? 1.0 : 0,
              child: Align(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan[300]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
