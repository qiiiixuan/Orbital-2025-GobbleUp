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
       body: 
          Center(
              child: Text('Welcome to the Gobbled Home Page!'),
            ),

    );
  }
}
