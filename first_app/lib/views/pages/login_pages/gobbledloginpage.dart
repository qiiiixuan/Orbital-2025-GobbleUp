import 'package:flutter/material.dart';

class Gobbledloginpage extends StatelessWidget {
  const Gobbledloginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: 1,
            child: Image(
              image: AssetImage('assets/images/gobbled.png'),
              height: 150.0,
              width: 150.0,
            ),
          ),
        ],
      ),
    );
  }
}
