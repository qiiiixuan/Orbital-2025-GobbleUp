// Account creation page
import 'package:GobbleUp/src/data/constants.dart';
import 'package:GobbleUp/src/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:GobbleUp/src/services/auth_service.dart';

class GobbledRegisterPage extends StatefulWidget {
  const GobbledRegisterPage({super.key});

  @override
  State<GobbledRegisterPage> createState() => _GobbledRegisterPageState();
}

class _GobbledRegisterPageState extends State<GobbledRegisterPage> {

  // Variables to be used
  TextEditingController nameController = TextEditingController();
  String? selectedCuisine;

  // Dropdown menu items (more to be added)
  List<String> cuisines = [
    'Western',
    'Chinese',
    'Italian',
  ];

  // Creating new data entry in database
  void createAccount() {
    DatabaseService().create(path: 'Gobbled/1', data: { //'1' to be replaced by UID
      'Name': nameController.text,
      'Cuisine': selectedCuisine,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbled Account Creation'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Hero(
                tag: 2,
                child: Image(
                  image: AssetImage('assets/images/gobbled.png'),
                  height: 150.0,
                  width: 150.0,
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            SizedBox(
              width: double.infinity,
              child: Text(
                "Restaurant Details:",
                style: KTextStyle.titleTextStyle,
                textAlign: TextAlign.start,
              ),
            ),

            const SizedBox(height: 20.0),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Restaurant Name',
              ),
            ),

            const SizedBox(height: 20.0),

            SizedBox(
              width: double.infinity,
              child: DropdownButton(
                alignment: AlignmentDirectional.centerStart,
                hint: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Cuisine'),
                ),
                value: selectedCuisine,
                items: cuisines.map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                )).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCuisine = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 50.0),

            ElevatedButton(
              onPressed: () {
                createAccount();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
