import 'package:flutter/material.dart';
import 'const.dart';

class ParticipantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        leading: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Color(0xFF2EB402)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          'participant',
          style: titleTextStyle,
        ),
        backgroundColor: Color(0xFF2EB402),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [UserContainer(), UserContainer(), UserContainer()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [UserContainer(), UserContainer(), UserContainer()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [UserContainer(), UserContainer(), UserContainer()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [UserContainer(), UserContainer(), UserContainer()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [UserContainer(), UserContainer(), UserContainer()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [UserContainer(), UserContainer(), UserContainer()],
          ),
        ]),
      ),
    );
  }
}

class UserContainer extends StatelessWidget {
  const UserContainer({this.userName, this.path});
  final String userName;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              Image.asset('images/user.png'),
              Text(
                'username',
                style: TextStyle(
                    fontFamily: 'Inconsolata',
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
