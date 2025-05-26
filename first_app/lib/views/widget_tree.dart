import 'package:first_app/data/notifiers.dart';
import 'package:first_app/views/pages/widget_tree_pages/homepage.dart';
import 'package:first_app/views/pages/widget_tree_pages/profilepage.dart';
import 'package:flutter/material.dart';

import 'widgets/navbar_widget.dart';

List<Widget> pages = [
  Homepage(),
  Profilepage()
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.food_bank),
        backgroundColor: Colors.teal,
        title: Text("GOBBLE UP"),
        centerTitle: true,
      ),

      body: ValueListenableBuilder(
        valueListenable: pageNotifier, 
        builder: (context, pageNumber, child) {
          return pages.elementAt(pageNumber);
        },
      ),
        
      bottomNavigationBar: NavbarWidget(),
    );
  }
}