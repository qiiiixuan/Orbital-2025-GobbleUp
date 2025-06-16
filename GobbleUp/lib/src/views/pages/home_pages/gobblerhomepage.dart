import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GobblerHomePage extends StatefulWidget {
  const GobblerHomePage({super.key});

  @override
  State<GobblerHomePage> createState() => _GobblerHomePageState();
}

class _GobblerHomePageState extends State<GobblerHomePage> {
  late Future<Map<String, dynamic>?> _randomRestaurantFuture;
  int currentIndex = 0;
  final User? user = AuthService().currentUser;

  @override
  void initState() {
    super.initState();
    // You can add any initialization logic here if needed
    _randomRestaurantFuture = DatabaseService().getRandomRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbler Home Page'),
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
          future: _randomRestaurantFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text('No restaurant data available.'));
            } else {
              final restaurant = snapshot.data!;
              return Column(
                children: [
                  Padding(padding: const EdgeInsets.all(16.0)),

                  SingleChildScrollView(    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Restaurant Name: ${restaurant['username']}'),
                        Text('Location: ${restaurant['MRT']}'),
                        Text('Cuisine: ${restaurant['Cuisine']}'),
                        Text('Price Range: ${restaurant['PriceRange']}'),
                        Text('Signature Dish: ${restaurant['SignatureDish']}'),
                        Text('Description: ${restaurant['Description']}'),
                      ],

                
                    ),
                  ),
                
                ],
              );
            }
          }),

      // SingleChildScrollView(
      //     child: Column(
      //   children: [
      //     Center(
      //       child: Text('Welcome to the Gobbler Home Page!'),
      //     ),
      //   ],
      // ))
    );
  }
}
