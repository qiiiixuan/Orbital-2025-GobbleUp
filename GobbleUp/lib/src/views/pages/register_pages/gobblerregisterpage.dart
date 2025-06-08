import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:GobbleUp/src/services/auth_service.dart';


class GobblerRegisterPage extends StatefulWidget {
 const GobblerRegisterPage({super.key});


 @override
 State<GobblerRegisterPage> createState() => _GobblerRegisterPageState();
}


class _GobblerRegisterPageState extends State<GobblerRegisterPage> {
 TextEditingController usernameController = TextEditingController();
 TextEditingController passwordController = TextEditingController();


 @override
 void dispose() {
   usernameController.dispose();
   passwordController.dispose();
   super.dispose();
 }


 void register() async {

  try {
    await authService.value.createUser(email: usernameController.text,
    password: passwordController.text
    );
  
   popPage();
  } on FirebaseAuthException catch (e) {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Registration failed: ${e.message}')),
     );
   }
   
 }


 void popPage() {
   Navigator.pop(context);
 }
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Gobbler Register Page'),
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
           ),
           const SizedBox(height: 20.0),
           TextField(
             controller: passwordController,
             decoration: InputDecoration(
               labelText: 'Password',
               border: OutlineInputBorder(),
             ),
             obscureText: true,
           ),

            const SizedBox(height: 50.0),

            ElevatedButton(
             onPressed: () {
               register();
             },
             style: ElevatedButton.styleFrom(
               minimumSize: Size(200, 50),
             ),
             child: Text('Register'),
           ),
         ],
       ),
     ),
   );
 }
}
