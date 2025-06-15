// Account creation page
import 'package:GobbleUp/src/data/constants.dart';
import 'package:GobbleUp/src/services/auth_service.dart';
import 'package:GobbleUp/src/services/database_service.dart';
import 'package:GobbleUp/src/views/pages/home_pages/gobbledrootpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GobbledRegisterPage extends StatefulWidget {
  const GobbledRegisterPage({super.key});

  @override
  State<GobbledRegisterPage> createState() => _GobbledRegisterPageState();
}

class _GobbledRegisterPageState extends State<GobbledRegisterPage> {

  // Variables to be used
  // String uid = 'QHzu939l99fxgWkqYTBxK85tWTx1'; //to be replaced with user ID through Auth
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? selectedCuisine;

  // Dropdown menu items (more to be added)
  List<String> cuisines = [
    'Western',
    'Chinese',
    'Italian',
    'Indian',
    'Mexican',
    'Japanese',
    'Thai',
   
  ];

  // Creating new data entry in database
  // void createAccount() {
  //   DatabaseService().create(path: 'Gobbled/$uid', data: {
  //     'Name': nameController.text,
  //     'Cuisine': selectedCuisine,
  //   });
  // }

  void register() async {
    try {
      final credential = await authService.value.createUser(
          email: emailController.text, password: passwordController.text);

      final uid = credential.user!.uid;

      await DatabaseService().create(
        path: 'Gobbled/$uid',
        data: {
          'email': emailController.text,
          'username': nameController.text,
          'Cuisine': selectedCuisine,
        },
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return GobbledRootPage();
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: ${e.message}')),
      );
    }
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

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),

            const SizedBox(height: 20.0),

            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
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
                register();
              },
              style: KButtonStyle.elevatedButtonStyle,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
