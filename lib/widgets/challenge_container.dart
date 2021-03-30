import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:groo/screens/const.dart';

class ChallengeContainer extends StatelessWidget {
  const ChallengeContainer({this.challengeName, this.imagePath});
  final String challengeName;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x3F2EB402),
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              challengeName,
              style: challengeNameTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                    image: FirebaseImage(
                  imagePath,
                  maxSizeBytes: 5000 * 1000,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
