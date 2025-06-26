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
  // These controllers are not used in this example, but can be used for form validation or submission.

  bool hidePassword = true;
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
              obscureText: hidePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  child: Icon(
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