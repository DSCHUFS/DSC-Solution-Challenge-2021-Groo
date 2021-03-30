import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/models/account_info.dart';
import 'package:groo/models/challenge.dart';
import 'package:groo/models/my_badge.dart';
import 'package:groo/models/participant.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/services/database.dart';
import 'package:groo/widgets/challenge_container.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:provider/provider.dart';
import 'const.dart';

class AttendScreen extends StatefulWidget {
  const AttendScreen({Key key, @required this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context, {Database database}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AttendScreen(
          database: database,
        ),
      ),
    );
  }

  @override
  _AttendScreenState createState() => _AttendScreenState();
}

class _AttendScreenState extends State<AttendScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final user = auth.currentUser;
    int attendance;
    String lastAttendanceDay;
    String today = DateTime.now().toString().substring(0, 11);
    int challengeDays = 20;

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
          'attendance status',
          style: titleTextStyle,
        ),
        backgroundColor: Color(0xFF2EB402),
      ),
      body: SingleChildScrollView(
          child: StreamBuilder<Challenge>(
        stream: widget.database.thisChallengeStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final item = snapshot.data;
          challengeDays = item.totalDays;
          return Column(
            children: [
              ChallengeContainer(
                challengeName: item.name,
                imagePath: item.imagePath,
              ),
              StreamBuilder<AccountInfo>(
                stream: widget.database.accountStream(),
                builder: (context, snapshot) {
                  final accountInfo = snapshot.data;
                  bool _showEmail;
                  bool _showBadges;
                  bool _showChallenges;
                  List<dynamic> _followers;
                  List<dynamic> _followings;
                  Future updateAttendance(
                      int attendDays, Timestamp lastAttendance) async {
                    await widget.database.setAccountInfo(
                      AccountInfo(
                        id: user.uid,
                        email: user.email,
                        name: user.displayName,
                        imagePath: user.photoURL,
                        showEmail: _showEmail,
                        showBadges: _showBadges,
                        showChallenges: _showChallenges,
                        followers: _followers,
                        followings: _followings,
                        attendDays: attendDays,
                        lastAttendance: lastAttendance,
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (accountInfo != null) {
                    _showEmail = accountInfo.showEmail;
                    _showBadges = accountInfo.showBadges;
                    _showChallenges = accountInfo.showChallenges;
                    _followers = accountInfo.followers;
                    _followings = accountInfo.followings;
                  }
                  attendance = accountInfo.attendDays ?? 0;
                  Timestamp lastAttend =
                      accountInfo.lastAttendance ?? Timestamp(0, 0);
                  lastAttendanceDay =
                      lastAttend.toDate().toString().substring(0, 11);
                  List<Icon> iconList = List.generate(
                      challengeDays,
                      (index) => index < attendance
                          ? Icon(
                              FontAwesomeIcons.laughBeam,
                              size: 55,
                              color: Colors.green[500],
                            )
                          : Icon(
                              FontAwesomeIcons.mehBlank,
                              size: 55,
                              color: Colors.blueGrey[900],
                            ));

                  Function checkList(int index) {
                    return () {
                      if (index == attendance && today != lastAttendanceDay) {
                        setState(() {
                          attendance++;
                          updateAttendance(attendance, Timestamp.now());
                          if (attendance == 1) {
                            widget.database.setParticipant(Participant(
                              id: user.uid,
                              name: user.displayName,
                              imagePath: user.photoURL,
                            ));
                          }
                          if (challengeDays / attendance == 2.0) {
                            showDialog(
                              context: context,
                              builder: (_) => NetworkGiffyDialog(
                                title: Text(
                                  "Congratulation!",
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inconsolata',
                                  ),
                                ),
                                image: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Image(
                                    image: FirebaseImage(
                                      item.badge,
                                    ),
                                  ),
                                ),
                                description: Text(
                                  "You earn the Badge!",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Inconsolata',
                                  ),
                                ),
                                entryAnimation: EntryAnimation.TOP_LEFT,
                                onOkButtonPressed: () {
                                  Navigator.pop(context);
                                },
                                onlyOkButton: true,
                              ),
                            );
                            widget.database.setMyBadge(
                              MyBadge(
                                id: UniqueKey().toString(),
                                name: item.name,
                                imagePath: item.badge,
                              ),
                            );
                          }
                        });
                      }
                    };
                  }

                  return Container(
                    height: 450.0,
                    margin: EdgeInsets.all(16.0),
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      children: List.generate(
                        challengeDays,
                        (index) {
                          return StampCircle(
                            onTap: checkList(index),
                            index: index,
                            iconList: iconList,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      )),
    );
  }
}

class StampCircle extends StatelessWidget {
  const StampCircle({this.onTap, this.index, this.iconList});
  final Function onTap;
  final int index;
  final List<Icon> iconList;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 29.0,
      child: GestureDetector(
        onTap: onTap,
        child: iconList[index],
      ),
    );
  }
}
