import 'package:flutter/material.dart';

class TipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Tip",
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                """Go to the counseling page! If there\'s a counselor you\'d like to share your troubles with, press the Play button!
You can get counseling in 3 ways:
  * Voice Counseling
	* Video Counseling
	* Text-Chat Counseling

You can use different ways at different times as you wish, based on your needs and convenience.""",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
