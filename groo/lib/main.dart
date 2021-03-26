import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:groo/screens/landing_screen.dart';
import 'package:groo/services/auth.dart';
import 'package:groo/services/database.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _initNotiSetting();
  runApp(MyApp());
}

void _initNotiSetting() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final initSettingsAndroid = AndroidInitializationSettings('ic_launcher');
  final initSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  final initSettings = InitializationSettings(
    android: initSettingsAndroid,
    iOS: initSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Groo',
        theme: ThemeData(
          primaryColor: Color(0xFF2DB400),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingScreen(
          databaseBuilder: (uid) => FirestoreDatabase(uid: uid),
        ),
      ),
    );
  }
}
