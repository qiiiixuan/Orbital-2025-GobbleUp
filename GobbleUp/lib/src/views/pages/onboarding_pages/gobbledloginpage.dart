import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/views/pages/home_pages/gobbledrootpage.dart';
import 'package:GobbleUp/src/views/pages/onboarding_pages/resetpasswordpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_pages/gobbledhomepage.dart';
import 'gobbledregisterpage.dart';

class GobbledLoginPage extends StatefulWidget {
  const GobbledLoginPage({super.key});

  @override
  State<GobbledLoginPage> createState() => _GobbledLoginPageState();
}

class _GobbledLoginPageState extends State<GobbledLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // These controllers are not used in this example, but can be used for form validation or submission.

  String errorMessage = '';

void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async{
    try{
      await authService.value.signIn(
        email: emailController.text.trim(),
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
        title: Text('Gobbled Login Page'),
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
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () {
                setState(() {});
              },
            ),
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
            Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResetPasswordPage();
                    },
                  ),
                );
              },
              child: Text('Reset Password'),
             ),
            ),

            const SizedBox(height: 10.0),

            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),

            ElevatedButton(
                onPressed: () {
                  signIn();
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

  
}
