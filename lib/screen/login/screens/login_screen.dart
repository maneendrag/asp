import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/enums/app_enums.dart';
import 'package:asp_base/screen/home/home_screen.dart';
import 'package:asp_base/screen/login/login_view_model.dart';
import 'package:asp_base/screen/login/screens/landing_screen.dart';
import 'package:asp_base/screen/login/screens/signUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  NavigationService navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(


        builder: (context, model, child) {

          return Scaffold(body: Center(child: Text("login screen"),),);

        },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

// class LoginScreen1 extends StatefulWidget {
//   const LoginScreen1({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen1> createState() => _LoginScreen1State();
// }
//
// class _LoginScreen1State extends State<LoginScreen1> {
//   Future<User?> registerUsingEmailPassword() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//         email: "m.045@gmail.com",
//         password: "password@2021",
//       );
//       user = userCredential.user;
//       await user!.updateDisplayName("Mtest--password@2021");
//       await user.reload();
//       user = auth.currentUser;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//     return user;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Center(
//             child: GestureDetector(
//               onTap: registerUsingEmailPassword,
//               child: Container(
//                 height: 75,
//                 width: 125,
//                 color: Colors.yellow,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 320,
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: () async {
//                 try {
//                   UserCredential userCredential = await FirebaseAuth.instance
//                       .signInWithEmailAndPassword(
//                           email: "testweb@gmail.com",
//                           password: "Maneendra@2021");
//                   print("Success Login");
//                   print(
//                       "Login Details ------------> ${userCredential.user!.email}");
//                 } on FirebaseAuthException catch (e) {
//                   if (e.code == 'user-not-found') {
//                     print('No user found for that email.');
//                   } else if (e.code == 'wrong-password') {
//                     print('Wrong password provided for that user.');
//                   }
//                 }
//               },
//               child: Container(
//                 height: 75,
//                 width: 125,
//                 color: Colors.red,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
