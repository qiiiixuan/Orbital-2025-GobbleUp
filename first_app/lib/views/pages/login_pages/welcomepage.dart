import 'package:first_app/views/pages/login_pages/gobbledloginpage.dart';
import 'package:first_app/views/pages/login_pages/gobblerloginpage.dart';
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
            child: Text("Gobble Up"),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
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
                          return GobblerLoginPage();
                        },
                      ));
                    },
                    child: Text("I am a Gobbler"),
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
                          return Gobbledloginpage();
                        },
                      ));
                    },
                    child: Text("I am a Gobbled"),
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
