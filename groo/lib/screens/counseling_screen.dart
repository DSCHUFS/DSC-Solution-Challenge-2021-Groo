import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/models/counseling.dart';
import 'package:groo/widgets/box_slider.dart';
import 'package:groo/widgets/carousel_slider.dart';

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
        if (!snapshot.hasData)
          return Center(
              child: LinearProgressIndicator(
            backgroundColor: Colors.green,
          ));
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
                icon: FaIcon(FontAwesomeIcons.tree),
                color: Colors.green,
                onPressed: () {}),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Center(
              child: CarouselImage(counselings: counselings),
            ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}
