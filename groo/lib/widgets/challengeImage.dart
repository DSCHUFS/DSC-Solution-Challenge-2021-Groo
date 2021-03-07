import 'package:flutter/material.dart';

class ChallengeImage extends StatelessWidget {
  const ChallengeImage({@required this.imagePath});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(imagePath),
      ),
    );
  }
}