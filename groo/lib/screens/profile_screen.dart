import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2DB400),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.cog),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/IMG_5604.PNG'),
                radius: MediaQuery.of(context).size.width / 4,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Color(0xffCCF2F4),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Badges'),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Campaigns Participating'),
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 160.0,
                            color: Colors.red,
                          ),
                          Container(
                            width: 160.0,
                            color: Colors.blue,
                          ),
                          Container(
                            width: 160.0,
                            color: Colors.green,
                          ),
                          Container(
                            width: 160.0,
                            color: Colors.yellow,
                          ),
                          Container(
                            width: 160.0,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Campaigns Participated'),
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 160.0,
                            color: Colors.red,
                          ),
                          Container(
                            width: 160.0,
                            color: Colors.blue,
                          ),
                          Container(
                            width: 160.0,
                            color: Colors.green,
                          ),
                          Container(
                            width: 160.0,
                            color: Colors.yellow,
                          ),
                          Container(
                            width: 160.0,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: FontAwesomeIcons.plus,
        activeIcon: FontAwesomeIcons.times,
        children: [
          SpeedDialChild(
            child: Icon(Icons.accessibility),
            label: 'First',
            onTap: null,
          ),
          SpeedDialChild(
            child: Icon(Icons.accessibility),
            label: 'Second',
            onTap: null,
          ),
        ],
      ),
    );
  }
}
