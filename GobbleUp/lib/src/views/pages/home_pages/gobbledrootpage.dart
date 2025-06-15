import '../profile_pages/gobbledprofilepage.dart';
import 'package:flutter/material.dart';
import 'gobbledhomepage.dart';

class GobbledRootPage extends StatefulWidget {
  const GobbledRootPage({super.key});

  @override
  State<GobbledRootPage> createState() => _GobbledRootPageState();
}

class _GobbledRootPageState extends State<GobbledRootPage> {
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
          _buildOffstageNavigator(0, GobbledHomePage()),
          _buildOffstageNavigator(1, GobbledProfilePage()),
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onTapped,
        backgroundColor: const Color.fromARGB(255, 240, 162, 162),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart),
            label: 'Statistics',
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
