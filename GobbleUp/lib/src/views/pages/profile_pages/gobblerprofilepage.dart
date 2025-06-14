import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        title: Text('Gobbler Profile Page'),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/gobbler.png'),
              ),
              const SizedBox(height: 20),
              Text('This is the Profile Page!'),
              IconButton(
                tooltip: 'Logout',
                icon: Icon(Icons.logout),
                onPressed: () {
                  Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const WelcomePage()),
                    (route) => false,
                  );
                },
              ),
              TextButton.icon(
                onPressed: () {
                  logout();
                  setState(() {
                    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const WelcomePage()),
                    (route) => false,
                  );
                  });
                  // Handle logout action
                },
                icon: const Icon(Icons.logout),
                label: const Text('Log out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logout()async {
    try  {
      await authService.value.signOut();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: ${e.message}')),
      );
    }
  }
}
