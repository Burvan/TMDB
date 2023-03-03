import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  static const List<Widget> _widgetOptions = <Widget> [
    Text('Home'),
    Text('Movies'),
    Text('TV Shows')
  ];

  void onSelectTab(int index) {
    if(_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TMDB'),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Shows'),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
