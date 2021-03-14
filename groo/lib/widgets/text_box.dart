import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextBox extends StatelessWidget {
  final FaIcon icon;
  final String subTitle;
  final String fillOutText;
  TextBox({this.icon, this.subTitle, this.fillOutText});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                icon,
                SizedBox(
                  width: 10,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              fillOutText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          border: Border.all(width: 1.0, color: Colors.white70)),
    );
  }
}
