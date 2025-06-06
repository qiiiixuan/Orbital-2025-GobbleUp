import 'package:flutter/material.dart';
import '../../data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageNotifier, 
      builder: (context, pageNumber, child) {
        return NavigationBar(destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"), 
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ], 
        onDestinationSelected: (int value) {
          pageNotifier.value = value;
        },
        selectedIndex: pageNumber,
        );
      },
    );
  }
}