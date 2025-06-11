import 'package:flutter/material.dart';

import '../home_pages/gobbledhomepage.dart';
import 'gobbledregisterpage.dart';

class Gobbledloginpage extends StatefulWidget {
  const Gobbledloginpage({super.key});

  @override
  State<Gobbledloginpage> createState() => _GobbledloginpageState();
}

class _GobbledloginpageState extends State<Gobbledloginpage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // These controllers are not used in this example, but can be used for form validation or submission.


  String confirmedUsername = '123';
  String confirmedPassword = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbled Test Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: 1,
                child: Image(
                  image: AssetImage('assets/images/gobbled.png'),
                  height: 150.0,
                  width: 150.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
            Text(usernameController.text),
            const SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              
              onEditingComplete: () {
                setState(() {});
              },
            ),
            Text(passwordController.text),
            ElevatedButton(
                onPressed: () {
                  onLoginButtonPressed();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Text('Login')),

            const SizedBox(height: 20.0),
            Text("or"),
            const SizedBox(height: 20.0),

            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return GobbledRegisterPage();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                ),
                child: Text('Register')),
          ],
        ),
      ),
    );
  }

  void onLoginButtonPressed() {
    if (usernameController.text == confirmedUsername &&
        passwordController.text == confirmedPassword) {
      var pushReplacement = Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return GobbledHomePage();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }
}
