import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:groo/models/my_badge.dart';
import 'package:groo/screens/const.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/services/database.dart';
import 'package:provider/provider.dart';
import 'const.dart';

class BadgeScreen extends StatefulWidget {
  const BadgeScreen({Key key, @required this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context, {Database database}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BadgeScreen(
          database: database,
        ),
      ),
    );
  }

  @override
  _BadgeScreenState createState() => _BadgeScreenState();
}

class _BadgeScreenState extends State<BadgeScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final user = auth.currentUser;
    final badgePadding = EdgeInsets.all(70.0);

    return Scaffold(
      backgroundColor: Color(0x40CCCCCC),
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
            "Your Badge",
            style: titleTextStyle,
          ),
          backgroundColor: Color(0xFF2EB402)),
      body: SingleChildScrollView(
        child: Container(
          child: StreamBuilder<List<MyBadge>>(
              stream: widget.database.myBadgesStream(user.uid),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<Padding> items = snapshot.data
                    .map(
                      (e) => Padding(
                        padding: badgePadding,
                        child: Image(
                          image: FirebaseImage(
                            e.imagePath,
                            maxSizeBytes: 4000 * 1000,
                          ),
                        ),
                      ),
                    )
                    .toList();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: items,
                );
              }),
        ),
      ),
    );
  }
}
