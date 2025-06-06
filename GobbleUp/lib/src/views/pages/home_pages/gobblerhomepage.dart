import 'package:flutter/material.dart';

class GobblerHomePage extends StatefulWidget {
  const GobblerHomePage({super.key});

  @override
  State<GobblerHomePage> createState() => _GobblerHomePageState();
}

class _GobblerHomePageState extends State<GobblerHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbler Home Page'),
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: 
      //  currentIndex == 0
          Center(
              child: Text('Welcome to the Gobbler Home Page!'),
            ),
      //     : Center(
      //         child: SingleChildScrollView(
      //             child: Column(
      //         children: [
      //           CircleAvatar(
      //             radius: 50,
      //             backgroundImage: AssetImage('assets/images/gobbler.png'),
      //           ),
      //           Text('This is the Profile Page!'),
      //           IconButton(
      //             tooltip: 'Logout',
      //             icon: Icon(Icons.logout),
      //             onPressed: () {
      //               // Handle logout action
      //               Navigator.pop(
      //                   context); // Navigate back to the previous page
      //             },
      //           ),
      //           TextButton.icon(
      //             onPressed: () {
      //               // Handle logout action
      //               Navigator.pop(context); // Navigate back to the previous page
      //             },
      //             icon: const Icon(Icons.logout),
      //             label: const Text('Log out'),
      //           ),
      //         ],
      //       )
      //       )
      //       ),
      // bottomNavigationBar: NavigationBar(
      //   destinations: [
      //     NavigationDestination(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   onDestinationSelected: (int value) {
      //     setState(() {
      //       currentIndex = value;
      //     });
      //   },
      //   selectedIndex: currentIndex,
      // ),
    );
  }
}
