import 'package:flutter/material.dart';
import 'package:groo/widgets/challenge_container.dart';

class NextChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
          child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            ),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end,children: [IconButton(icon: Icon(Icons.cancel), onPressed: (){
                    Navigator.pop(context);
                  })],),
          ChallengeContainer(challengeName: 'Cooking 30 Days', imagePath: 'images/Cooking.jpg'),
        ],
      ),)
    );
  }
}