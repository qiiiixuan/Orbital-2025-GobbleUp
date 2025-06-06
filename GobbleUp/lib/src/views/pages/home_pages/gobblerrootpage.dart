import 'package:flutter/material.dart';

import '../profile_pages/gobblerprofilepage.dart';
import 'gobblerhomepage.dart';

class GobblerRootPage extends StatefulWidget {
  const GobblerRootPage({super.key});

  @override
  State<GobblerRootPage> createState() => _GobblerRootPageState();
}

class _GobblerRootPageState extends State<GobblerRootPage> {
  int currentIndex = 0;

  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  void _onTapped(int index) {
    if (index == currentIndex) {
      // If the same tab is tapped, pop to the root of that tab
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        currentIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(int index, Widget child) {
    return Offstage(
      offstage: currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (settings) => 
          MaterialPageRoute(
            builder: (_) => child
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildOffstageNavigator(0, GobblerHomePage()),
          _buildOffstageNavigator(1, GobblerProfilePage()),
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onTapped,
        backgroundColor: const Color.fromARGB(255, 230, 59, 59),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
