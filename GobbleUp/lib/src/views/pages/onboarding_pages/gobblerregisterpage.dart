import 'package:GobbleUp/src/data/constants.dart';
import 'package:GobbleUp/src/services/database_service.dart';
import 'package:GobbleUp/src/views/pages/home_pages/gobblerrootpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:GobbleUp/src/services/auth_service.dart';

class GobblerRegisterPage extends StatefulWidget {
  const GobblerRegisterPage({super.key});

  @override
  State<GobblerRegisterPage> createState() => _GobblerRegisterPageState();
}

class _GobblerRegisterPageState extends State<GobblerRegisterPage> {
  TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() async {
    try {
      final credential = await authService.value.createUser(
          email: emailController.text, password: passwordController.text);

      final uid = credential.user!.uid;

      await DatabaseService().create(
        path: 'Gobbler/$uid',
        data: {
          'username': nameController.text,
          'email': emailController.text,
          'savedResturants': [],
        },
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return GobblerRootPage();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: ${e.message}')),
      );
    }
  }

  void popPage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbler Account Creation'),
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

             SizedBox(
              width: double.infinity,
              child: Text(
                "User Details:",
                style: KTextStyle.titleTextStyle,
                textAlign: TextAlign.start,
              ),
            ),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),

            const SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                
              ),
              obscureText: true,
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                register();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
