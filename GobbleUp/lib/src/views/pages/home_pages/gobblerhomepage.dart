import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class GobblerHomePage extends StatefulWidget {
  const GobblerHomePage({super.key});

  @override
  State<GobblerHomePage> createState() => _GobblerHomePageState();
}

class _GobblerHomePageState extends State<GobblerHomePage> {
  // late Future<Map<String, dynamic>?> _randomRestaurantFuture1;
  int currentIndex = 0;
  final User? user = AuthService().currentUser;

  final List<Future<Map<String, dynamic>?>> RestaurantFutures = [
    DatabaseService().getRandomRestaurant(),
    DatabaseService().getRandomRestaurant(),
    DatabaseService().getRandomRestaurant(),
    DatabaseService().getRandomRestaurant(),
  ];

  @override
  void initState() {
    super.initState();
    // You can add any initialization logic here if needed
    // _randomRestaurantFuture1 = DatabaseService().getRandomRestaurant();
    // var _randomRestaurantFuture2 = DatabaseService().getRandomRestaurant();
  }

  FutureBuilder<Map<String, dynamic>?> buildRestaurantCard(
      Future<Map<String, dynamic>?> future) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('No restaurant data available.'));
        } else {
          final restaurant = snapshot.data!;
          return Container(
            color: Color.fromARGB(255, 240, 162, 162),
            alignment: Alignment.center,
            child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Restaurant Name: ${restaurant['username']}'),
                SizedBox(height: 10),
                Text('Location: ${restaurant['MRT']}'),
                SizedBox(height: 10),
                Text('Cuisine: ${restaurant['Cuisine']}'),
                SizedBox(height: 10),
                Text('Price Range: ${restaurant['PriceRange']}'),
                SizedBox(height: 10),
                Text('Signature Dish: ${restaurant['SignatureDish']}'),
                SizedBox(height: 10),
                Text('Description: ${restaurant['Description']}'),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbler Home Page'),
        automaticallyImplyLeading: false, // Disable back button
      ),
      // body: buildRestaurantCard(_randomRestaurantFuture1),
      body: CardSwiper(
        cardsCount: RestaurantFutures.length,
        cardBuilder:
            (context, index, percentThresholdX, percentThresholdY) => buildRestaurantCard(RestaurantFutures[index]),
       
      ),

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
