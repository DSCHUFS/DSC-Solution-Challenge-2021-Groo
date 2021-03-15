import 'package:flutter/material.dart';
import 'package:groo/screens/const.dart';

class CampaingButton extends StatelessWidget {
  const CampaingButton(
      {@required this.buttonImage, this.label, this.onPressed});

  final String buttonImage;
  final Function onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {

        return Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
                onPressed: onPressed,
                child: Column(
                  children: [
                    Image.asset(
                      buttonImage,
                      width: 100.0,
                    ),
                    SizedBox(height: 10),
                    Text(label,
                        style: labelTextStyle)
              ],
            )),
      ),
    );
  }
}