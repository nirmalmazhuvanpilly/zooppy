import 'package:flutter/material.dart';
import 'package:zooppy/screens/addcash.dart';
import 'package:zooppy/screens/coupons.dart';
import 'package:zooppy/screens/fanbase.dart';
import './HomeScreenFields.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //BottomNavigationBar index value
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // print Value of selectedIndex
    // print(_selectedIndex);
  }

  //Created list of Widgets
  final List<Widget> _childrenWidgets = [
    HomeScreenFields(),
    AddCash(),
    Coupons(),
    Fanbase(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_rounded),
            label: 'Video League',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports),
            label: 'Game League',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
      body: _childrenWidgets[_selectedIndex],
    );
  }
}
