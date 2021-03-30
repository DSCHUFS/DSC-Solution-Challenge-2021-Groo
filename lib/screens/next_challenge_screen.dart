import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:groo/models/challenge.dart';
import 'package:groo/services/database.dart';

class NextChallengeScreen extends StatelessWidget {
  NextChallengeScreen({@required this.database});
  final Database database;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        color: Color(0xFF737373),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Next month\'s challenge',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: StreamBuilder<Challenge>(
                    stream: database.nextChallengeStream(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              image: FirebaseImage(
                                snapshot.data.imagePath,
                                maxSizeBytes: 5000 * 1000,
                              ),
                              width: screenWidth * 0.9,
                            )),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
