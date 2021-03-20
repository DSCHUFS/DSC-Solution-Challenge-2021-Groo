import 'package:flutter/material.dart';
import 'const.dart';

class AttendScreen extends StatelessWidget {
  Image defaultImage = Image.asset('images/default.jpeg');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                ChallengeContainer(),
                Container(
                  height: 435.0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StampCircle(
                                borderColor: Colors.transparent,
                                image: Image.asset('assets/start-line.png'),
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.transparent,
                                image: Image.asset('assets/fan.png'),
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.transparent,
                                image: Image.asset('assets/fan.png'),
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.black,
                                image: null,
                              ),
                              StampCircle(
                                borderColor: Colors.transparent,
                                image: Image.asset('assets/trophy.png'),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StampCircle extends StatelessWidget {
  const StampCircle({this.borderColor, this.image});

  final Color borderColor;
  final image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: borderColor,
      radius: 30.0,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 29.0,
        child: image,
      ),
    );
  }
}

class ChallengeContainer extends StatelessWidget {
  const ChallengeContainer({
    Key key,
  }) : super(key: key);

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
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: myImage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
