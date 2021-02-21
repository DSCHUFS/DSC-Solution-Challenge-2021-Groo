import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groo"),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: null),
          IconButton(icon: Icon(Icons.settings), onPressed: null),
        ],
      ),
    );
  }
}
