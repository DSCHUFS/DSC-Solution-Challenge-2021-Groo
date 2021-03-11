import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/models/counseling.dart';
import 'package:groo/widgets/box_slider.dart';
import 'package:groo/widgets/box_sliver_delegate.dart';

import 'profile_screen.dart';

class CounselingScreen extends StatefulWidget {
  @override
  Counseling createState() => Counseling();
}

class Counseling extends State<CounselingScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('counselors').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: streamData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<CounselingInfo> counselings =
        snapshot.map((d) => CounselingInfo.fromSnapshot(d)).toList();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFd4fc79), Color(0xFFCCF2F4)]),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Image.asset(
            'assets/text_logo.png',
            width: 45,
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.question),
              color: Colors.green,
              onPressed: () {
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
                          FaIcon(FontAwesomeIcons.infoCircle),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text('Is this your',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('First Counseling?',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
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
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            IconButton(
                icon: FaIcon(FontAwesomeIcons.tree),
                color: Colors.green,
                onPressed: () {}),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => ProfileScreen()));
                }),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomBoxSliverDelegate(
                expandedHeight: 120,
              ),
            ),
            SliverFillRemaining(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ListView(
                    children: [
                      BoxSlider(
                        counselings: counselings,
                        keyword: "Counselors for Corona Blue",
                        start: 0,
                        end: 4,
                      ),
                      BoxSlider(
                        counselings: counselings,
                        keyword: "Counselors for Career Counseling",
                        start: 0,
                        end: 4,
                      ),
                      BoxSlider(
                        counselings: counselings,
                        keyword: "Counselors for Anxiety and Depression",
                        start: 0,
                        end: 4,
                      ),
                      BoxSlider(
                        counselings: counselings,
                        keyword: "Counselors for Stress Management",
                        start: 0,
                        end: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}
