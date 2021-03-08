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
  List<CounselingInfo> counselings = [
    CounselingInfo.fromMap({
      'name': '안동현',
      'keyword': '불면증',
      'profile': 'doctor.png',
      'like': false,
      'list': false
    }),
    CounselingInfo.fromMap({
      'name': '안동현',
      'keyword': '불면증',
      'profile': 'doctor.png',
      'like': false,
      'list': false
    }),
    CounselingInfo.fromMap({
      'name': '안동현',
      'keyword': '불면증',
      'profile': 'doctor.png',
      'like': false,
      'list': false
    }),
    CounselingInfo.fromMap({
      'name': '안동현',
      'keyword': '불면증',
      'profile': 'doctor.png',
      'like': false,
      'list': false
    }),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                            width: 15,
                          ),
                          Text('상담이 처음이신가요?',
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                      ),
                      BoxSlider(
                        counselings: counselings,
                      ),
                      BoxSlider(
                        counselings: counselings,
                      ),
                      BoxSlider(
                        counselings: counselings,
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
}
