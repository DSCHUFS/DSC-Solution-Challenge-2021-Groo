import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/models/counseling.dart';
import 'package:groo/widgets/box_slider.dart';
import 'package:groo/widgets/box_sliver_delegate.dart';

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
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFd4fc79), Color(0xFFCCF2F4)]),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Groo",
              style: TextStyle(
                color: Color(0xFF2DB400),
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(icon: FaIcon(FontAwesomeIcons.tree), onPressed: null),
              IconButton(icon: Icon(Icons.settings), onPressed: null),
              IconButton(icon: Icon(Icons.person), onPressed: null),
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
      ),
    );
  }
}
