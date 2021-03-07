import 'package:flutter/material.dart';
import 'package:groo/widgets/challengeImage.dart';
import 'package:groo/widgets/stamp.dart';

class campaignDetailScreen extends StatefulWidget {
  @override
  _campaignDetailScreenState createState() => _campaignDetailScreenState();
}

class _campaignDetailScreenState extends State<campaignDetailScreen> {
  int Days = 20;
  List stampBoard = [];
  void makeStampBoard(){
    int i = 1;
    stampBoard.add(Image.asset('assets/start-line.png', height: 50.0,));
    while (i < Days - 1){
      if(i == Days / 2){
        stampBoard.add(Image.asset('assets/fan.png',height: 50.0));
      }else{
      stampBoard.add(Stamp(stamp: Icons.star));}
      i--;
    }
    stampBoard.add(Image.asset('assets/trophy.png', height: 50.0,));
  }
  @override
  Widget build(BuildContext context) {
    makeStampBoard();
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 35.0),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Dancing $Days Days',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800),
            ),
          ),
          ChallengeImage(
            imagePath: 'assets/Dancing.jpg',
          ),
          Column(children: stampBoard)
        ]),
      ),
    );
  }
}
