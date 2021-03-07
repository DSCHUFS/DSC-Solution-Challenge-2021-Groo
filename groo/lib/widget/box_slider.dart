import 'package:flutter/material.dart';
import 'package:groo/models/counseling.dart';
import 'package:groo/screens/counseling_detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<CounselingInfo> counselings;
  BoxSlider({this.counselings});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("불면증에 도움이 됐어요!"),
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, counselings),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(
    BuildContext context, List<CounselingInfo> counselings) {
  List<Widget> results = [];
  for (var i = 0; i < counselings.length; i++) {
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
            child: Image.asset('images/' + counselings[i].profile),
          ),
        ),
      ),
    );
  }
  return results;
}
