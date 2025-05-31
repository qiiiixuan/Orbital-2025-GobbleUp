import 'package:flutter/material.dart';
import 'package:first_app/views/pages/home_pages/gobblerhomepage.dart';


class GobblerLoginPage extends StatefulWidget {
  const GobblerLoginPage({super.key});

  @override
  State<GobblerLoginPage> createState() => _GobblerLoginPageState();
}

class _GobblerLoginPageState extends State<GobblerLoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String confirmedUsername = '123';
  String confirmedPassword = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gobbler Login Page'),
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
                  image: AssetImage('assets/images/gobbler.png'),
                  height: 150.0,
                  width: 150.0,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () {
                setState(() {
                }
              );
              },
            ),
          Text(usernameController.text),

          const SizedBox(height: 20.0),

          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),

            onEditingComplete: () {
              setState(() {
              }
            );
            },
          ),

          Text(passwordController.text),

          ElevatedButton(onPressed: () {
            onLoginButtonPressed(); 
          }
          ,style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 50),
          ),
          child: Text('Login')),

        ],
        ),
      ),
    );
  }



 void onLoginButtonPressed() {
   if (usernameController.text == confirmedUsername &&
       passwordController.text == confirmedPassword) {
     var pushReplacement = Navigator.pushReplacement(context,
       MaterialPageRoute(
         builder: (context) {
           return GobblerHomePage();
           },
         ),
     );
   } else {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Invalid username or password')),
     );
   }
 }


}