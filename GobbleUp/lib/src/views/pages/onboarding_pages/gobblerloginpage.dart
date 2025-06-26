import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/views/pages/onboarding_pages/resetpasswordpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../data/constants.dart';
import 'gobblerregisterpage.dart';

class GobblerLoginPage extends StatefulWidget {
  const GobblerLoginPage({super.key});

  @override
  State<GobblerLoginPage> createState() => _GobblerLoginPageState();
}

class _GobblerLoginPageState extends State<GobblerLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // String confirmedUsername = '123';
  // String confirmedPassword = '123';
  bool hidePassword = true;
  String errorMessage = '';

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    try {
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
              )
            ),

            const SizedBox(height: 40.0),
            Text("New User?"),
            const SizedBox(height: 10.0),

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