import 'package:flutter/material.dart';
import 'package:groo/widgets/challengeImage.dart';

class campaignDetailScreen extends StatefulWidget {
  @override
  _campaignDetailScreenState createState() => _campaignDetailScreenState();
}

class _campaignDetailScreenState extends State<campaignDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 35.0),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Dancing 30 Days',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
              ChallengeImage(imagePath: 'assets/Dancing.jpg',),
              Container(
                
              
              )
            ]),
          ),
    );
  }
}
