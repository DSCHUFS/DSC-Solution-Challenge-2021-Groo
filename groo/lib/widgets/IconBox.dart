import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox({@required this.label, this.icon});

  final label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(icon),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
