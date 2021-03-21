import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:groo/models/my_campaign.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/services/database.dart';
import 'package:provider/provider.dart';
import 'const.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key key, @required this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context, {Database database}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HistoryScreen(
          database: database,
        ),
      ),
    );
  }

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<int> challengeDays = [20, 1, 29];
  int challengeNumber = 0;
  int currentLevel;
  String levelImage;
  double opacityLeft = 0.0;
  double opacityRight = 0.0;

  void calculateLevel(int challengeDays) {
    if (challengeDays <= 7) {
      levelImage = 'images/sprout.png';
      currentLevel = 1;
    } else if (challengeDays <= 14) {
      levelImage = 'images/sprout2.png';
      currentLevel = 2;
    } else if (challengeDays <= 25) {
      levelImage = 'images/pot.png';
      currentLevel = 3;
    } else {
      levelImage = 'images/tulip.png';
      currentLevel = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final user = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
          leading: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Color(0xFF2EB402)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(
            "Challenge History",
            style: titleTextStyle,
          ),
          backgroundColor: Color(0xFF2EB402)),
      body: SingleChildScrollView(
        child: StreamBuilder<List<MyCampaign>>(
            stream: widget.database.myCampaignsStream(user.uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              List<MyCampaign> items = snapshot.data;
              if (items.isEmpty) {
                return _emptyContent(
                  title: 'Nothing here',
                  message: 'Add a new item to get started',
                );
              }
              if (items.length > 1 && challengeNumber != items.length - 1) {
                opacityRight = 1.0;
              }
              calculateLevel(items[challengeNumber].challengeDays);
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    decoration: BoxDecoration(
                      color: Color(0x2F2EB402),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            items[challengeNumber].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          width: 250.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          margin: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    levelImage,
                                    width: 70.0,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text('level$currentLevel',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Inconsolata',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: FirebaseImage(
                                  items[challengeNumber].imagePath,
                                  maxSizeBytes: 4000 * 1000,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Opacity(
                          opacity: opacityLeft,
                          child: TextButton(
                            child: Image.asset(
                              'images/left-arrow.png',
                              width: 70.0,
                            ),
                            onPressed: () {
                              setState(() {
                                calculateLevel(
                                    items[challengeNumber].challengeDays);
                                if (challengeNumber > 0) {
                                  opacityRight = 1.0;
                                  challengeNumber -= 1;
                                  if (challengeNumber == 0) {
                                    opacityLeft = 0.0;
                                  } else {
                                    opacityLeft = 1.0;
                                  }
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Opacity(
                          opacity: opacityRight,
                          child: TextButton(
                              child: Image.asset(
                                'images/right-arrow.png',
                                width: 70.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  calculateLevel(
                                      items[challengeNumber].challengeDays);
                                  if (challengeNumber < items.length - 1) {
                                    opacityLeft = 1.0;
                                    challengeNumber += 1;
                                    if (challengeNumber == items.length - 1) {
                                      opacityRight = 0.0;
                                    } else {
                                      opacityRight = 1.0;
                                    }
                                  }
                                });
                              }),
                        ),
                      )
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }

  Widget _emptyContent({String title, String message}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 32.0, color: Colors.black54),
          ),
          Text(
            message,
            style: TextStyle(fontSize: 16.0, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
