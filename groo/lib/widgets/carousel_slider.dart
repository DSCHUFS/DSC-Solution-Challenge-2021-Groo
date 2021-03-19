import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:groo/models/counseling.dart';
import 'package:groo/screens/const.dart';

class CarouselImage extends StatefulWidget {
  // final List<CounselingInfo> counselings;
  // CarouselImage({this.counselings});
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  // List<CounselingInfo> counselings;
  // List<Widget> images;
  // List<String> names;
  // List<bool> lists;
  int _currentPage = 0;
  List imgList = [
    'https://cdn-0.therandomvibez.com/wp-content/uploads/2020/09/Cheer-Quotes.png',
    'https://r9t5u7b9.rocketcdn.me/wp-content/uploads/2017/04/cheer-up-quotes-unique.png',
    'https://i.pinimg.com/originals/08/57/7c/08577c822fd6b40a16f47365b332b8aa.jpg',
    'https://www.segerios.com/wp-content/uploads/2019/03/Superior-Cheer-Up-Quotes-600x595.jpg'
  ];
  // String _currentKeyword;

  @override
  void initState() {
    super.initState();
    // counselings = widget.counselings;
    // images = counselings.map((m) => Image.network(m.profile)).toList();
    // names = counselings.map((m) => m.name).toList();
    // _currentKeyword = names[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: imgList.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fill,
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  // _currentKeyword = names[_currentPage];
                });
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 8.0),
          //   child: Container(
          //     child: Text(
          //       _currentKeyword,
          //       style: AttendTextStyle,
          //     ),
          //   ),
          // ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(imgList, _currentPage),
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
