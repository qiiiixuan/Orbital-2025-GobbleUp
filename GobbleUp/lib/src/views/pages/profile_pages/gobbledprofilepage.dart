import 'package:GobbleUp/src/data/constants.dart';
import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/services/database_service.dart';
import 'package:GobbleUp/src/views/pages/profile_pages/gobbledupdateprofilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/restaurantcard_widget.dart';
import '../onboarding_pages/welcomepage.dart';

class GobbledProfilePage extends StatefulWidget {
  const GobbledProfilePage({super.key});

  @override
  State<GobbledProfilePage> createState() => _GobbledProfilePageState();
}

class _GobbledProfilePageState extends State<GobbledProfilePage> {

  Future<Map<String, dynamic>?> restaurantFuture = DatabaseService().getRestaurant(
      uid: AuthService().currentUser!.uid,
  );

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
            tag: 1,
            child: Image(
              image: AssetImage('assets/images/gobbled.png'),
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

              RestaurantCardFuture(future: restaurantFuture),
              SizedBox(height: 20),

              // Add Profile Update Page here
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return GobbleUpDateProfilePage();
                        // Allow the user to update their profile
                      },
                    ),
                  );
                },
                child: Text(
                  'Edit Profile',
                  style: KTextStyle.buttonTextStyle,
                ),
              ),

              SizedBox(height: 20),

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
