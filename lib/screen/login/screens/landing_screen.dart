import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/enums/app_enums.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/screen/home/home_screen.dart';
import 'package:asp_base/screen/login/login_view_model.dart';
import 'package:asp_base/screen/login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'signUpScreen.dart';

class LandingScreen extends StatelessWidget {

  final NavigationService navigationService = locator<NavigationService>();
  final SizeConfigService sizeConfigService = locator<SizeConfigService>();

  LandingScreen({super.key});



  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<LoginViewModel>.reactive(viewModelBuilder: ()=>LoginViewModel(),
        builder: (context, model,child){
          switch(model.currentView){
            case LoginScreenView.signUpScreen:
              return SignUpScreen();
            case LoginScreenView.landingScreen:
              return Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 10,),
                    Image.asset(
                      "assets/logo.png",
                      height: sizeConfigService.heightMultiplier * 25,
                      width: sizeConfigService.heightMultiplier * 28,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: ()=> model.navigateToLoginScreen(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28), color: const Color(0xff0F4C75)),
                                child: const Center(child: Text("Login", style: TextStyle(color: Color(0xffBBE1FA)),),),
                              ),
                            ),

                            const SizedBox(width: 18,),

                            GestureDetector(
                              onTap: ()=> model.navigateToSignUpScreen(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28), color: Color(0xff0F4C75)),
                                child: const Center(child: Text("Sign UP", style: TextStyle(color: Color(0xffBBE1FA)),),),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 45,)
                      ],
                    ),
                  ],
                ),
              );
            case LoginScreenView.loginScreen:
              return LoginScreen();
            case LoginScreenView.homeScreen:
              return const HomeScreen();
          }

        });

  }
}
