import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/models/account_info.dart';
import 'package:groo/models/challenge.dart';
import 'package:groo/screens/introduction_screen.dart';
import 'package:groo/screens/levelInfo_screen.dart';
import 'package:groo/screens/next_challenge_screen.dart';
import 'package:groo/screens/participant_screen.dart';
import 'package:groo/services/database.dart';
import 'package:groo/widgets/challenge_button.dart';
import 'package:groo/screens/badge_screen.dart';
import 'package:groo/screens/history_screen.dart';
import 'package:provider/provider.dart';
import 'const.dart';

class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    final String nextImagePath = 'images/Cooking.jpg';
    int attendDays = 1;
    String levelImage;
    int level;

    void calculateLevel() {
      if (attendDays <= 7) {
        levelImage = 'images/sprout.png';
        level = 1;
      } else if (attendDays <= 14) {
        levelImage = 'images/sprout2.png';
        level = 2;
      } else if (attendDays <= 21) {
        levelImage = 'images/pot.png';
        level = 3;
      } else {
        levelImage = 'images/tulip.png';
        level = 4;
      }
    }

    calculateLevel();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/text_logo.png',
          width: 45,
        ),
        centerTitle: false,
        actions: [
          Tooltip(
            message: 'Next Month\'s Challenge Preview',
            child: IconButton(
                icon: FaIcon(FontAwesomeIcons.handPointRight),
                color: Colors.green,
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: false,
                    context: context,
                    builder: (BuildContext context) => NextChallengeScreen(
                      imagePath: nextImagePath,
                    ),
                  );
                }),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('This month\'s challenge',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 31,
                  )),
              StreamBuilder<Challenge>(
                  stream: database.thisChallengeStream(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final item = snapshot.data;
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0x3F2EB402),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              item.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                elevation: MaterialStateProperty.all(5.0),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(7.0)))),
                            child: Text('go to start', style: labelTextStyle),
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) =>
                                    IntroductionScreen(
                                  database: database,
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                  image: FirebaseImage(
                                    item.imagePath,
                                    maxSizeBytes: 5000 * 1000,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StreamBuilder<AccountInfo>(
                      stream: database.accountStream(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        attendDays = snapshot.data.attendDays;
                        calculateLevel();
                        return ChallengeButton(
                          buttonImage: levelImage,
                          label: 'level $level',
                          onPressed: () => LevelInfoScreen.show(
                            context,
                            database: database,
                          ),
                        );
                      }),
                  ChallengeButton(
                    buttonImage: 'images/group.png',
                    label: 'participants',
                    onPressed: () => ParticipantScreen.show(
                      context,
                      database: database,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ChallengeButton(
                    buttonImage: 'images/medal.png',
                    label: 'badge',
                    onPressed: () => BadgeScreen.show(
                      context,
                      database: database,
                    ),
                  ),
                  ChallengeButton(
                    buttonImage: 'images/history.png',
                    label: 'history',
                    onPressed: () => HistoryScreen.show(
                      context,
                      database: database,
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
