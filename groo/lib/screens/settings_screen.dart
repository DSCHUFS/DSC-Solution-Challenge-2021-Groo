import 'package:flutter/material.dart';
import 'package:groo/models/account_info.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/services/database.dart';
import 'package:groo/widgets/show_alert_dialog.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key, @required this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context, {Database database}) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsScreen(
          database: database,
        ),
      ),
    );
  }

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> _signOut() async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you wnat to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut();
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder<AccountInfo>(
          stream: widget.database.accountStream(),
          builder: (context, snapshot) {
            final accountInfo = snapshot.data;
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: ListView(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Account",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    height: 15,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildNotificationOptionRow(
                    title: "Show E-mail address",
                    isActive: accountInfo.showEmail ?? false,
                    onChanged: (bool newValue) async {
                      var newInfo =
                          AccountInfo(id: user.uid, showEmail: newValue);
                      await widget.database.setAccountInfo(newInfo);
                    },
                  ),
                  buildAccountOptionRow(context, "Content settings"),
                  buildAccountOptionRow(context, "Social"),
                  buildAccountOptionRow(context, "Language"),
                  buildAccountOptionRow(context, "Privacy and security"),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.volume_up_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Notifications",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    height: 15,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildNotificationOptionRow(
                    title: "New for you",
                    isActive: true,
                  ),
                  buildNotificationOptionRow(
                    title: "Account activity",
                    isActive: true,
                  ),
                  buildNotificationOptionRow(
                    title: "Opportunity",
                    isActive: false,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 40)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                      ),
                      onPressed: () => _confirmSignOut(context),
                      child: Text(
                        "SIGN OUT",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Row buildNotificationOptionRow(
      {String title, bool isActive, void Function(bool) onChanged}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: isActive,
            onChanged: onChanged,
          ),
        )
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
