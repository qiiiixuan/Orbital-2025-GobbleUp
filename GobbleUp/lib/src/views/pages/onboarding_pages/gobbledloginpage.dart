import 'package:GobbleUp/src/data/constants.dart';
import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/views/pages/onboarding_pages/resetpasswordpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'gobbledregisterpage.dart';

class GobbledLoginPage extends StatefulWidget {
  const GobbledLoginPage({super.key});

  @override
  State<GobbledLoginPage> createState() => _GobbledLoginPageState();
}

class _GobbledLoginPageState extends State<GobbledLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Controllers are to save the text input from the user

  bool hidePassword = true;
  String errorMessage = '';


  // Sign in function
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
                // Will update the state when the user finishes editing
              },
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: hidePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle the visibility of the password
                      hidePassword = !hidePassword;
                    });
                  },
                  child: Icon(
                    // Change the icon based on the visibility of the password
                    hidePassword ? Icons.visibility : Icons.visibility_off
                  ),
                ),
              ),
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

            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),

            const SizedBox(height: 10.0),

            ElevatedButton(
                onPressed: () {
                  signIn();
                },
                style: KButtonStyle.elevatedButtonStyle,
                child: Text(
                  'Login',
                  style: KTextStyle.buttonTextStyle,
                ),
            ),

            const SizedBox(height: 40.0),
            Text(
              "New Restaurant?",
            ),
            const SizedBox(height: 10.0),

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
              child: Text(
                'Register',
                style: KTextStyle.buttonTextStyle,
              )
            ),
          ],
        ),
      ),
    );
  }
}