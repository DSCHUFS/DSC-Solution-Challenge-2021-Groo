import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDialog extends StatelessWidget {
  final FaIcon icon;
  final String type;
  final String meetLink;
  InfoDialog({this.icon, this.type, this.meetLink});

  void _launchURL() async => await canLaunch(meetLink)
      ? await launch(meetLink)
      : throw 'Could not launch $meetLink';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 13,
          ),
          icon,
          SizedBox(
            width: 13,
          ),
          Column(
            children: [
              Text(
                'Information about',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                type,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'Counseling',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          TextButton(
            child: Text(
              'ⓧ',
              style: TextStyle(color: Colors.red[300], fontSize: 35.0),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: Container(
        height: 400.0,
        width: 350.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                FaIcon(FontAwesomeIcons.tree),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(' '),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.tree),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(' '),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.tree),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(''),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.tree),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: new Text(''),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                _launchURL();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
              label: Text(
                'Start Counseling',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              icon: FaIcon(FontAwesomeIcons.seedling),
            ),
          ],
        ),
      ),
    );
  }
}
