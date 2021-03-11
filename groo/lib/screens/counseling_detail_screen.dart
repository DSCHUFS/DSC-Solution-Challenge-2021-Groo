import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/models/counseling.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
    const _url = 'https://meet.google.com/ixt-mgin-nbc';
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not launch $_url';
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
                                Text("Add to\nMy List")
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
                            child: Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          // SizedBox(
                                          //   width: 20,
                                          // ),
                                          FaIcon(FontAwesomeIcons.handsHelping),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Cheer UP!',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        widget.counseling.oneLine,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1.0, color: Colors.white70)),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FaIcon(FontAwesomeIcons.trophy),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Education / Certification',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0, color: Colors.white70),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 4),
                          child: Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FaIcon(FontAwesomeIcons.tree),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Specialties',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1.0, color: Colors.white70),
                              ),
                            ),
                          ),
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
                        return AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              FaIcon(FontAwesomeIcons.comments),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Text-Chat',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Counseling',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Information',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              TextButton(
                                child: Text(
                                  'ⓧ',
                                  style: TextStyle(
                                      color: Colors.red[300], fontSize: 35.0),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          content: Container(
                            height: 400.0,
                            width: 350.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(' '),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(' '),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(''),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: new Text(''),
                                    ),
                                  ],
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _launchURL();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  label: Text(
                                    'Start Counseling',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  icon: FaIcon(FontAwesomeIcons.seedling),
                                ),
                              ],
                            ),
                          ),
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
                        return AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 13,
                              ),
                              FaIcon(FontAwesomeIcons.chalkboardTeacher),
                              SizedBox(
                                width: 13,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Video Counseling',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Information',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              TextButton(
                                child: Text(
                                  'ⓧ',
                                  style: TextStyle(
                                      color: Colors.red[300], fontSize: 35.0),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          content: Container(
                            height: 400.0,
                            width: 350.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(' '),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(' '),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(''),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: new Text(''),
                                    ),
                                  ],
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _launchURL();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  label: Text(
                                    'Start Counseling',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  icon: FaIcon(FontAwesomeIcons.seedling),
                                ),
                              ],
                            ),
                          ),
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
                        return AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              FaIcon(FontAwesomeIcons.headset),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Voice Counseling',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Information',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              TextButton(
                                child: Text(
                                  'ⓧ',
                                  style: TextStyle(
                                      color: Colors.red[300], fontSize: 35.0),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          content: Container(
                            height: 400.0,
                            width: 350.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(' '),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(' '),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(''),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.tree),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: new Text(''),
                                    ),
                                  ],
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _launchURL();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  label: Text(
                                    'Start Counseling',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  icon: FaIcon(FontAwesomeIcons.seedling),
                                ),
                              ],
                            ),
                          ),
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
