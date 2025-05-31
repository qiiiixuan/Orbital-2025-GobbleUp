// import 'package:flutter/material.dart';

// class GobblerProfilePage extends StatefulWidget {
//   const GobblerProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gobbler Profile Page'),
//         automaticallyImplyLeading: true,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/images/gobbler.png'),
//               ),
//               const SizedBox(height: 20),
//               Text('This is the Profile Page!'),
//               IconButton(
//                 tooltip: 'Logout',
//                 icon: Icon(Icons.logout),
//                 onPressed: () {
//                   // Handle logout action
//                   Navigator.pop(context); // Navigate back to the previous page
//                 },
//               ),
//               TextButton.icon(
//                 onPressed: () {
//                   // Handle logout action
//                   Navigator.pop(context); // Navigate back to the previous page
//                 },
//                 icon: const Icon(Icons.logout),
//                 label: const Text('Log out'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
  

// }