import 'package:flutter/material.dart';
import 'package:groo/widgets/IconBox.dart';

class CampaignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 35.0),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Introduction',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset('assets/Dancing.jpg'),
              ),
            ),
            Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Would you like to dance together?',
                    style: TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 20.0),
                  child: Text(
                    '''If your answer is yes, don\'t worry and participate. Whether you\'re good at dancing or not, we\'re together. hashCode\'s get rid of the stress while dancing!''',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconBox(label: '30 Days', icon: Icons.access_alarm),
                IconBox(label: 'K-pop', icon: Icons.music_note),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  padding: EdgeInsets.all(15.0),
                  color: Color(0x6F2DB400),
                  onPressed: (){
                    print('pressed');
                  },
                  child: Text(
                    'JOIN',
                    style: TextStyle(),
                  ),
                )
              ]),
            )
          ]),
        );
  }
}
