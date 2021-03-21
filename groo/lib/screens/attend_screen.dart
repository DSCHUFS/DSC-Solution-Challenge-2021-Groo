import 'package:flutter/material.dart';
import 'package:groo/widgets/challenge_container.dart';
import 'const.dart';

class AttendScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
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
          'attendance status',
          style: titleTextStyle,
        ),
        backgroundColor: Color(0xFF2EB402),
      ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                ChallengeContainer(challengeName: 'running 20 Days', imagePath:'images/Running.jpg'),
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
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

