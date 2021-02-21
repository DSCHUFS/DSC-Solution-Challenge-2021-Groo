import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/profile_screen.dart';
import './screens/search_screen.dart';
import './screens/campaign_screen.dart';
import './screens/counseling_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groo',
      theme: ThemeData(
        primaryColor: Color(0xFF2DB400),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Groo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 2;
  List<Widget> _screen = [
    ProfileScreen(),
    SearchScreen(),
    HomeScreen(),
    CampaignScreen(),
    CounselingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: null),
          IconButton(icon: Icon(Icons.settings), onPressed: null),
        ],
      ),
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF2DB400),
        fixedColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          })
        },
        items: [
          BottomNavigationBarItem(
            label: "More",
            icon: Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Campaign",
            icon: Icon(Icons.military_tech),
          ),
          BottomNavigationBarItem(
            label: "Counseling",
            icon: Icon(Icons.forum),
          ),
        ],
      ),
    );
  }
}
