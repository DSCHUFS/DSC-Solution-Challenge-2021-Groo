import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/models/my_stamp.dart';
import 'package:groo/widgets/challenge_container.dart';
import 'const.dart';

class AttendScreen extends StatefulWidget {
  const AttendScreen({this.challengeDays, this.todayIndex});
  final int challengeDays;
  final int todayIndex;

  @override
  _AttendScreenState createState() => _AttendScreenState();
}

class _AttendScreenState extends State<AttendScreen> {
  MyStamp myStamp;
  final int todayIndex = 0;
  final int challengeDays = 20;
  List<bool> attendList = List.filled(20, false);
  List<bool> attendList2 = List.generate(20, (index) {});
  List<Icon> iconList = List.filled(
      20,
      Icon(
        FontAwesomeIcons.mehBlank,
        size: 55,
        color: Colors.blueGrey[900],
      ));

  Function checkList(int index) {
    return () {
      if (index == todayIndex) {
        attendList[todayIndex] = true;
        setState(() {
          iconList[index] = Icon(
            FontAwesomeIcons.laughBeam,
            size: 55,
            color: Colors.green[500],
          );
        });
      }
    };
  }

  // Future<List> attendStatus(List LastAttendList) async {
  //   myStamp = MyStamp(attendance: LastAttendList);
  //   return LastAttendList;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Color(0xFF2EB402)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(
            'attendance status',
            style: titleTextStyle,
          ),
          backgroundColor: Color(0xFF2EB402),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ChallengeContainer(
                  challengeName: 'running 20 Days',
                  imagePath: 'images/Running.jpg'),
              Container(
                height: 450.0,
                margin: EdgeInsets.all(16.0),
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  children: List.generate(
                    challengeDays,
                    (index) {
                      return StampCircle(
                        onTap: checkList(index),
                        index: index,
                        iconList: iconList,
                      );
                    },
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

class StampCircle extends StatelessWidget {
  const StampCircle({this.onTap, this.index, this.iconList});
  final Function onTap;
  final int index;
  final List<Icon> iconList;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 29.0,
      child: GestureDetector(
        onTap: onTap,
        child: iconList[index],
      ),
    );
  }
}
