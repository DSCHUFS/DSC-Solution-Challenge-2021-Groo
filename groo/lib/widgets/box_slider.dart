import 'package:flutter/material.dart';
import 'package:groo/models/counseling.dart';
import 'package:groo/screens/const.dart';
import 'package:groo/screens/counseling_detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<CounselingInfo> counselings;
  final String keyword;
  final int start;
  final int end;
  BoxSlider({this.counselings, this.keyword, this.start, this.end});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(keyword, style: labelTextStyle),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, counselings, start, end),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(BuildContext context,
    List<CounselingInfo> counselings, int start, int end) {
  List<Widget> results = [];
  for (var i = start; i < end; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return CounselingDetailScreen(counseling: counselings[i]);
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.network(counselings[i].profile),
          ),
        ),
      ),
    );
  }
  return results;
}
