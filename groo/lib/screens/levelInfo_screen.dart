import 'package:flutter/material.dart';
import 'const.dart';

class LevelInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF2EB402))),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(
            "Level Information",
            style: titleTextStyle,
          ),
          backgroundColor: Color(0xFF2EB402)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(
              //     color: Colors.green[100],
              //     borderRadius: BorderRadius.circular(15.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LevelContainer(
                          path: 'images/sprout.png',
                          label: 'level1',
                        ),
                        LevelContainer(
                            path: 'images/sprout2.png', label: 'level2'),
                        LevelContainer(path: 'images/pot.png', label: 'level3'),
                        LevelContainer(
                            path: 'images/tulip.png', label: 'level4')
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'level1',
                            style: AttendTextStyle,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'This is the first week of the challenge.\n We support your challenge.',
                            textAlign: TextAlign.center,
                            style: labelTextStyle,
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'level2',
                            style: AttendTextStyle,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Achieve half of all challenges.\nYou will get a badge.',
                            textAlign: TextAlign.center,
                            style: labelTextStyle,
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'level3',
                            style: AttendTextStyle,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Achieve three-quarters of the total challenge. You are a really great person.',
                            textAlign: TextAlign.center,
                            style: labelTextStyle,
                          ),
                          SizedBox(height: 30.0),
                          Text(
                            'level4',
                            style: AttendTextStyle,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'You opened a nice single flower. Congratulations!',
                            textAlign: TextAlign.center,
                            style: labelTextStyle,
                          )
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                  color: Colors.brown,
                  width: double.infinity,
                  height: 100.0,
                  child: Center(
                    child: Text('Go to Attendance',
                        style: attendTextStyle),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class LevelContainer extends StatelessWidget {
  const LevelContainer({@required this.path, @required this.label});

  final String path;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(children: [
        Image.asset(path),
        Text(
          label,
          style: labelTextStyle,
        ),
      ]),
    );
  }
}
