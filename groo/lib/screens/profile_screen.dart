import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groo/models/account_info.dart';
import 'package:groo/models/my_badge.dart';
import 'package:groo/models/my_campaign.dart';
import 'package:groo/screens/settings_screen.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/services/database.dart';
import 'package:groo/widgets/list_builder.dart';
import 'package:provider/provider.dart';
import 'package:firebase_image/firebase_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key, @required this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context, {Database database}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileScreen(
          database: database,
        ),
      ),
    );
  }

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final user = auth.currentUser;
    return Scaffold(
      backgroundColor: Color(0xFF2DB400),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.cog),
            onPressed: () => SettingsScreen.show(
              context,
              database: widget.database,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: Colors.transparent,
              height: 40 * constraints.maxHeight / 100,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 5 * constraints.maxHeight / 100,
                ),
                child: StreamBuilder<AccountInfo>(
                    stream: widget.database.accountStream(),
                    builder: (context, snapshot) {
                      final accountInfo = snapshot.data;
                      if (!snapshot.hasData) {
                        if (snapshot.hasError) {
                          var newInfo = AccountInfo(id: user.uid);
                          widget.database.setAccountInfo(newInfo);
                        }
                        return Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 11 * constraints.maxHeight / 100,
                                width: 22 * constraints.maxWidth / 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(user.photoURL),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5 * constraints.maxWidth / 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.displayName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            3 * constraints.maxHeight / 100,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: constraints.maxHeight / 100,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: Colors.white,
                                        size: 3 * constraints.maxHeight / 100,
                                      ),
                                      SizedBox(
                                        width: 2 * constraints.maxWidth / 100,
                                      ),
                                      Text(
                                        accountInfo.showEmail ?? false
                                            ? user.email
                                            : 'private',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize:
                                              2 * constraints.maxHeight / 100,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3 * constraints.maxHeight / 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: <Widget>[
                                  Text(
                                    "10.2K",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            3 * constraints.maxHeight / 100,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Follower",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize:
                                          1.9 * constraints.maxHeight / 100,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "543",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            3 * constraints.maxHeight / 100,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Following",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize:
                                          1.9 * constraints.maxHeight / 100,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white60),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize:
                                          1.8 * constraints.maxHeight / 100,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30 * constraints.maxHeight / 100),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFCCF2F4),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 40.0, top: 3 * constraints.maxHeight / 100),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Badges",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 3 * constraints.maxHeight / 100),
                          ),
                        ),
                      ),
                      SizedBox(height: 2 * constraints.maxHeight / 100),
                      Container(
                        height: 20 * constraints.maxHeight / 100,
                        child: StreamBuilder<List<MyBadge>>(
                          stream: widget.database.myBadgesStream(),
                          builder: (context, snapshot) {
                            return ListBuilder(
                              snapshot: snapshot,
                              itemBuilder: (context, myBadge) => _badge(
                                imagePath: myBadge.imagePath,
                                constraints: constraints,
                              ),
                              constraints: constraints,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 3 * constraints.maxHeight / 100),
                      Padding(
                        padding: EdgeInsets.only(left: 40.0, right: 30.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Participated Campains",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 3 * constraints.maxHeight / 100),
                          ),
                        ),
                      ),
                      SizedBox(height: 2 * constraints.maxHeight / 100),
                      Container(
                        height: 30 * constraints.maxHeight / 100,
                        child: StreamBuilder<List<MyCampaign>>(
                          stream: widget.database.myCampaignsStream(),
                          builder: (context, snapshot) {
                            return ListBuilder(
                              snapshot: snapshot,
                              itemBuilder: (context, myCampaign) =>
                                  _campaignCard(
                                name: myCampaign.name,
                                imagePath: myCampaign.imagePath,
                                constraints: constraints,
                              ),
                              constraints: constraints,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10 * constraints.maxWidth / 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _badge({@required String imagePath, @required BoxConstraints constraints}) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image(
          image: FirebaseImage(
            imagePath,
            maxSizeBytes: 4000 * 1000,
          ),
          height: 20 * constraints.maxHeight / 100,
          width: 40 * constraints.maxWidth / 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _campaignCard({
    @required String name,
    @required String imagePath,
    @required BoxConstraints constraints,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image(
              image: FirebaseImage(
                imagePath,
                maxSizeBytes: 4000 * 1000,
              ),
              height: 20 * constraints.maxHeight / 100,
              width: 70 * constraints.maxWidth / 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 2.5 * constraints.maxHeight / 100,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
