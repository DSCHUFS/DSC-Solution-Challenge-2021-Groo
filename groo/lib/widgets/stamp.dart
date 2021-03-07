import 'package:flutter/material.dart';


class Stamp extends StatelessWidget {
  const Stamp({@required this.stamp});

  final stamp;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          radius: 23.0,
          backgroundColor: Colors.white,
          child: stamp,
        ));
  }
}

