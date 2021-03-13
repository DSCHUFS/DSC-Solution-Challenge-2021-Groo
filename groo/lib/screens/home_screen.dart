import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/screens/profile_screen.dart';
import 'package:groo/services/database.dart';
import 'package:groo/widgets/custom_elavated_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcaf7e3),
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
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildUsingTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }

  Widget _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xffcaf7e3),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Groo',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.015),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Heal your heart.',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you are experiencing symptoms of depression with \'Corona Blue\', which feels psychological anxiety beyond the frustration of COVID-19, ask for help immediately. Heal your heart.',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton.icon(
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call Now',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        launch("tel:");
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                    ),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Send SMS',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        launch("sms:");
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUsingTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Using Tips',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/profile-logo/icons8-name-100.png',
                      height: screenHeight * 0.12,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Decorate\nyour profile',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/campaign-logo/icons8-leader-100.png',
                      height: screenHeight * 0.12,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Join\nCampaigns',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/counseling-logo/icons8-agree-100.png',
                      height: screenHeight * 0.12,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Contact with\ncounselors',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: EdgeInsets.all(10.0),
        height: screenHeight * 0.18,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFcee6b4), Color(0xFF9ecca4)],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/fan.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Do your own test!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Follow the instructions\nto do your own test.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: screenHeight * 0.01),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Go to test"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
