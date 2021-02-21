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
  PageController _pageController;
  List<Widget> _screen = [
    ProfileScreen(),
    SearchScreen(),
    HomeScreen(),
    CampaignScreen(),
    CounselingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: _screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF2DB400),
        fixedColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.easeOut);
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
