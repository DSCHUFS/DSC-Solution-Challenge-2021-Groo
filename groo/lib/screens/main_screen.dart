import 'package:flutter/material.dart';
import 'package:groo/screens/campaign_screen.dart';
import 'package:groo/screens/counseling_screen.dart';
import 'package:groo/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  PageController _pageController;
  List<Widget> _screen = [
    HomeScreen(),
    CampaignScreen(),
    CounselingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: _screen,
        ),
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
