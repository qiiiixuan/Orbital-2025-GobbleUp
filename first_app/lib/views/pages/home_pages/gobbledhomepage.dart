import 'package:flutter/material.dart';

class GobbledHomePage extends StatefulWidget {
  const GobbledHomePage({super.key});

  @override
  State<GobbledHomePage> createState() => _GobblerHomePageState();
}

class _GobblerHomePageState extends State<GobbledHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbled Home Page'),
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: currentIndex == 0
          ? Center(
              child: Text('Welcome to the Gobbled Home Page!'),
            )
          : Center(
              child: SingleChildScrollView(
                  child: Column(
              children: [
                Text('This is the Profile Page!'),
                IconButton(
                  tooltip: 'Logout',
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    // Handle logout action
                    Navigator.pop(
                        context); // Navigate back to the previous page
                  },
                ),
                TextButton.icon(
                  onPressed: () {
                    // Handle logout action
                    Navigator.pop(context); // Navigate back to the previous page
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Log out'),
                ),
              ],
            ))),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.add_chart),
            label: 'Statistics',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
      ),
    );
  }
  
}
