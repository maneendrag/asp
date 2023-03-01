import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/screen/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginScreen extends StackedHookView<LoginViewModel> {
  SizeConfigService sizeConfigService = locator<SizeConfigService>();
  @override
  Widget builder(BuildContext context, LoginViewModel model) {
    return model.isBusy
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : Scaffold(
            body: WillPopScope(
                child: SafeArea(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () =>
                                      model.navigateToLandingScreen(),
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  )),
                              const Text(
                                "Login",
                                style: TextStyle(
                                    color: Color(0xff3282B8),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: sizeConfigService.widthMultiplier * 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextField(
                              controller: model.loginEmailController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Color(0xffBBE1FA)),
                              decoration: const InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(color: Color(0xff3282B8)),
                                hintText: 'Enter Your Email',
                                hintStyle: TextStyle(color: Color(0xff3282B8)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color(0xffBBE1FA)), //<-- SEE HERE
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: sizeConfigService.widthMultiplier * 4.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextField(
                              obscureText: false,
                              controller: model.loginPasswordController,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Color(0xffBBE1FA)),
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle:
                                    const TextStyle(color: Color(0xff3282B8)),
                                hintText: 'Enter Your Password',
                                hintStyle:
                                    const TextStyle(color: Color(0xff3282B8)),
                                suffixIcon: model.obscureText
                                    ? IconButton(
                                        onPressed: model.playLoginObscure,
                                        icon: const Icon(Icons.remove_red_eye,
                                            color: Colors.white))
                                    : IconButton(
                                        onPressed: model.playLoginObscure,
                                        icon: Icon(
                                            Icons.remove_moderator_outlined,
                                            color: Colors.white)),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3,
                                      color: Color(0xffBBE1FA)), //<-- SEE HERE
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: sizeConfigService.widthMultiplier * 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: GestureDetector(
                              onTap: () {
                                print("tappen on screen login");
                                model.loginClicked();
                              },
                              // onTap: ()=> model.registerUsingEmailPassword(email: model.eMailController.text, password: model.passwordController.text),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 65, vertical: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    color: Color(0xff0F4C75)),
                                child: const Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Color(0xffBBE1FA)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onWillPop: () {
                  return model.navigateToLandingScreen();
                }),
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
