import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/enums/app_enums.dart';
import 'package:asp_base/screen/home/home_screen.dart';
import 'package:asp_base/screen/login/login_view_model.dart';
import 'package:asp_base/screen/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'signUpScreen.dart';

class LandingScreen extends StatelessWidget {

  final NavigationService navigationService = locator<NavigationService>();

  LandingScreen({super.key});



  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<LoginViewModel>.reactive(viewModelBuilder: ()=>LoginViewModel(),
        builder: (context, model,child){
          switch(model.currentView){
            case LoginScreenView.signUpScreen:
              return const SignUpScreen();
            case LoginScreenView.landingScreen:
              return Scaffold(
                body: Container(
                  color: Colors.red,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: ()=> model.navigateToLoginScreen(),
                        child: Container(
                          width: 125,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28), color: Colors.teal),
                          child: const Center(child: Text("Login"),),
                        ),
                      ),
                      const SizedBox(height: 65,),
                      GestureDetector(
                        onTap: ()=> model.navigateToSignUpScreen(),
                        child: Container(
                          height: 75,
                          width: 125,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28), color: Colors.teal),
                          child: const Center(child: Text("Sign Up"),),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            case LoginScreenView.loginScreen:
              return const LoginScreen();
            case LoginScreenView.homeScreen:
              return const HomeScreen();
          }

        });

  }
}
