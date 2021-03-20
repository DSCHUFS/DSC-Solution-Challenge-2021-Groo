import 'package:flutter/material.dart';
import 'package:groo/screens/levelInfo_screen.dart';
import 'package:groo/screens/participant_screen.dart';
import 'package:groo/services/database.dart';
import 'package:groo/widgets/iconButton.dart';
import 'package:groo/screens/badge_screen.dart';
import 'package:groo/screens/history_screen.dart';
import 'package:provider/provider.dart';
import 'const.dart';

class CampaignScreen extends StatefulWidget {
  @override
  _CampaignScreenState createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  bool showImage = false;
  int challengeDays = 8;
  String path = 'images/Running.jpg';
  String levelImage;
  int level;

  @override
  void initState() {
    super.initState();
    myImage = Image.asset(path);
  }

  @override
  void didChangeDependencies() {
    precacheImage(myImage.image, context);
    super.didChangeDependencies();
  }

  void calculateLevel() {
    if (challengeDays <= 7) {
      levelImage = 'images/sprout.png';
      level = 1;
    } else if (challengeDays <= 14) {
      levelImage = 'images/sprout2.png';
      level = 2;
    } else if (challengeDays <= 21) {
      levelImage = 'images/pot.png';
      level = 3;
    } else {
      levelImage = 'images/tulip.png';
      level = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    calculateLevel();
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0x3F2EB402),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            challengeName,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: myImage,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CampaingButton(
                        buttonImage: levelImage,
                        label: 'level$level',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LevelInfoScreen()),
                          );
                        },
                      ),
                      CampaingButton(
                        buttonImage: 'images/group.png',
                        label: 'participant',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ParticipantScreen()),
                          );
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CampaingButton(
                        buttonImage: 'images/medal.png',
                        label: 'badge',
                        onPressed: () => BadgeScreen.show(
                          context,
                          database: database,
                        ),
                      ),
                      CampaingButton(
                        buttonImage: 'images/history.png',
                        label: 'history',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => History()),
                          );
                        },
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
