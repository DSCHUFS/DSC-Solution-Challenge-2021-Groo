import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:groo/models/my_badge.dart';
import 'package:groo/models/my_campaign.dart';
import 'package:groo/services/database.dart';
import 'package:groo/widgets/list_builder.dart';
import 'package:provider/provider.dart';

class ProfileViewScreen extends StatefulWidget {
  const ProfileViewScreen(
      {Key key,
      @required this.database,
      @required this.stream,
      @required this.uid})
      : super(key: key);
  final Database database;
  final Stream<Map<String, dynamic>> stream;
  final String uid;

  static Future<void> show(BuildContext context,
      {Database database,
      Stream<Map<String, dynamic>> stream,
      String uid}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileViewScreen(
          database: database,
          stream: stream,
          uid: uid,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _ProfileViewScreenState createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2DB400),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: StreamBuilder<Map<String, dynamic>>(
        stream: widget.stream,
        builder: (context, userSnapshot) {
          final accountInfo = userSnapshot.data;
          if (!userSnapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return LayoutBuilder(
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
                      top: 2 * constraints.maxHeight / 100,
                    ),
                    child: Column(
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
                                  image: NetworkImage(
                                      accountInfo["imagePath"] ?? ""),
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
                                  accountInfo["name"] ?? "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 3 * constraints.maxHeight / 100,
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
                                      accountInfo["showEmail"] ?? false
                                          ? accountInfo["email"] ?? ""
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
                                  accountInfo["followers"] != null
                                      ? accountInfo["followers"]
                                          .length
                                          .toString()
                                      : "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 3 * constraints.maxHeight / 100,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Follower",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 1.9 * constraints.maxHeight / 100,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  accountInfo["followings"] != null
                                      ? accountInfo["followings"]
                                          .length
                                          .toString()
                                      : "0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 3 * constraints.maxHeight / 100,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Following",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 1.9 * constraints.maxHeight / 100,
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
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Follow",
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 1.8 * constraints.maxHeight / 100,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 25 * constraints.maxHeight / 100),
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
                                left: 40.0,
                                top: 3 * constraints.maxHeight / 100),
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
                              stream:
                                  widget.database.myBadgesStream(widget.uid),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                return accountInfo["showBadges"]
                                    ? _privateContent()
                                    : ListBuilder(
                                        snapshot: snapshot,
                                        itemBuilder: (context, myBadge) =>
                                            _badge(
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
                                "Joined Campains",
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
                              stream:
                                  widget.database.myCampaignsStream(widget.uid),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                return accountInfo["showCampaigns"]
                                    ? _privateContent()
                                    : ListBuilder(
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
                          SizedBox(height: 20 * constraints.maxWidth / 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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

  Widget _privateContent({String title, String message}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Private",
            style: TextStyle(fontSize: 32.0, color: Colors.black54),
          ),
          Text(
            "These Contents are hidden",
            style: TextStyle(fontSize: 16.0, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
