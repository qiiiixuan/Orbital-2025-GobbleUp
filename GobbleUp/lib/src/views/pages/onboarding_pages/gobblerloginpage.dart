import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_pages/gobblerrootpage.dart';
import 'gobblerregisterpage.dart';

class GobblerLoginPage extends StatefulWidget {
  const GobblerLoginPage({super.key});

  @override
  State<GobblerLoginPage> createState() => _GobblerLoginPageState();
}

class _GobblerLoginPageState extends State<GobblerLoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String confirmedUsername = '123';
  String confirmedPassword = '123';
  String errorMessage = '';
  
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async{
    try{
      await authService.value.signIn(
        email: usernameController.text.trim(),
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = 'Login failed: ${e.message}';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbler Login Page'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: 2,
                child: Image(
                  image: AssetImage('assets/images/gobbler.png'),
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

            const SizedBox(height: 10.0),

            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),

            ElevatedButton(
                onPressed: () {
                  //when I fix the sign in function, I will uncomment this
                  //signIn(); 

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
                        return GobblerRegisterPage();
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return GobblerRootPage();
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
