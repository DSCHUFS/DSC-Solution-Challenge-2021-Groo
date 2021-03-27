import 'package:flutter/material.dart';

class TipScreen extends StatelessWidget {
  const TipScreen({Key key, this.tipNum}) : super(key: key);
  final tipNum;

  @override
  Widget build(BuildContext context) {
    List<String> _title = ["Profile", "Challenge", "Counseling"];
    List<Widget> _tipText = [
      Text(
        """Click the Person icon in the upper right corner of the homepage.

Get a badge through the challenge and fill in your own profile! 
You can check the badges that you received and the challenge that you participated in.""",
        style: TextStyle(
          fontSize: 21,
          fontFamily: "Inconsolata",
        ),
      ),
      Text(
        """Go to the challenge page! Please check the challenge going on this month and press the Start button. 

Check to see what level you've reached at the moment. Check out who is participating in this challenge. 
You can check the badges you have achieved by collecting them. 
You can look back on the challenge you participated in.""",
        style: TextStyle(
          fontSize: 21,
          fontFamily: "Inconsolata",
        ),
      ),
      Text(
        """Go to the counseling page! If there\'s a counselor you\'d like to share your troubles with, press the Play button!
You can get counseling in 3 ways:
  * Voice Counseling
  * Video Counseling
  * Text-Chat Counseling
You can use different ways at different times as you wish, based on your needs and convenience.""",
        style: TextStyle(
          fontSize: 21,
          fontFamily: "Inconsolata",
        ),
      ),
    ];
    return Container(
      color: Color(0xFF737373),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFe7f0fd), Color(0xFFaccbee)]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Text(
                  "${_title[tipNum]} Tip",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inconsolata",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(15.0)),
                child: _tipText[tipNum],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
