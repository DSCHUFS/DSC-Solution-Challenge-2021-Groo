import 'package:flutter/material.dart';
import 'package:groo/models/account_info.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/services/database.dart';
import 'package:groo/services/notification_service.dart';
import 'package:groo/widgets/show_alert_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final notificationService = NotificationService();
  bool _isNotify = false;

  _loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isNotify = (prefs.getBool('isNotify') ?? false);
    });
  }

  _setPref(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isNotify = value;
      prefs.setBool('isNotify', _isNotify);
    });
  }

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
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut();
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        notificationService.setNotification(
          selectedTime.hour,
          selectedTime.minute,
        );
      });
    } else {
      setState(() {
        _isNotify = false;
      });
    }
  }

  @override
  void initState() {
    _loadPref();
    super.initState();
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
            bool _showEmail;
            bool _showBadges;
            bool _showCampaigns;
            List<dynamic> _followers;
            List<dynamic> _followings;
            Future updateAccount() async {
              await widget.database.setAccountInfo(
                AccountInfo(
                  id: user.uid,
                  email: user.email,
                  name: user.displayName,
                  imagePath: user.photoURL,
                  showEmail: _showEmail,
                  showBadges: _showBadges,
                  showCampaigns: _showCampaigns,
                  followers: _followers,
                  followings: _followings,
                ),
              );
            }

            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            if (accountInfo != null) {
              _showEmail = accountInfo.showEmail;
              _showBadges = accountInfo.showBadges;
              _showCampaigns = accountInfo.showCampaigns;
              _followers = accountInfo.followers;
              _followings = accountInfo.followings;
            }
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
                      _showEmail = newValue;
                      await updateAccount();
                    },
                  ),
                  buildNotificationOptionRow(
                    title: "Hide my badges",
                    isActive: accountInfo.showBadges ?? false,
                    onChanged: (bool newValue) async {
                      _showBadges = newValue;
                      await updateAccount();
                    },
                  ),
                  buildNotificationOptionRow(
                    title: "Hide My campaigns",
                    isActive: accountInfo.showCampaigns ?? false,
                    onChanged: (bool newValue) async {
                      _showCampaigns = newValue;
                      await updateAccount();
                    },
                  ),
                  buildAccountOptionRow(
                    context: context,
                    title: 'Language',
                    children: [
                      Text('Other languages are not yet supported'),
                    ],
                  ),
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
                    title: "Off/On",
                    isActive: _isNotify,
                    onChanged: (bool newValue) {
                      _setPref(newValue);
                      newValue
                          ? _selectTime(context)
                          : notificationService.cancelAllNotification();
                    },
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
                  ),
                  SizedBox(
                    height: 30,
                  ),
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

  GestureDetector buildAccountOptionRow(
      {BuildContext context, String title, List<Widget> children}) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: children,
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
