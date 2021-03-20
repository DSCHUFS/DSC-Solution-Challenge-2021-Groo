import 'package:flutter/material.dart';

class TipScreen extends StatelessWidget {
  const TipScreen({Key key, this.tipNum}) : super(key: key);
  final tipNum;

  @override
  Widget build(BuildContext context) {
    List<Widget> _tipText = [
      Text(
        """Click the Person icon in the upper right corner of the homepage.

Get a badge through the campaign and fill in your own profile! 
You can check the badges that you received and the campaigns that you participated in.""",
        style: TextStyle(fontSize: 15),
      ),
      Text(
        """Go to the campaign page! Please check the campaign going on this month and press the Start button. 
Check to see what level I've reached at the moment. Check out who is participating in this campaign. 
You can check the badges you have achieved by collecting them. 
You can look back on the campaign you participated in.""",
        style: TextStyle(fontSize: 15),
      ),
      Text(
        """Go to the counseling page! If there\'s a counselor you\'d like to share your troubles with, press the Play button!
You can get counseling in 3 ways:
  * Voice Counseling
  * Video Counseling
  * Text-Chat Counseling
You can use different ways at different times as you wish, based on your needs and convenience.""",
        style: TextStyle(fontSize: 15),
      ),
    ];
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
              _tipText[tipNum],
            ],
          ),
        ),
      ),
    );
  }
}
