import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../widgets/campaign_list.dart';
import './settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      ),
    );
  }

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2DB400),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.cog),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => SettingsScreen(),
                  ),
                );
              }),
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
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Badges'),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Campaigns Participating'),
                    ),
                    CampaignList(),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Campaigns Participated'),
                    ),
                    CampaignList(),
                    SizedBox(
                      height: 100,
                    )
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
