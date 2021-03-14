import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/models/counseling.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:groo/widgets/info_dialog.dart';
import 'package:groo/widgets/text_box.dart';
import 'package:url_launcher/url_launcher.dart';

class CounselingDetailScreen extends StatefulWidget {
  final CounselingInfo counseling;
  CounselingDetailScreen({this.counseling});
  _CounselingDetailScreenState createState() => _CounselingDetailScreenState();
}

class _CounselingDetailScreenState extends State<CounselingDetailScreen> {
  bool like = false;
  bool list = false;
  @override
  void initState() {
    super.initState();
    like = widget.counseling.like;
    list = widget.counseling.list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFd4fc79), Color(0xFFCCF2F4)]),
        ),
        child: Center(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(
                "Groo",
                style: TextStyle(
                  color: Color(0xFF2DB400),
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Color(0xFF2DB400),
                  ),
                  onPressed: () => Navigator.of(context).pop(null)),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(widget.counseling.profile),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                like
                                    ? Ink(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: Icon(Icons.favorite),
                                          onPressed: () {
                                            setState(() {
                                              like = !like;
                                              widget.counseling.reference
                                                  .update({'like': like});
                                            });
                                          },
                                        ),
                                      )
                                    : Ink(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: Icon(Icons.favorite_border),
                                          onPressed: () {
                                            setState(() {
                                              like = !like;
                                              widget.counseling.reference
                                                  .update({'like': like});
                                            });
                                          },
                                        ),
                                      ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Like\n")
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Text(
                                  widget.counseling.name,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Counselor',
                                  style: TextStyle(
                                    fontSize: 23,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                list
                                    ? Ink(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: Icon(Icons.check),
                                          onPressed: () {
                                            setState(() {
                                              list = !list;
                                              widget.counseling.reference
                                                  .update({'list': list});
                                            });
                                          },
                                        ),
                                      )
                                    : Ink(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              list = !list;
                                              widget.counseling.reference
                                                  .update({'list': list});
                                            });
                                          },
                                        ),
                                      ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  children: [
                                    Text('Add to'),
                                    Text('My List'),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFe7f0fd), Color(0xFFaccbee)]),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                          child: TextBox(
                              icon: FaIcon(FontAwesomeIcons.handsHelping),
                              subTitle: 'Cheer UP!',
                              fillOutText: widget.counseling.doctorInfo[0]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: TextBox(
                              icon: FaIcon(FontAwesomeIcons.trophy),
                              subTitle: 'Education / Certification',
                              fillOutText: widget.counseling.doctorInfo[1]),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
                          child: TextBox(
                              icon: FaIcon(FontAwesomeIcons.solidStar),
                              subTitle: 'Specialties',
                              fillOutText: widget.counseling.doctorInfo[2]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: SpeedDial(
              marginEnd: 32,
              marginBottom: 8,
              icon: Icons.play_arrow,
              activeIcon: Icons.stop,
              buttonSize: 56.0,
              visible: true,
              closeManually: false,
              renderOverlay: false,
              curve: Curves.bounceIn,
              overlayColor: Colors.white,
              overlayOpacity: 0.5,
              backgroundColor: Color(0xFFd4fc79),
              foregroundColor: Colors.black,
              elevation: 8.0,
              shape: CircleBorder(),
              children: [
                SpeedDialChild(
                  child: FaIcon(
                    FontAwesomeIcons.comments,
                  ),
                  backgroundColor: Colors.white,
                  label: 'Text-Chat Counseling',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InfoDialog(
                          icon: FaIcon(
                            FontAwesomeIcons.comments,
                          ),
                          type: 'Text-Chat',
                          meetLink: widget.counseling.meetLink,
                          firstInfo:
                              " You don't have to reveal your \nface or voice. We hope you get a \ncounseling comfortably!",
                          secondInfo:
                              ' Press button below and Enter to \ngoogle meet room!',
                          thirdInfo:
                              ' Then you and your counselor will \nget a dedicated room, which will\nbe your private and secure \nplace to communicate.',
                          fourthInfo:
                              ' In this room, you will write about\nyourself, the things going on \nyour life, ask questions and discuss\nthe issues that trouble you.',
                        );
                      },
                    );
                  },
                ),
                SpeedDialChild(
                  child: FaIcon(
                    FontAwesomeIcons.chalkboardTeacher,
                  ),
                  backgroundColor: Colors.white,
                  label: 'Video Counseling',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InfoDialog(
                          icon: FaIcon(
                            FontAwesomeIcons.chalkboardTeacher,
                          ),
                          type: 'Video',
                          meetLink: widget.counseling.meetLink,
                          firstInfo:
                              ' Do you prefer to talk face to face? \nYou can get a counseling face to \nface! And you can also use \ntext-chat and voice too!',
                          secondInfo:
                              ' Press button below and Enter to \ngoogle meet room!',
                          thirdInfo:
                              ' Then you and your counselor will \nget a dedicated room, which will\nbe your private and secure \nplace to communicate.',
                          fourthInfo:
                              ' In this room, you will talk about\nyourself, the things going on \nyour life, ask questions and discuss\nthe issues that trouble you.',
                        );
                      },
                    );
                  },
                ),
                SpeedDialChild(
                  child: FaIcon(
                    FontAwesomeIcons.headset,
                  ),
                  backgroundColor: Colors.white,
                  label: 'Voice Counseling',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return InfoDialog(
                          icon: FaIcon(
                            FontAwesomeIcons.headset,
                          ),
                          type: 'Voice',
                          meetLink: widget.counseling.meetLink,
                          firstInfo:
                              ' Voice sessions are a \ngreat way to conveniently speak \nwith your counselor by simply \nusing your mic on a cell phone.',
                          secondInfo:
                              ' Press button below and Enter to \ngoogle meet room!',
                          thirdInfo:
                              ' Then you and your counselor will \nget a dedicated room, which will\nbe your private and secure \nplace to communicate.',
                          fourthInfo:
                              ' In this room, you will talk about\nyourself, the things going on \nyour life, ask questions and discuss\nthe issues that trouble you.',
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
