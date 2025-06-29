import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../data/constants.dart';
import '../onboarding_pages/welcomepage.dart';

class GobblerProfilePage extends StatefulWidget {
  const GobblerProfilePage({super.key});

  @override
  State<GobblerProfilePage> createState() => _GobblerProfilePageState();
}

class _GobblerProfilePageState extends State<GobblerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(
            left: 5.0,
            top: 5.0,
            bottom: 5.0,
          ),
          child: Hero(
            tag: 2,
            child: Image(
              image: AssetImage('assets/images/gobbler.png'),
            ),
          ),
        ),
        title: Text(
            'Profile',
            style: KTextStyle.titleTextStyle
        ),
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 30),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/gobbler.png'),
              ),

              const SizedBox(height: 20),
              
              TextButton.icon(
                onPressed: () {
                  logout();
                  setState(() {
                    // Log out the user and navigate to the welcome page, removing the previous pages from stack
                    Navigator.of(context, rootNavigator: true)
                        .pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const WelcomePage()),
                      (route) => false,
                    );
                  });
                  // Handle logout action
                },
                icon: const Icon(Icons.logout),
                label: const Text(
                  'Log out',
                  style: KTextStyle.buttonTextStyle,
                ),
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Color(0xFFFFEADD)),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFFF6666)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to handle logout
  void logout() async {
    try {
      await authService.value.signOut();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: ${e.message}')),
      );
    }
  }
}
