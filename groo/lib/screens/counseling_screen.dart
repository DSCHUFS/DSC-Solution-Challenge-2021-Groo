import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Counseling {
  final String name;
  final String keyword;
  final String profile;
  final bool like;

  Counseling.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        keyword = map['keyword'],
        profile = map['profile'],
        like = map['like'];

  @override
  String toString() => "Counseling<$name:$keyword>";
}

class BoxSlider extends StatelessWidget {
  final List<Counseling> counselings;
  BoxSlider({this.counselings});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("불면증에 도움이 됐어요!"),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(counselings),
            ),
          )
        ],
      ),
    );
  }
}

class CounselingScreen extends StatelessWidget {
  List<Counseling> counselings = [
    Counseling.fromMap({
      'name': '안동현',
      'keyword': '불면증',
      'poster': 'professional-doctor-office.jpg',
      'like': false
    })
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: Column(
          children: [
            Container(height: 50),
            BoxSlider(counselings: counselings),
          ],
        ),
      ),
    );
  }
}

List<Widget> makeBoxImages(List<Counseling> counselings) {
  List<Widget> results = [];
  for (var i = 0; i < counselings.length; i++) {
    results.add(InkWell(
        onTap: () {},
        child: Container(
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('images/' + counselings[i].profile),
            ))));
  }
  return results;
}
