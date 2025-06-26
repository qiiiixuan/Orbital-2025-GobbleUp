import 'package:GobbleUp/src/data/constants.dart';
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
        leading: Container(
          padding: EdgeInsets.only(
            left: 5.0,
            top: 5.0,
            bottom: 5.0,
          ),
          child: Hero(
            tag: 1,
            child: Image(
              image: AssetImage('assets/images/gobbled.png'),
            ),
          ),
        ),
        title: Text(
          'Statistics',
          style: KTextStyle.titleTextStyle,
        ),
        automaticallyImplyLeading: false, // Disable back button
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to the Gobbled Statistics Page!'),
            Text('(to be implemented)'),
          ],
        ),
      )
    );
  }
}