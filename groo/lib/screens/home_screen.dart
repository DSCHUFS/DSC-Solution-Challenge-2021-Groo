import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/screens/profile_screen.dart';
import 'package:groo/services/database.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/text_logo.png',
          width: 50,
        ),
        centerTitle: false,
        actions: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.tree),
              color: Colors.green,
              onPressed: () {}),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.user,
              color: Colors.green,
            ),
            onPressed: () => ProfileScreen.show(
              context,
              database: database,
            ),
          ),
        ],
      ),
    );
  }
}
