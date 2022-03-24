import 'package:app_noticias/news_screens/allnews_screen.dart';
import 'package:app_noticias/news_screens/business_screen.dart';
import 'package:app_noticias/news_screens/health_screen.dart';
import 'package:app_noticias/news_screens/sports_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var screens = [
    const AllNewsScreen(),
    const BusinessScreen(),
    const SportsScreen(),
    const HealthScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: screens.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'All news',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Text(
                'Business',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Sports',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'Health',
                style: TextStyle(color: Colors.black),
              ),
            ],
            onTap: _onTappedItem,
          ),
          title: Image.asset(
            'assets/images/GDK.png',
            height: 55,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: screens[_selectedIndex],
      ),
    );
  }
}
