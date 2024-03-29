// import 'package:flutter/material.dart';
// import 'package:liveasy_logistics_assignment_app/provider/auth_provider.dart';
// import 'package:liveasy_logistics_assignment_app/screens/welcome_screen.dart';

// import 'package:provider/provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ap = Provider.of<AuthProvider>(context, listen: false);

//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               backgroundColor: Colors.purple,
//               backgroundImage: NetworkImage(ap.userModel.profilePic),
//               radius: 50,
//             ),
//             SizedBox(height: 20),
//             Text(ap.userModel.name),
//             Text(ap.userModel.phoneNumber),
//             Text(ap.userModel.email),
//             Text(ap.userModel.bio),
//             SizedBox(height: 50), // Add some space between user info and button
//             ElevatedButton(
//               onPressed: () {
//                 ap.userSignOut().then((value) {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const WelcomeScreen(),
//                     ),
//                   );
//                 });
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Logout',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:liveasy_logistics_assignment_app/provider/auth_provider.dart';
import 'package:liveasy_logistics_assignment_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              authProvider.userSignOut().then((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
