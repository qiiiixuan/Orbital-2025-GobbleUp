import 'package:GobbleUp/src/data/constants.dart';
import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/views/pages/profile_pages/gobbledupdateprofilepage.dart';
import 'package:GobbleUp/src/views/pages/profile_pages/gobblerprofilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../onboarding_pages/welcomepage.dart';

class GobbledProfilePage extends StatefulWidget {
  const GobbledProfilePage({super.key});

  @override
  State<GobbledProfilePage> createState() => _GobbledProfilePageState();
}

class _GobbledProfilePageState extends State<GobbledProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbled Profile Page'
            , style: KTextStyle.titleTextStyle),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/gobbled.png'),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                // margin: EdgeInsets.all(20.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 20),
                Text(
                  'Profile Page',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 20),
                
                ElevatedButton
                  (onPressed: (){
                    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // Add Profile Update Page here
                      return GobbleUpDateProfilePage();
                    },
                  ),
                );
                  },
                   style:ElevatedButton.styleFrom(
                    // backgroundColor: const Color.fromARGB(255, 144, 34, 34),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                  
                     child: Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                     ),
                   ),
                
                
                IconButton(
                  tooltip: 'Logout',
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    logout();
                    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const WelcomePage()),
                      (route) => false,
                    );
                  },
                ),
                SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () {
                    // Handle logout action
                    logout();
                    setState(() {
                      Navigator.of(context, rootNavigator: true)
                          .pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const WelcomePage()),
                        (route) => false,
                      );
                    });
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Log out', style: TextStyle(fontSize: 18)),
                ),
                ],
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
