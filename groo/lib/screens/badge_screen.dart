import 'package:flutter/material.dart';
import 'package:groo/screens/const.dart';
import 'const.dart';

class BadgeScreen extends StatefulWidget {
  @override
  _BadgeScreenState createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  final badgePadding = EdgeInsets.all(70.0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
          home: Scaffold(
          
          appBar: AppBar(
            leading: ElevatedButton(
                style : ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF2EB402))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
            title: Text("Your Badge",
            style: titleTextStyle,
            ),
            backgroundColor: Color(0xFF2EB402)
          ),
          body: SingleChildScrollView(
                    child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: badgePadding,
                    child: Image.asset('images/badge.png'),
                  ),
                  Padding(
                    padding: badgePadding,
                    child: Image.asset('images/sport.png'),
                  ),
                  Padding(
                    padding: badgePadding,
                    child: Image.asset('images/dance.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}