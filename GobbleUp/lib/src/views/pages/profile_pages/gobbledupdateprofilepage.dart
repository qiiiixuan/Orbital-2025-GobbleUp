import 'package:flutter/material.dart';
import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/views/pages/onboarding_pages/welcomepage.dart';
import 'package:GobbleUp/src/views/pages/profile_pages/gobblerprofilepage.dart';



class GobbleUpDateProfilePage extends StatefulWidget {
  const GobbleUpDateProfilePage({super.key});

  @override
  State<GobbleUpDateProfilePage> createState() => _GobbleUpDateProfilePageState();
}

class _GobbleUpDateProfilePageState extends State<GobbleUpDateProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile Page'),
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
                backgroundImage: AssetImage('assets/images/gobbler.png'),
              ),
              const SizedBox(height: 20),
              Text('This is the Update Profile Page!'),
              IconButton(
                tooltip: 'Logout',
                icon: Icon(Icons.logout),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const WelcomePage()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}