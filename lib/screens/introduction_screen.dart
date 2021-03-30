import 'package:flutter/material.dart';
import 'package:groo/models/challenge.dart';
import 'package:groo/screens/attend_screen.dart';
import 'package:groo/services/database.dart';
import 'const.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key key, this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context, {Database database}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => IntroductionScreen(
          database: database,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String subTitle = 'Let\'s run together!';
    String time;
    String Days;

    return Container(
      color: Color(0xFF737373),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green[200], Colors.blue[200]]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: StreamBuilder<Challenge>(
                stream: database.thisChallengeStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final item = snapshot.data;
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          children: [
                            Text('Introduction', style: titleTextStyle),
                            SizedBox(height: 5.0),
                            Text(
                              item.subTitle,
                              style: subTitleTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Text(
                          item.description.replaceAll("\\n", "\n"),
                          style: labelTextStyle,
                        ),
                      ),
                      Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListTile(
                            leading: Icon(
                              Icons.calendar_today,
                              color: Color(0xFF212121),
                              size: 30.0,
                            ),
                            title: Text(
                              '${item.totalDays} Days', // totalDays,
                              style: subTitleTextStyle,
                            ),
                          )),
                      Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ListTile(
                            leading: Icon(
                              Icons.alarm,
                              color: Color(0xFF212121),
                              size: 30.0,
                            ),
                            title: Text(
                              '${item.time} minutes', // time,
                              style: subTitleTextStyle,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(3.0),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 35.0)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.red, width: 5.0),
                                    borderRadius:
                                        new BorderRadius.circular(7.0)),
                              ),
                            ),
                            child: Text('JOIN', style: labelTextStyle),
                            onPressed: () =>
                                AttendScreen.show(context, database: database),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
