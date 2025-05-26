import 'package:flutter/material.dart';

class GobblerLoginPage extends StatelessWidget {
  const GobblerLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: 2,
            child: Image(
              image: AssetImage('assets/images/gobbler.png'),
              height: 150.0,
              width: 150.0,
            ),
          ),
        ],
      ),
    );
  }
}