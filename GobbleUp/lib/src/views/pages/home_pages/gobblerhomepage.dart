import 'package:GobbleUp/src/data/constants.dart';
import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../widgets/restaurantcard_widget.dart';

class GobblerHomePage extends StatefulWidget {
  const GobblerHomePage({super.key});

  @override
  State<GobblerHomePage> createState() => _GobblerHomePageState();
}

class _GobblerHomePageState extends State<GobblerHomePage> {
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
  }

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
          'Gobbler',
          style: KTextStyle.titleTextStyle,
        ),
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CardSwiper(
          cardsCount: RestaurantFutures.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
            return RestaurantCardFuture(future: RestaurantFutures[index]);
          },
        ),
      ),
    );
  }
}
