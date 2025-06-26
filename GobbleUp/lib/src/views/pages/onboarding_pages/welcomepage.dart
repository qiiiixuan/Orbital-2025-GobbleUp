import 'package:GobbleUp/src/services/auth_layout_gobbler.dart';
import 'package:GobbleUp/src/services/auth_layout_gobbled.dart';
import 'package:GobbleUp/src/data/constants.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(50.0),
          ),
          Title(
            color: Colors.black,
            child: Text(
              "Gobble Up",
              style: KTextStyle.titleTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          SizedBox(
            child: Text(
              'I am a ...',
              style: KTextStyle.normalTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Hero(
                    tag: 2,
                    child: Image(
                      image: AssetImage('assets/images/gobbler.png'),
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return AuthLayout();
                        },
                      ));
                    },
                    child: Text("Gobbler"),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Column(
                children: [
                  Hero(
                    tag: 1,
                    child: Image(
                      image: AssetImage('assets/images/gobbled.png'),
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return AuthLayoutGobbled();
                        },
                      ));
                    },
                    child: Text("Gobbled"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
