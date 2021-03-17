import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groo/models/counseling.dart';

class CarouselImage extends StatefulWidget {
  final List<CounselingInfo> counselings;
  CarouselImage({this.counselings});
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<CounselingInfo> counselings;
  List<Widget> images;
  List<String> names;
  List<bool> lists;
  int _currentPage = 0;
  String _currentKeyword;

  @override
  void initState() {
    super.initState();
    counselings = widget.counselings;
    images = counselings.map((m) => Image.network(m.profile)).toList();
    names = counselings.map((m) => m.name).toList();
    _currentKeyword = names[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              items: images,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                    _currentKeyword = names[_currentPage];
                  });
                },
              ),
            ),
          ),
          Container(
            child: Text(_currentKeyword),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(names, _currentPage),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == i
            ? Color.fromRGBO(255, 255, 255, 0.9)
            : Color.fromRGBO(255, 255, 255, 0.4),
      ),
    ));
  }
  return results;
}
