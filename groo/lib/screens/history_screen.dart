import 'package:flutter/material.dart';
import 'const.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> challengeName = [
    'Running 30 Days',
    'Dancing 30 Days',
    'Cooking 30 Days'
  ];
  List<String> imagePath = [
    'images/Running.jpg',
    'images/Dancing.jpg',
    'images/Cooking.jpg'
  ];
  List<int> challengeDays = [20, 1, 29];
  int challengeNumber = 0;
  int currentLevel;
  String levelImage;
  double opacityLeft = 0.0;
  double opacityRight = 1.0;
  void calculateLevel() {
    if (challengeDays[challengeNumber] <= 7) {
      levelImage = 'images/sprout.png';
      currentLevel = 1;
    } else if (challengeDays[challengeNumber] <= 14) {
      levelImage = 'images/sprout2.png';
      currentLevel = 2;
    } else if (challengeDays[challengeNumber] <= 25) {
      levelImage = 'images/pot.png';
      currentLevel = 3;
    } else {
      levelImage = 'images/tulip.png';
      currentLevel = 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    calculateLevel();
    return Scaffold(
      appBar: AppBar(
          leading: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF2EB402))),
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
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container( width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                color: Color(0x2F2EB402),
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      challengeName[challengeNumber],
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
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
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
                      margin:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(imagePath[challengeNumber]),
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
                    child: FlatButton(
                      child: Image.asset(
                        'images/left-arrow.png',
                        width: 70.0,
                      ),
                      onPressed: () {
                        setState(() {
                          calculateLevel();
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
                    child: FlatButton(
                        child: Image.asset(
                          'images/right-arrow.png',
                          width: 70.0,
                        ),
                        onPressed: () {
                          setState(() {
                            calculateLevel();
                            if (challengeNumber < challengeName.length - 1) {
                              opacityLeft = 1.0;
                              challengeNumber += 1;
                              if (challengeNumber == challengeName.length - 1) {
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
        ),
      ),
    );
  }
}
